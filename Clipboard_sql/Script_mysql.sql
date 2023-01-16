-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Casting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Casting` (
  `idCasting` INT NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Estrella_1` VARCHAR(45) NOT NULL,
  `Estrella_2` VARCHAR(45) NOT NULL,
  `Estrella_3` VARCHAR(45) NOT NULL,
  `Estrella_4` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCasting`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Libros` (
  `idLibros` INT NOT NULL,
  `Autor_libro` VARCHAR(45) NOT NULL,
  `Nota_promedio_libro` DECIMAL(30) NOT NULL,
  `Votos_libro` DECIMAL(30) NOT NULL,
  PRIMARY KEY (`idLibros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rating` (
  `idRating` INT NOT NULL,
  `Meta_rating` DECIMAL(30) NOT NULL,
  `IMDB_rating` INT(30) NOT NULL,
  `Peliculas_idPeliculas` INT NOT NULL,
  PRIMARY KEY (`idRating`, `Peliculas_idPeliculas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peliculas` (
  `idPeliculas` INT NOT NULL,
  `Series_Title` VARCHAR(45) NOT NULL,
  `Released_Year` INT NOT NULL,
  `Runtime` VARCHAR(45) NOT NULL,
  `Genre` VARCHAR(45) NOT NULL,
  `Overview` VARCHAR(45) NOT NULL,
  `Gross` DECIMAL(30) NOT NULL,
  `Casting_idCasting` INT NOT NULL,
  `Libros_idLibros` INT NOT NULL,
  `Rating_idRating` INT NOT NULL,
  `Rating_Peliculas_idPeliculas` INT NOT NULL,
  PRIMARY KEY (`idPeliculas`),
  INDEX `fk_Peliculas_Casting_idx` (`Casting_idCasting` ASC) VISIBLE,
  INDEX `fk_Peliculas_Libros1_idx` (`Libros_idLibros` ASC) VISIBLE,
  INDEX `fk_Peliculas_Rating1_idx` (`Rating_idRating` ASC, `Rating_Peliculas_idPeliculas` ASC) VISIBLE,
  CONSTRAINT `fk_Peliculas_Casting`
    FOREIGN KEY (`Casting_idCasting`)
    REFERENCES `mydb`.`Casting` (`idCasting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_Libros1`
    FOREIGN KEY (`Libros_idLibros`)
    REFERENCES `mydb`.`Libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_Rating1`
    FOREIGN KEY (`Rating_idRating` , `Rating_Peliculas_idPeliculas`)
    REFERENCES `mydb`.`Rating` (`idRating` , `Peliculas_idPeliculas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
