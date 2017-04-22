-- -----------------------------------------------------
-- Table `teaspo`.`meeting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teaspo`.`meeting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `description` VARCHAR(500) NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `place` INT NULL,
  `owner` INT NOT NULL,
  `capacity` INT NULL,
  `datetime` DATETIME NOT NULL,
  INDEX `owner_idx` (`owner` ASC),
  PRIMARY KEY (`id`),
  INDEX `place_idx` (`place` ASC),
  CONSTRAINT `place`
    FOREIGN KEY (`place`)
    REFERENCES `teaspo`.`places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `owner`
    FOREIGN KEY (`owner`)
    REFERENCES `teaspo`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teaspo`.`meeting_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teaspo`.`meeting_has_users` (
  `Meeting_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`Meeting_id`, `users_id`),
  INDEX `fk_Meeting_has_users_users1_idx` (`users_id` ASC),
  INDEX `fk_Meeting_has_users_Meeting1_idx` (`Meeting_id` ASC),
  CONSTRAINT `fk_Meeting_has_users_Meeting1`
    FOREIGN KEY (`Meeting_id`)
    REFERENCES `teaspo`.`meeting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Meeting_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `teaspo`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


