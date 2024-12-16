-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema group-s09_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema group-s09_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `group-s09_db` DEFAULT CHARACTER SET utf8 ;
USE `group-s09_db` ;

-- -----------------------------------------------------
-- Table `group-s09_db`.`Soil_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Soil_type` (
  `soil_type_id` INT NOT NULL,
  `soil_name` VARCHAR(45) NOT NULL,
  `soil_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`soil_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Habitat_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Habitat_type` (
  `habitat_type_id` INT NOT NULL,
  `habitat_name` VARCHAR(45) NOT NULL,
  `habitat_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`habitat_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Habitat` (
  `habitat_id` INT NOT NULL,
  `avg_temp` DECIMAL(10,2) NOT NULL,
  `elevation` INT NOT NULL,
  `habitat_type_id` INT NOT NULL,
  `soil_type_id` INT NOT NULL,
  PRIMARY KEY (`habitat_id`),
  INDEX `fk_Habitat_Habitat_type_idx` (`habitat_type_id` ASC) VISIBLE,
  INDEX `fk_Habitat_Soil_type1_idx` (`soil_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_Habitat_Habitat_type`
    FOREIGN KEY (`habitat_type_id`)
    REFERENCES `group-s09_db`.`Habitat_type` (`habitat_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habitat_Soil_type1`
    FOREIGN KEY (`soil_type_id`)
    REFERENCES `group-s09_db`.`Soil_type` (`soil_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Species`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Species` (
  `species_id` INT NOT NULL,
  `species_name` VARCHAR(45) NOT NULL,
  `height` DECIMAL(10,2) NOT NULL,
  `rescue_date` DATE NOT NULL,
  `release_date` DATE NULL,
  PRIMARY KEY (`species_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Species_habitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Species_habitat` (
  `species_id` INT NOT NULL,
  `habitat_id` INT NOT NULL,
  PRIMARY KEY (`species_id`, `habitat_id`),
  INDEX `fk_Species_habitat_Habitat1_idx` (`habitat_id` ASC) VISIBLE,
  CONSTRAINT `fk_Species_habitat_Species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `group-s09_db`.`Species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Species_habitat_Habitat1`
    FOREIGN KEY (`habitat_id`)
    REFERENCES `group-s09_db`.`Habitat` (`habitat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Enclosure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Enclosure` (
  `enclosure_number` INT NOT NULL,
  `enclosure_area` DECIMAL(10,2) NOT NULL,
  `aquatic_yn` BIT(1) NOT NULL,
  `enclosure_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`enclosure_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Animal` (
  `species_id` INT NOT NULL,
  `animal_group` VARCHAR(45) NOT NULL,
  `weight` DECIMAL(10,2) NULL,
  `enclosure_number` INT NULL,
  PRIMARY KEY (`species_id`),
  CONSTRAINT `fk_Animal_Enclosure1`
    FOREIGN KEY (`enclosure_number`)
    REFERENCES `group-s09_db`.`Enclosure` (`enclosure_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Animal_Species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `group-s09_db`.`Species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Plant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Plant` (
  `species_id` INT NOT NULL,
  `plant_group` VARCHAR(45) NOT NULL,
  `upright_yn` BIT(1) NOT NULL,
  PRIMARY KEY (`species_id`),
  CONSTRAINT `fk_Plant_Species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `group-s09_db`.`Species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Study`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Study` (
  `study_id` INT NOT NULL,
  `study_title` VARCHAR(45) NOT NULL,
  `study_desc` VARCHAR(45) NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `species_id` INT NOT NULL,
  PRIMARY KEY (`study_id`),
  INDEX `fk_Study_Species1_idx` (`species_id` ASC) VISIBLE,
  CONSTRAINT `fk_Study_Species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `group-s09_db`.`Species` (`species_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `group-s09_db`.`Researcher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `group-s09_db`.`Researcher` (
  `researcher_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NULL,
  `study_id` INT NULL,
  `supervisor_id` INT NULL,
  PRIMARY KEY (`researcher_id`),
  INDEX `fk_Researcher_Study1_idx` (`study_id` ASC) VISIBLE,
  INDEX `fk_Researcher_Researcher1_idx` (`supervisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Researcher_Study1`
    FOREIGN KEY (`study_id`)
    REFERENCES `group-s09_db`.`Study` (`study_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Researcher_Researcher1`
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `group-s09_db`.`Researcher` (`researcher_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;