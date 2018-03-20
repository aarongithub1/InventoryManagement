-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema inventorymanagementdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `inventorymanagementdb` ;

-- -----------------------------------------------------
-- Schema inventorymanagementdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inventorymanagementdb` DEFAULT CHARACTER SET utf8 ;
USE `inventorymanagementdb` ;

-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`user` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NOT NULL,
  `shipping_address` VARCHAR(255) NULL,
  `billing_address` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `email_UNIQUE` ON `inventorymanagementdb`.`user` (`email` ASC);

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`user` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`inventory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`inventory` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`inventory` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `quantity` INT(11) NULL,
  `available` TINYINT(1) NULL,
  `price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`inventory` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`staff` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `picture` VARCHAR(255) NULL,
  `bio` VARCHAR(2000) NULL,
  `position` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`staff` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`cart` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inventory_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_cart_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `inventorymanagementdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_inventory`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `inventorymanagementdb`.`inventory` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`cart` (`id` ASC);

CREATE INDEX `fk_cart_inventory_idx` ON `inventorymanagementdb`.`cart` (`inventory_id` ASC);

CREATE INDEX `fk_cart_user_idx` ON `inventorymanagementdb`.`cart` (`user_id` ASC);

SET SQL_MODE = '';
GRANT USAGE ON *.* TO admin@localhost;
 DROP USER admin@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL ON `inventorymanagementdb`.* TO 'admin'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`user` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`) VALUES (1, 'aaron', 'a@a.com', '123456', '123 main st.', '321 niam st.');
INSERT INTO `inventorymanagementdb`.`user` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`) VALUES (2, 'bob', 'b@b.com', '123456', '456 elm st.', '654 mle st.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`inventory`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`inventory` (`id`, `name`, `quantity`, `available`, `price`) VALUES (1, 'Coffee Mug', 20, true, 10.50);
INSERT INTO `inventorymanagementdb`.`inventory` (`id`, `name`, `quantity`, `available`, `price`) VALUES (2, 'MacBookPro', 30, true, 3000.00);
INSERT INTO `inventorymanagementdb`.`inventory` (`id`, `name`, `quantity`, `available`, `price`) VALUES (3, 'Sleeping Bag', 10, true, 75.30);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (1, 'Tim', NULL, 'he does great things', 'manager of things');
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (2, 'Joe', NULL, 'he tries his best', 'assitant sorter');
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (3, 'Bill', NULL, 'he doesn\'t like spiders', 'executive accountant');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`cart`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (1, 1, 1);
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (2, 2, 1);
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (3, 3, 1);
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (4, 1, 2);
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (5, 2, 2);
INSERT INTO `inventorymanagementdb`.`cart` (`id`, `inventory_id`, `user_id`) VALUES (6, 3, 2);

COMMIT;
