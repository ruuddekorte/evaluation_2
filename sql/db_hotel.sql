
-- ###################################################
-- ##                                               ##
-- ## FileName :  `db_hotel.sql`                    ##
-- ## DataBase :  `db_hotel`                        ##
-- ## Creation of database name                     ##
-- ##                                               ##
-- ###################################################



CREATE DATABASE `db_hotel` DEFAULT CHARSET=utf8 COLLATE utf8_unicode_ci;



-- ###################################################
-- ##                                               ##
-- ## DataBase :  `db_hotel`                        ##
-- ## Creation of required tables,                  ##
-- ##                      primary keys,            ##
-- ##                      indexes,                 ##
-- ##                      foreign keys,            ##
-- ##                                               ##
-- ###################################################




CREATE TABLE `db_hotel`.`room` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `room_size` int(2) NOT NULL,
  `type_id` int(1) NOT NULL,
  `bed_id` int(1) NOT NULL,
  `bathroom_id` int(1) NOT NULL,
  `floor` int(2) NOT NULL,
  `view` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acces_rm` tinyint(1) NOT NULL,
  `class_id` int(1) NOT NULL,
  `price` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `type_id` (`type_id`),
  INDEX `bed_id` (`bed_id`),
  INDEX `bathroom_id` (`bathroom_id`),
  INDEX `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`room_type` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`room_bedding` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`room_bathroom` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`client` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_3` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address_4` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`booking` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `client_id` int(4) NOT NULL,
  `room_id` int(4) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `status_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `status_id` (`status_id`),
  INDEX `client_id` (`client_id`),
  INDEX `room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`bookingdetails` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `booking_id` int(4) NOT NULL,
  `service_id` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `booking_id` (`booking_id`),
  INDEX `service_id` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`bookingstatus` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`service` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(1) NOT NULL,
  `price` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`servicecategory` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`serviceclass` (
  `service_id` int(4) NOT NULL,
  `class_id` int(1) NOT NULL, 
  INDEX `service_id` (`service_id`),
  INDEX `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE `db_hotel`.`class` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- ##################################################################################
-- Creation of the foreign keys ;  This is done after setting up all the tables and 
-- their primary keys and indexes. to ensure both sides of the chain (link) exist.
-- ##################################################################################
-- syntax - select table (ALTER TABLE `databasename`.`talbename`)
--        - ADD CONSTRAINT 'fk_foreignkeyname'
--        - FOREIGN KEY (`columname from table')
--        - REFERENCES `tablename containing data` (`keyfield from table containing data`)



ALTER TABLE `db_hotel`.`booking`

  ADD CONSTRAINT `fk_booking_room` 
  FOREIGN KEY (`room_id`) 
  REFERENCES `room` (`id`),

  ADD CONSTRAINT `fk_booking_client` 
  FOREIGN KEY (`client_id`) 
  REFERENCES `client` (`id`),

  ADD CONSTRAINT `fk_booking_status` 
  FOREIGN KEY (`status_id`) 
  REFERENCES `bookingstatus` (`id`);



ALTER TABLE `db_hotel`.`bookingdetails`

  ADD CONSTRAINT `fk_bookingdetails_service` 
  FOREIGN KEY (`service_id`) 
  REFERENCES `service` (`id`),

  ADD CONSTRAINT `fk_bookingdetails_booking` 
  FOREIGN KEY (`booking_id`) 
  REFERENCES `booking` (`id`);



ALTER TABLE `db_hotel`.`room`

  ADD CONSTRAINT `fk_room_bathroom` 
  FOREIGN KEY (`bathroom_id`) 
  REFERENCES `room_bathroom` (`id`),

  ADD CONSTRAINT `fk_room_bedding` 
  FOREIGN KEY (`bed_id`) 
  REFERENCES `room_bedding` (`id`),

  ADD CONSTRAINT `fk_room_type` 
  FOREIGN KEY (`type_id`) 
  REFERENCES `room_type` (`id`),

  ADD CONSTRAINT `fk_room_class` 
  FOREIGN KEY (`class_id`) 
  REFERENCES `class` (`id`);



ALTER TABLE `db_hotel`.`service`
  ADD CONSTRAINT `fk_service_category` 
  FOREIGN KEY (`category_id`) 
  REFERENCES `servicecategory` (`id`);



ALTER TABLE `db_hotel`.`serviceclass`
  ADD CONSTRAINT `fk_serviceclass_service` 
  FOREIGN KEY (`service_id`) 
  REFERENCES `service` (`id`),

  ADD CONSTRAINT `fk_serviceclass_class` 
  FOREIGN KEY (`class_id`) 
  REFERENCES `class` (`id`);





-- EOF() ########## end of file ##########


