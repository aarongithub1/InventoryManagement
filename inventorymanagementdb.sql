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
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `shipping_address` VARCHAR(255) NULL DEFAULT NULL,
  `billing_address` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `email_UNIQUE` ON `inventorymanagementdb`.`customer` (`email` ASC);

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`customer` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`product` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `quantity` INT(11) NULL DEFAULT NULL,
  `available` TINYINT(1) NULL DEFAULT NULL,
  `price` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`product` (`id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`order` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_created` DATETIME NULL,
  `total_price` DECIMAL(10,2) NULL,
  `order_status` VARCHAR(45) NULL,
  `shipping_address` VARCHAR(255) NULL,
  `billing_address` VARCHAR(255) NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_customer`
    FOREIGN KEY (`customer_id`)
    REFERENCES `inventorymanagementdb`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`order` (`id` ASC);

CREATE INDEX `fk_order_customer_idx` ON `inventorymanagementdb`.`order` (`customer_id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`order_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`order_product` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`order_product` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NULL DEFAULT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_product_order`
    FOREIGN KEY (`product_id`)
    REFERENCES `inventorymanagementdb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product`
    FOREIGN KEY (`order_id`)
    REFERENCES `inventorymanagementdb`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`order_product` (`id` ASC);

CREATE INDEX `fk_product_order_idx` ON `inventorymanagementdb`.`order_product` (`product_id` ASC);

CREATE INDEX `fk_order_product_idx` ON `inventorymanagementdb`.`order_product` (`order_id` ASC);


-- -----------------------------------------------------
-- Table `inventorymanagementdb`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inventorymanagementdb`.`staff` ;

CREATE TABLE IF NOT EXISTS `inventorymanagementdb`.`staff` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `picture` VARCHAR(255) NULL DEFAULT NULL,
  `bio` VARCHAR(2000) NULL DEFAULT NULL,
  `position` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `id_UNIQUE` ON `inventorymanagementdb`.`staff` (`id` ASC);

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
INSERT INTO `inventorymanagementdb`.`customer` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`) VALUES (1, 'adam', 'a@a.com', '123456', '123 main st.', '456 main st.');
INSERT INTO `inventorymanagementdb`.`customer` (`id`, `name`, `email`, `password`, `shipping_address`, `billing_address`) VALUES (2, 'bob', 'b@b.com', '123456', '321 main st.', '654 main st.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (1, 'laptop', 10, true, 1000.00);
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (2, 'coffee mug', 20, true, 10.00);
INSERT INTO `inventorymanagementdb`.`product` (`id`, `name`, `quantity`, `available`, `price`) VALUES (3, 'bag of coffee', 30, true, 15.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`order`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`order` (`id`, `date_created`, `total_price`, `order_status`, `shipping_address`, `billing_address`, `customer_id`) VALUES (1, NULL, 1025.00, 'shipped', '123 main st.', '321 main st.', 1);
INSERT INTO `inventorymanagementdb`.`order` (`id`, `date_created`, `total_price`, `order_status`, `shipping_address`, `billing_address`, `customer_id`) VALUES (2, NULL, 1025.00, 'shipped', '456 main st.', '654 main st.', 2);

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


-- -----------------------------------------------------
-- Data for table `inventorymanagementdb`.`staff`
-- -----------------------------------------------------
START TRANSACTION;
USE `inventorymanagementdb`;
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (1, 'jim', NULL, 'works hard', 'woker');
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (2, 'joe', NULL, 'does things', 'doer');
INSERT INTO `inventorymanagementdb`.`staff` (`id`, `name`, `picture`, `bio`, `position`) VALUES (3, 'john', NULL, 'happy to help', 'happy guy');

COMMIT;
