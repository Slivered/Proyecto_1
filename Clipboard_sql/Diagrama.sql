-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Proyecto_ETL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Proyecto_ETL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto_ETL` DEFAULT CHARACTER SET utf8 ;
USE `Proyecto_ETL` ;

-- -----------------------------------------------------
-- Table `Proyecto_ETL`.`Casting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_ETL`.`Casting` (
  `idCasting` INT NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  `Estrella_1` VARCHAR(45) NOT NULL,
  `Estrella_2` VARCHAR(45) NOT NULL,
  `Estrella_3` VARCHAR(45) NOT NULL,
  `Estrella_4` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCasting`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_ETL`.`Libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_ETL`.`Libros` (
  `idLibros` INT NOT NULL,
  `Autor_libro` VARCHAR(45) NOT NULL,
  `Nota_promedio_libro` DECIMAL(30) NOT NULL,
  `Votos_libro` DECIMAL(30) NOT NULL,
  PRIMARY KEY (`idLibros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_ETL`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_ETL`.`Rating` (
  `idRating` INT NOT NULL,
  `Meta_rating` DECIMAL(30) NOT NULL,
  `IMDB_rating` INT(30) NOT NULL,
  `Votos_IMDB` INT(30) NOT NULL,
  PRIMARY KEY (`idRating`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_ETL`.`Peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_ETL`.`Peliculas` (
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
    REFERENCES `Proyecto_ETL`.`Casting` (`idCasting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_Libros1`
    FOREIGN KEY (`Libros_idLibros`)
    REFERENCES `Proyecto_ETL`.`Libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Peliculas_Rating1`
    FOREIGN KEY (`Rating_idRating` , `Rating_Peliculas_idPeliculas`)
    REFERENCES `Proyecto_ETL`.`Rating` (`idRating` , `Votos_IMDB`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
