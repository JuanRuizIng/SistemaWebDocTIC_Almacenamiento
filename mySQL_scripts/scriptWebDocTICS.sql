-- MySQL Script generated by MySQL Workbench
-- Wed Aug 21 10:59:07 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SistemaWebDocTICSchema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SistemaWebDocTICSchema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SistemaWebDocTICSchema` DEFAULT CHARACTER SET utf8 ;
USE `SistemaWebDocTICSchema` ;

-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(125) NOT NULL,
  `deptoOrigen` VARCHAR(65) NOT NULL,
  `ciudadOrigen` VARCHAR(65) NOT NULL,
  `correoUsuario` VARCHAR(100) NOT NULL,
  `preguntaSecreta` VARCHAR(150) NOT NULL,
  `respPregunSecre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `correoUsuario_UNIQUE` (`correoUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Contraseña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Contraseña` (
  `idContraseña` INT NOT NULL AUTO_INCREMENT,
  `contraseña` VARCHAR(150) NOT NULL,
  `estado` ENUM('Activa', 'Inactiva') NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idContraseña`),
  INDEX `fk_CONTRASEÑA_USUARIO_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_CONTRASEÑA_USUARIO`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Documento` (
  `idDocumento` INT NOT NULL AUTO_INCREMENT,
  `tituloDoc` VARCHAR(300) NOT NULL,
  `visibilidad` ENUM('Publico', 'Privado') NOT NULL,
  `URL` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idDocumento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Comentario` (
  `idComentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(500) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idDocumento` INT NOT NULL,
  `subidComentario` INT NULL,
  PRIMARY KEY (`idComentario`),
  INDEX `fk_Comentario_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Comentario_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  INDEX `fk_Comentario_Comentario1_idx` (`subidComentario` ASC) VISIBLE,
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Documento1`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comentario_Comentario1`
    FOREIGN KEY (`subidComentario`)
    REFERENCES `SistemaWebDocTICSchema`.`Comentario` (`idComentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Publica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Publica` (
  `idPublica` INT NOT NULL AUTO_INCREMENT,
  `fechaPublicacion` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idDocumento` INT NOT NULL,
  PRIMARY KEY (`idPublica`),
  INDEX `fk_Publica_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Publica_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Publica_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publica_Documento1`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Descarga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Descarga` (
  `idDescarga` INT NOT NULL AUTO_INCREMENT,
  `fechaDescarga` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idDocumento` INT NOT NULL,
  PRIMARY KEY (`idDescarga`),
  INDEX `fk_Publica_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Publica_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Publica_Usuario10`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publica_Documento10`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Mira`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Mira` (
  `idMira` INT NOT NULL AUTO_INCREMENT,
  `fechaMira` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idDocumento` INT NOT NULL,
  PRIMARY KEY (`idMira`),
  INDEX `fk_Publica_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Publica_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Publica_Usuario11`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publica_Documento11`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Valora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Valora` (
  `idValora` INT NOT NULL AUTO_INCREMENT,
  `fechaValoracion` DATETIME NOT NULL,
  `idUsuario` INT NOT NULL,
  `idDocumento` INT NOT NULL,
  `valoracion` INT NOT NULL,
  PRIMARY KEY (`idValora`),
  CHECK (`valoracion` >= 1 AND `valoracion` <= 5),
  INDEX `fk_Publica_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Publica_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  CONSTRAINT `fk_Publica_Usuario100`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `SistemaWebDocTICSchema`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Publica_Documento100`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SistemaWebDocTICSchema`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SistemaWebDocTICSchema`.`Categoria` (
  `idCategoria` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `idDocumento` INT NOT NULL,
  `subIdCategoria` INT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_Categoria_Documento1_idx` (`idDocumento` ASC) VISIBLE,
  INDEX `fk_Categoria_Categoria1_idx` (`subIdCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Categoria_Documento1`
    FOREIGN KEY (`idDocumento`)
    REFERENCES `SistemaWebDocTICSchema`.`Documento` (`idDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_Categoria1`
    FOREIGN KEY (`subIdCategoria`)
    REFERENCES `SistemaWebDocTICSchema`.`Categoria` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
