-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MiTec_ResidenciaProfesional
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MiTec_ResidenciaProfesional
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MiTec_ResidenciaProfesional` DEFAULT CHARACTER SET utf8 ;
USE `MiTec_ResidenciaProfesional` ;

-- -----------------------------------------------------
-- Table `MiTec_ResidenciaProfesional`.`Empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MiTec_ResidenciaProfesional`.`Empresa` ;

CREATE TABLE IF NOT EXISTS `MiTec_ResidenciaProfesional`.`Empresa` (
  `RazonSocial` VARCHAR(50) NOT NULL,
  `Empresa_Nombre` VARCHAR(45) NOT NULL,
  `Ramo` VARCHAR(45) NOT NULL,
  `Domicilio` VARCHAR(45) NOT NULL,
  `Representante` VARCHAR(90) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`RazonSocial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiTec_ResidenciaProfesional`.`Proyecto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MiTec_ResidenciaProfesional`.`Proyecto` ;

CREATE TABLE IF NOT EXISTS `MiTec_ResidenciaProfesional`.`Proyecto` (
  `IDProyecto` INT NOT NULL AUTO_INCREMENT,
  `Proyecto_Nombre` VARCHAR(45) NOT NULL,
  `FechaFinal` DATE NOT NULL,
  `Empresa_RazonSocial` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IDProyecto`, `Empresa_RazonSocial`),
  INDEX `fk_Proyecto_Empresa1_idx` (`Empresa_RazonSocial` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Empresa1`
    FOREIGN KEY (`Empresa_RazonSocial`)
    REFERENCES `MiTec_ResidenciaProfesional`.`Empresa` (`RazonSocial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiTec_ResidenciaProfesional`.`Asesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MiTec_ResidenciaProfesional`.`Asesor` ;

CREATE TABLE IF NOT EXISTS `MiTec_ResidenciaProfesional`.`Asesor` (
  `Clave` VARCHAR(18) NOT NULL,
  `Asesor_Nombres` VARCHAR(90) NOT NULL,
  `Asesor_ApellidoP` VARCHAR(45) NOT NULL,
  `Asesor_ApellidoM` VARCHAR(45) NOT NULL,
  `Academia` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Clave`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiTec_ResidenciaProfesional`.`Alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MiTec_ResidenciaProfesional`.`Alumno` ;

CREATE TABLE IF NOT EXISTS `MiTec_ResidenciaProfesional`.`Alumno` (
  `NoControl` VARCHAR(8) NOT NULL,
  `Alumno_Nombres` VARCHAR(90) NOT NULL,
  `Alumno_ApellidoP` VARCHAR(45) NOT NULL,
  `Alumno_ApellidoM` VARCHAR(45) NOT NULL,
  `Carrera` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Semestre` INT NOT NULL,
  `NIP` VARCHAR(4) NOT NULL,
  `Proyecto_IDProyecto` INT NOT NULL,
  `Asesor_Clave` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`NoControl`, `Proyecto_IDProyecto`, `Asesor_Clave`),
  INDEX `fk_Alumno_Proyecto1_idx` (`Proyecto_IDProyecto` ASC) VISIBLE,
  INDEX `fk_Alumno_Asesor1_idx` (`Asesor_Clave` ASC) VISIBLE,
  CONSTRAINT `fk_Alumno_Proyecto1`
    FOREIGN KEY (`Proyecto_IDProyecto`)
    REFERENCES `MiTec_ResidenciaProfesional`.`Proyecto` (`IDProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Asesor1`
    FOREIGN KEY (`Asesor_Clave`)
    REFERENCES `MiTec_ResidenciaProfesional`.`Asesor` (`Clave`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiTec_ResidenciaProfesional`.`Documento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MiTec_ResidenciaProfesional`.`Documento` ;

CREATE TABLE IF NOT EXISTS `MiTec_ResidenciaProfesional`.`Documento` (
  `Numero` INT NOT NULL,
  `Formato` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `FechaEntrega` DATE NOT NULL,
  `Proyecto_IDProyecto` INT NOT NULL,
  `Alumno_NoControl` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Numero`, `Proyecto_IDProyecto`, `Alumno_NoControl`),
  INDEX `fk_Avances_Proyecto1_idx` (`Proyecto_IDProyecto` ASC) VISIBLE,
  INDEX `fk_Documento_Alumno1_idx` (`Alumno_NoControl` ASC) VISIBLE,
  CONSTRAINT `fk_Avances_Proyecto1`
    FOREIGN KEY (`Proyecto_IDProyecto`)
    REFERENCES `MiTec_ResidenciaProfesional`.`Proyecto` (`IDProyecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Documento_Alumno1`
    FOREIGN KEY (`Alumno_NoControl`)
    REFERENCES `MiTec_ResidenciaProfesional`.`Alumno` (`NoControl`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
