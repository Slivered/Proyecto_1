-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyecto_etl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_etl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_etl` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_etl` ;

-- -----------------------------------------------------
-- Table `proyecto_etl`.`casting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`casting` (
  `idCasting` INT NOT NULL AUTO_INCREMENT,
  `Director` VARCHAR(45) NULL,
  `Estrella_1` VARCHAR(45) NULL,
  `Estrella_2` VARCHAR(45) NULL,
  `Estrella_3` VARCHAR(45) NULL,
  `Estrella_4` VARCHAR(45) NULL,
  PRIMARY KEY (`idCasting`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`libros` (
  `idLibros` INT NOT NULL AUTO_INCREMENT,
  `Autor_libro` VARCHAR(45) NULL,
  `Nota_promedio_libro` DECIMAL(30,2) NULL,
  `Votos_libro` DECIMAL(30,2) NULL,
  PRIMARY KEY (`idLibros`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`rating` (
  `idRating` INT NOT NULL AUTO_INCREMENT,
  `IMDB_rating` DECIMAL(30,2) NOT NULL,
  `Votos_IMDB` INT NOT NULL,
  PRIMARY KEY (`idRating`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`peliculas` (
  `idPeliculas` INT NOT NULL AUTO_INCREMENT,
  `Series_Title` VARCHAR(45) NOT NULL,
  `Released_Year` INT NOT NULL,
  `Runtime` VARCHAR(45) NOT NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `Overview` VARCHAR(1000) NOT NULL,
  `Gross` DECIMAL(30,2) NOT NULL,
  `casting_idCasting` INT NOT NULL,
  `rating_idRating` INT NOT NULL,
  `libros_idLibros` INT NOT NULL,
  PRIMARY KEY (`idPeliculas`),
  INDEX `fk_peliculas_casting_idx` (`casting_idCasting` ASC) VISIBLE,
  INDEX `fk_peliculas_rating1_idx` (`rating_idRating` ASC) VISIBLE,
  INDEX `fk_peliculas_libros1_idx` (`libros_idLibros` ASC) VISIBLE,
  CONSTRAINT `fk_peliculas_casting`
    FOREIGN KEY (`casting_idCasting`)
    REFERENCES `proyecto_etl`.`casting` (`idCasting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peliculas_rating1`
    FOREIGN KEY (`rating_idRating`)
    REFERENCES `proyecto_etl`.`rating` (`idRating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peliculas_libros1`
    FOREIGN KEY (`libros_idLibros`)
    REFERENCES `proyecto_etl`.`libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 533
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
