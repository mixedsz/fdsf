-- Database Migration Script for FiveM Framework
-- Run this script to create all required tables and columns

-- Add 'paid' column to billing table if it doesn't exist
ALTER TABLE `billing` ADD COLUMN IF NOT EXISTS `paid` TINYINT(1) DEFAULT 0;

-- Create gangs table if it doesn't exist
CREATE TABLE IF NOT EXISTS `gangs` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    `owner` VARCHAR(60) DEFAULT NULL,
    `bank` INT(11) DEFAULT 0,
    `kills` INT(11) DEFAULT 0,
    `turfs` INT(11) DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create gang_members table WITHOUT foreign key (avoids collation mismatch)
CREATE TABLE IF NOT EXISTS `gang_members` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(60) NOT NULL,
    `gang` VARCHAR(50) NOT NULL DEFAULT 'none',
    `rank` INT(11) DEFAULT 0,
    `rank_label` VARCHAR(50) DEFAULT 'Member',
    `joined_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier` (`identifier`),
    KEY `gang` (`gang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create bans table if it doesn't exist
CREATE TABLE IF NOT EXISTS `bans` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(60) NOT NULL,
    `reason` TEXT,
    `expire` BIGINT(20) DEFAULT 0,
    `banner` VARCHAR(60) DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create player_outfits table if it doesn't exist
CREATE TABLE IF NOT EXISTS `player_outfits` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(60) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `model` VARCHAR(50) DEFAULT NULL,
    `components` LONGTEXT DEFAULT NULL,
    `props` LONGTEXT DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Add kills and turfs columns to gangs table if they don't exist
-- (needed if gangs table was created before these columns were added)
ALTER TABLE `gangs` ADD COLUMN IF NOT EXISTS `kills` INT(11) DEFAULT 0;
ALTER TABLE `gangs` ADD COLUMN IF NOT EXISTS `turfs` INT(11) DEFAULT 0;

-- Ensure owned_vehicles has all required columns
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `type` VARCHAR(50) DEFAULT 'car';
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `job` VARCHAR(50) DEFAULT NULL;
ALTER TABLE `owned_vehicles` ADD COLUMN IF NOT EXISTS `stored` TINYINT(1) DEFAULT 1;

-- Ensure users table has required columns for registration
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `firstname` VARCHAR(50) DEFAULT NULL;
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `lastname` VARCHAR(50) DEFAULT NULL;
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `dateofbirth` VARCHAR(20) DEFAULT NULL;
ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `sex` VARCHAR(10) DEFAULT NULL;
