DROP DATABASE chat;

CREATE DATABASE chat;

USE chat;

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Messages'
-- 
-- ---

DROP TABLE IF EXISTS `Messages`;
		
CREATE TABLE `Messages` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(44) NULL DEFAULT NULL,
  `Text` VARCHAR(444) NULL DEFAULT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT NULL,
  `id_Users` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Rooms'
-- 
-- ---

DROP TABLE IF EXISTS `Rooms`;
		
CREATE TABLE `Rooms` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(44) NULL DEFAULT NULL,
  `id_Messages` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Users'
-- 
-- ---

DROP TABLE IF EXISTS `Users`;
		
CREATE TABLE `Users` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Friends'
-- 
-- ---

DROP TABLE IF EXISTS `Friends`;
		
CREATE TABLE `Friends` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `userId` INTEGER NULL DEFAULT NULL,
  `friendId` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Messages` ADD FOREIGN KEY (id_Users) REFERENCES `Users` (`id`);
ALTER TABLE `Rooms` ADD FOREIGN KEY (id_Messages) REFERENCES `Messages` (`id`);
ALTER TABLE `Friends` ADD FOREIGN KEY (userId) REFERENCES `Users` (`id`);
ALTER TABLE `Friends` ADD FOREIGN KEY (friendId) REFERENCES `Users` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Friends` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Messages` (`id`,`user`,`Text`,`timestamp`,`id_Users`) VALUES
-- ('','','','','');
-- INSERT INTO `Rooms` (`id`,`Name`,`id_Messages`) VALUES
-- ('','','');
-- INSERT INTO `Users` (`id`) VALUES
-- ('');
-- INSERT INTO `Friends` (`id`,`userId`,`friendId`) VALUES
-- ('','','');

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

