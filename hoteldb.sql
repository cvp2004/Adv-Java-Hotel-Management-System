CREATE DATABASE  IF NOT EXISTS `hoteldb`;
USE `hoteldb`;


DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(45) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
);


DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`)
);

INSERT INTO `employee` VALUES (1,'cvp','abc'),(2,'mvp','xyz');


DROP TABLE IF EXISTS `booking1`;
CREATE TABLE `booking1` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `expected_checkin_date` date DEFAULT NULL,
  `expected_checkout_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `booking_id_UNIQUE` (`booking_id`)
);


DROP TABLE IF EXISTS `booking_archive`;
CREATE TABLE `booking_archive` (
  `booking_id` int NOT NULL,
  `room_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `expected_checkin_date` date DEFAULT NULL,
  `expected_checkout_date` date DEFAULT NULL
);


DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_no` varchar(10) NOT NULL,
  `capacity` int NOT NULL,
  `rate` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `current_booking_id` int DEFAULT NULL,
  PRIMARY KEY (`room_id`)
);

INSERT INTO `room` VALUES (1,'001',2,4000,'AVAILABLE',NULL),(2,'001',2,4000,'AVAILABLE',NULL),(3,'003',2,4000,'AVAILABLE',NULL),(4,'004',2,4000,'AVAILABLE',NULL),(5,'005',2,4000,'AVAILABLE',NULL),(6,'101',2,4000,'AVAILABLE',NULL),(7,'102',2,4000,'AVAILABLE',NULL),(8,'103',2,4000,'AVAILABLE',NULL),(9,'104',2,4000,'AVAILABLE',NULL),(10,'105',2,4000,'AVAILABLE',NULL);


ALTER TABLE `hoteldb`.`room` 
ADD CONSTRAINT `fkey_current_booking_id`
  FOREIGN KEY (`current_booking_id`)
  REFERENCES `hoteldb`.`booking1` (`booking_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE view room_status as select room_id, room_no, status from room;

CREATE view booking as sleect * from booking1;

--Trigger 1
CREATE DEFINER=`root`@`localhost` TRIGGER `booking_checkout_booking_archive` BEFORE DELETE ON `booking1` FOR EACH ROW BEGIN
    insert into booking_archive (booking_id, room_id, customer_id, expected_checkin_date, expected_checkout_date) values (OLD.booking_id, OLD.room_id, OLD.customer_id, OLD.expected_checkin_date,
    OLD.expected_checkout_date);
END

--Trigger 2
CREATE DEFINER=`root`@`localhost` TRIGGER `booking_checkout_room_update` AFTER DELETE ON `booking1` FOR EACH ROW BEGIN
    update room set current_booking_id=NULL where room_id=OLD.room_id;
END

--Trigger 3
CREATE DEFINER=`root`@`localhost` TRIGGER `booking_checkout_room_status_update` AFTER DELETE ON `booking1` FOR EACH ROW BEGIN
    update room set status='AVAILABLE' where room_id=OLD.room_id;
END
