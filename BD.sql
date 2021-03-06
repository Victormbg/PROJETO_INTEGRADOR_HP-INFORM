-- MySQL Script generated by MySQL Workbench
-- 06/14/18 19:33:49
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HePInformatica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HePInformatica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `HePInformatica` ;

-- -----------------------------------------------------
-- Table `HePInformatica`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HePInformatica`.`produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nomeProduto` VARCHAR(45) NOT NULL,
  `valorProduto` VARCHAR(45) NOT NULL,
  `descricaoProduto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HePInformatica`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HePInformatica`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `numeroPedido` INT NOT NULL,
  `statusPedido` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  `dataPedido` DATETIME NOT NULL,
  `produtos_idProdutos` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_produtos_idx` (`produtos_idProdutos` ASC),
  CONSTRAINT `fk_pedido_produtos`
    FOREIGN KEY (`produtos_idProdutos`)
    REFERENCES `HePInformatica`.`produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HePInformatica`.`contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HePInformatica`.`contato` (
  `idContato` INT NOT NULL AUTO_INCREMENT,
  `assumto` VARCHAR(500) NOT NULL,
  `mensagem` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idContato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HePInformatica`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HePInformatica`.`cliente` (
  `idCadastro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  `cpf` INT NOT NULL,
  `cep` INT NOT NULL,
  `rg` INT NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  `celular` INT NOT NULL,
  `pedido_idPedido` INT NOT NULL,
  `contato_idContato` INT NOT NULL,
  PRIMARY KEY (`idCadastro`, `pedido_idPedido`, `contato_idContato`),
  INDEX `fk_cliente_pedido1_idx` (`pedido_idPedido` ASC),
  INDEX `fk_cliente_contato1_idx` (`contato_idContato` ASC),
  CONSTRAINT `fk_cliente_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `HePInformatica`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_contato1`
    FOREIGN KEY (`contato_idContato`)
    REFERENCES `HePInformatica`.`contato` (`idContato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HePInformatica`.`imagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HePInformatica`.`imagens` (
  `idImagens` INT NOT NULL AUTO_INCREMENT,
  `nomeImagem` VARCHAR(100) NOT NULL,
  `caminhoImagem` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idImagens`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
