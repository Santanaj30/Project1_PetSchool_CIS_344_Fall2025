-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Project1CIS344
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Project1CIS344
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Project1CIS344` DEFAULT CHARACTER SET utf8 ;
USE `Project1CIS344` ;

-- -----------------------------------------------------
-- Table `Project1CIS344`.`Owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project1CIS344`.`Owner` (
  `OwnerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(100) NULL,
  `Phone` VARCHAR(20) NULL,
  PRIMARY KEY (`OwnerID`),
  UNIQUE INDEX `Phone_UNIQUE` (`Phone` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project1CIS344`.`Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project1CIS344`.`Pet` (
  `PetID` INT NOT NULL AUTO_INCREMENT,
  `PetName` VARCHAR(50) NOT NULL,
  `Species` VARCHAR(30) NULL,
  `Breed` VARCHAR(45) NULL,
  `OwnerID` INT NOT NULL,
  PRIMARY KEY (`PetID`),
  INDEX `ownerID_idx` (`OwnerID` ASC) VISIBLE,
  CONSTRAINT `ownerID`
    FOREIGN KEY (`OwnerID`)
    REFERENCES `Project1CIS344`.`Owner` (`OwnerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project1CIS344`.`Course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project1CIS344`.`Course` (
  `CourseID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(100) NOT NULL,
  `Description` VARCHAR(200) NULL,
  `Price` DECIMAL(7,2) NULL,
  PRIMARY KEY (`CourseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project1CIS344`.`Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project1CIS344`.`Trainer` (
  `TrainerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Speciality` VARCHAR(100) NULL,
  PRIMARY KEY (`TrainerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project1CIS344`.`Enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project1CIS344`.`Enrollment` (
  `EnrollmentID` INT NOT NULL AUTO_INCREMENT,
  `PetID` INT NOT NULL,
  `TrainerID` INT NOT NULL,
  `CourseID` INT NOT NULL,
  `Status` ENUM('Enrolled', 'Completed', 'Cancelled') NULL DEFAULT 'Enrolled',
  PRIMARY KEY (`EnrollmentID`),
  INDEX `PetID_idx` (`PetID` ASC) VISIBLE,
  INDEX `CourseID_idx` (`CourseID` ASC) VISIBLE,
  INDEX `TrainerID_idx` (`TrainerID` ASC) VISIBLE,
  CONSTRAINT `PetID`
    FOREIGN KEY (`PetID`)
    REFERENCES `Project1CIS344`.`Pet` (`PetID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `Project1CIS344`.`Course` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TrainerID`
    FOREIGN KEY (`TrainerID`)
    REFERENCES `Project1CIS344`.`Trainer` (`TrainerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
