-- MySQL Script generated by MySQL Workbench
-- Mon 28 Dec 2020 10:33:57 AM EST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cocka2_notes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cocka2_notes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cocka2_notes` ;
USE `cocka2_notes` ;

-- -----------------------------------------------------
-- Table `cocka2_notes`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cocka2_notes`.`user` (
  `email` VARCHAR(75) NOT NULL,
  `password` VARCHAR(75) NOT NULL,
  `web_enabled` TINYINT NOT NULL DEFAULT 0,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cocka2_notes`.`note`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cocka2_notes`.`note` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `type` VARCHAR(10) NOT NULL DEFAULT 'checkbox',
  `owner_email` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_note_user1_idx` (`owner_email` ASC) VISIBLE,
  CONSTRAINT `fk_note_user1`
    FOREIGN KEY (`owner_email`)
    REFERENCES `cocka2_notes`.`user` (`email`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cocka2_notes`.`checkbox_note_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cocka2_notes`.`checkbox_note_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(150) NULL,
  `checked` TINYINT NOT NULL DEFAULT 0,
  `note_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_checkbox_note_item_note1_idx` (`note_id` ASC) VISIBLE,
  CONSTRAINT `fk_checkbox_note_item_note1`
    FOREIGN KEY (`note_id`)
    REFERENCES `cocka2_notes`.`note` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cocka2_notes`.`note_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cocka2_notes`.`note_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(500) NULL,
  `note_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_note_item_note1_idx` (`note_id` ASC) VISIBLE,
  CONSTRAINT `fk_note_item_note1`
    FOREIGN KEY (`note_id`)
    REFERENCES `cocka2_notes`.`note` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cocka2_notes`.`note_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cocka2_notes`.`note_users` (
  `user_email` VARCHAR(75) NOT NULL,
  `note_id` BIGINT NOT NULL,
  INDEX `fk_note_users_user1_idx` (`user_email` ASC) VISIBLE,
  INDEX `fk_note_users_note1_idx` (`note_id` ASC) VISIBLE,
  CONSTRAINT `fk_note_users_user1`
    FOREIGN KEY (`user_email`)
    REFERENCES `cocka2_notes`.`user` (`email`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_note_users_note1`
    FOREIGN KEY (`note_id`)
    REFERENCES `cocka2_notes`.`note` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
