-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `disciplineID` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateLastModified` datetime NOT NULL,
  `addedBy` int(11) unsigned NOT NULL,
  `lastModifiedBy` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disciplineID` (`disciplineID`),
  KEY `addedBy` (`addedBy`),
  KEY `lastModifiedBy` (`lastModifiedBy`),
  CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`disciplineID`) REFERENCES `disciplines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`addedBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`lastModifiedBy`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleID` int(11) NOT NULL,
  `userArticleID` int(11) NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateLastModified` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `articleID` (`articleID`),
  KEY `userArticleID` (`userArticleID`),
  KEY `userID` (`userID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`articleID`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userArticleID`) REFERENCES `user-articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homePageGuest` text COLLATE utf8_bin NOT NULL,
  `homePageUser` text COLLATE utf8_bin NOT NULL,
  `aboutUs` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `code` varchar(3) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `disciplines`;
CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `olimpic-venue`;
CREATE TABLE `olimpic-venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `longitude` varchar(10) COLLATE utf8_bin NOT NULL,
  `latitude` varchar(10) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(60) COLLATE utf8_bin NOT NULL,
  `photo` blob NOT NULL,
  `countryID` int(11) NOT NULL,
  `disciplineID` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `description` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `countryID` (`countryID`),
  KEY `disciplineID` (`disciplineID`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `players_ibfk_2` FOREIGN KEY (`disciplineID`) REFERENCES `disciplines` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteName` varchar(45) COLLATE utf8_bin NOT NULL,
  `contactEmail` varchar(60) COLLATE utf8_bin NOT NULL,
  `debugEmail` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `user-articles`;
CREATE TABLE `user-articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `rating` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `dateAdded` datetime NOT NULL,
  `dateLastModified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  CONSTRAINT `user-articles_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin NOT NULL,
  `pass` varchar(60) COLLATE utf8_bin NOT NULL,
  `accountType` enum('U','A') COLLATE utf8_bin NOT NULL DEFAULT 'U',
  `fullName` varchar(60) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `city` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(20) COLLATE utf8_bin NOT NULL,
  `dateRegistration` datetime NOT NULL,
  `dateLastLogin` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


-- 2016-08-04 15:58:58
