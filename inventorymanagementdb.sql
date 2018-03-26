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
-- Table `inventorymanagementdb`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`customer` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `shipping_address` VARCHAR(255) NULL,
  `billing_address` VARCHAR(255) NULL,
  `cart_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `email_UNIQUE` ON `inventorymanagementdb`.`customer` (`email` ASC);

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`customer` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`product` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `quantity` INT(11) NULL,
  `available` TINYINT(1) NULL,
  `price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`product` (`id` ASC);


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
-- Table `inventorymanagementdb`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`order` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `shipping_address` VARCHAR(255) NULL,
  `billing_address` VARCHAR(255) NULL,
  `total_price` DECIMAL(10,2) NULL,
  `date_created` DATETIME NULL,
  `date_shipped` DATETIME NULL,
  `order_status` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `inventorymanagementdb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `idorder_UNIQUE` ON `inventorymanagementdb`.`order` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`order_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`order_product` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`order_product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`order_id`)
    REFERENCES `inventorymanagementdb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_order`
    FOREIGN KEY (`product_id`)
    REFERENCES `inventorymanagementdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_order_idx` ON `inventorymanagementdb`.`order_product` (`product_id` ASC);

CREATE INDEX `fk_order_product_idx` ON `inventorymanagementdb`.`order_product` (`order_id` ASC);

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`order_product` (`id` ASC);

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
-- Data for table `inventorymanagementdb`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`customer` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`, `cart_id`) VALUES (1, 'aaron', 'a@a.com', '123456', '123 main st.', '321 niam st.', 1);
INSERT INTO `inventorymanagementdb`.`customer` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`, `cart_id`) VALUES (2, 'bob', 'b@b.com', '123456', '456 elm st.', '654 mle st.', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (1, 'Coffee Mug', 20, true, 10.50);
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (2, 'MacBookPro', 30, true, 3000.00);
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (3, 'Sleeping Bag', 10, true, 75.30);

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
-- Data for table `inventorymanagementdb`.`order`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`order` (`id`, `shipping_address`, `billing_address`, `total_price`, `date_created`, `date_shipped`, `order_status`, `customer_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `inventorymanagementdb`.`order` (`id`, `shipping_address`, `billing_address`, `total_price`, `date_created`, `date_shipped`, `order_status`, `customer_id`) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`order_product`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (1, 1, 1);
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (2, 1, 2);
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (3, 1, 3);
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (4, 2, 1);
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (5, 2, 2);
INSERT INTO `inventorymanagementdb`.`order_product` (`id`, `order_id`, `product_id`) VALUES (6, 2, 3);

COMMIT;
