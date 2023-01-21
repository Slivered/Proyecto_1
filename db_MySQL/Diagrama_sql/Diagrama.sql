-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_etl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_etl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_etl` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_etl` ;

-- -----------------------------------------------------
-- Table `proyecto_etl`.`Director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`Director` (
  `idDirector` INT NOT NULL,
  `Director` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDirector`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`Autor` (
  `idAutor` INT NOT NULL,
  `Autor_libro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`libros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`libros` (
  `idLibros` INT NOT NULL,
  `Nota_promedio_libro` DECIMAL(30,2) NOT NULL,
  `Votos_libro` INT NOT NULL,
  `Autor_idAutor` INT NOT NULL,
  PRIMARY KEY (`idLibros`),
  INDEX `fk_libros_Autor1_idx` (`Autor_idAutor` ASC) VISIBLE,
  CONSTRAINT `fk_libros_Autor1`
    FOREIGN KEY (`Autor_idAutor`)
    REFERENCES `proyecto_etl`.`Autor` (`idAutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`rating` (
  `idRating` INT NOT NULL,
  `IMDB_rating` DECIMAL(30,2) NOT NULL,
  `Votos_IMDB` INT NOT NULL,
  PRIMARY KEY (`idRating`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `proyecto_etl`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_etl`.`peliculas` (
  `idPeliculas` INT NOT NULL,
  `Series_Title` LONGTEXT NOT NULL,
  `Released_Year` INT NOT NULL,
  `Runtime` LONGTEXT NOT NULL,
  `Genre` LONGTEXT NOT NULL,
  `Overview` LONGTEXT NOT NULL,
  `rating_idRating` INT NOT NULL,
  `libros_idLibros` INT NOT NULL,
  `Director_idDirector` INT NOT NULL,
  PRIMARY KEY (`idPeliculas`),
  INDEX `fk_peliculas_rating1_idx` (`rating_idRating` ASC) VISIBLE,
  INDEX `fk_peliculas_libros1_idx` (`libros_idLibros` ASC) VISIBLE,
  INDEX `fk_peliculas_Director1_idx` (`Director_idDirector` ASC) VISIBLE,
  CONSTRAINT `fk_peliculas_rating1`
    FOREIGN KEY (`rating_idRating`)
    REFERENCES `proyecto_etl`.`rating` (`idRating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peliculas_libros1`
    FOREIGN KEY (`libros_idLibros`)
    REFERENCES `proyecto_etl`.`libros` (`idLibros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_peliculas_Director1`
    FOREIGN KEY (`Director_idDirector`)
    REFERENCES `proyecto_etl`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 533
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
