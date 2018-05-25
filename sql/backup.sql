
-- ###################################################
-- ##                                               ##
-- ## FileName :  `backup.sql`                      ##
-- ## DataBase :  `db_hotel`                        ##
-- ## Fill database db_hotel with mock data         ##
-- ##                                               ##
-- ###################################################


-- small non dependend tables first

INSERT INTO `db_hotel`.`room_type`
VALUES	(1, 'Room'),
		(2, 'Suite');



INSERT INTO `db_hotel`.`room_bedding`
VALUES	(1, 'Single'),
		(2, 'QueenSize'),
		(3, 'KingSize');



INSERT INTO `db_hotel`.`room_bathroom`
VALUES	(1, 'Shower'),
		(2, 'Bath'),
		(3, 'Shower and Bath');



INSERT INTO `db_hotel`.`bookingstatus`
VALUES	(1, 'In Progress'),
		(2, 'Paid'),
		(3, 'Cancelled');



INSERT INTO `db_hotel`.`servicecategory`
VALUES	(1, 'Equipment'),
		(2, 'Meals'),
		(3, 'Special'),
		(4, 'Well-Being');



INSERT INTO `db_hotel`.`class`
VALUES	(1, 'Basic'),
		(2, 'Plus'),
		(3, 'Extra'),
		(4, 'Deluxe');





-- Enter the hotelrooms

INSERT INTO `db_hotel`.`room`(`id`, `name`, `room_size`, `type_id`, `bed_id`, `bathroom_id`, `floor`, `view`, `acces_rm`, `class_id`, `price`)
VALUES	(101,  'Blue Room',       25, 1, 1, 1, 1, 'North', FALSE, 1,  55),
		(102,  'Green Room',      25, 1, 1, 1, 1, 'North', FALSE, 1,  55),
		(103,  'Fuchsia Room',    25, 1, 1, 1, 1, 'East',  FALSE, 1,  45),
		(104,  'Rose Room',       25, 1, 1, 1, 1, 'East',  FALSE, 1,  45),
		(105,  'Black Room',      25, 1, 1, 1, 1, 'South', TRUE,  1,  60),
		(106,  'White Room',      25, 1, 1, 1, 1, 'South', TRUE,  1,  60),
		(107,  'Brown Room',      25, 1, 1, 1, 1, 'West',  FALSE, 1,  50),
		(108,  'Orange Room',     25, 1, 1, 1, 1, 'West',  FALSE, 1,  50),
		(201,  'Wedding Suite',   50, 2, 3, 2, 2, 'North', TRUE,  3, 160),
		(202,  'Honeymoon Suite', 50, 2, 3, 2, 2, 'East',  TRUE,  3, 160),
		(203,  'Executive Suite', 50, 2, 2, 3, 2, 'South', TRUE,  4, 170),
		(204,  'Holyday Suite',   50, 2, 2, 2, 2, 'West',  TRUE,  2, 140);



-- Enter Services  ( No id used, since autoincrement )
-- fields : `id`, `name`, `description`, `category_id`, `price`

INSERT INTO `db_hotel`.`service`(`name`, `description`, `category_id`, `price`) 
VALUES	('champagne', 'dom perignon grand-nul 1958',         3, 300),
		('breakfast', 'breakfast, croissants, coffee, tea',  3,   8),
		('minibar',   'minibar refill (suites only)',        3,  25),
		('telephone', 'telephone unlimited',                 1,  10),
		('tv canal+', 'basic tv channels + cable tv',        1,   5),
		('internet',  'acces internet wifi FREE',            1,   0);


		
-- Link Services to Classes
-- Since autoincrement 1 champagne, 2 brakfast etc.

INSERT INTO `db_hotel`.`serviceclass`(`service_id`, `class_id`)
VALUES	(1, 2),
		(1, 3),
		(1, 4),
		(2, 1),
		(2, 2),
		(2, 3),
		(2, 4),
		(3, 2),
		(3, 3),
		(3, 4),
		(4, 1),
		(4, 2),
		(4, 3),
		(4, 4),
		(5, 1),
		(5, 2),
		(5, 3),
		(5, 4),
		(6, 1),
		(6, 2),
		(6, 3),
		(6, 4);
		


-- Insert Clients   ( Skip id, since autoincrement function fills this automatically )
-- Fields : (`id`, `last_name`, `first_name`, 
-- 			`address_1`, `address_2`, `address_3`, `address_4`, 
--			`phone`, `email`, `password`) 

INSERT INTO `db_hotel`.`client`(`last_name`, `first_name`, `address_1`, `address_2`, `address_3`, `address_4`, `phone`, `email`, `password`) 
VALUES	('Costello', 'Stan'  , 'Flowerstreet 13'  , '234 HGF London', 'UK', ' ', '0123456789', 'stanc@gmail.com' , 'password'),
		('Abbot   ', 'Oliver', 'Hedgeroad 13'     , '123 ABC Queens', 'UK', ' ', '0123456789', 'abbot@gmail.com' , 'password'),
		('Laurel  ', 'Jean'  , 'Evergreen 13'     , 'B 1200 Warrick', 'IE', ' ', '0123456789', 'laurel@gmail.com', 'password'),
		('Hardy'   , 'Amy'   , 'Fietsstraat 13'   , '2743 HT Rhoon' , 'NL', ' ', '0123456789', 'hardy@gmail.com' , 'password'),
		('Gherkin' , 'Green' , 'Nachtdreef 13'    , '2400 KOLN'     , 'D' , ' ', '0123456789', 'green@gmail.com' , 'password'),
		('Petit'   , 'Ann'   , '13 Rue des fleurs', '12500 RODEZ'   , 'FR', ' ', '0123456789', 'ann@gmail.com'   , 'password'),
		('Legrand' , 'Sofi'  , '13 Bvd dela Haye' , '12500 RODEZ'   , 'FR', ' ', '0123456789', 'Sofi@gmail.com'  , 'password');

		

-- insert bookings   ( Skip id, autoincrement function allocates this automatically )
-- Fields : `booking`(`id`, `client_id`, `room_id`, `check_in`, `check_out`, `status_id`) 

INSERT INTO `db_hotel`.`booking`(`client_id`, `room_id`, `check_in`, `check_out`, `status_id`)
VALUES	(1, 101, '2018-06-18 16:00:00', '2018-06-19 12:00:00', 1),
		(5, 201, '2018-05-21 16:00:00', '2018-05-23 12:00:00', 3),
		(2, 202, '2018-06-07 16:00:00', '2018-06-14 12:00:00', 1),
		(6, 103, '2018-06-17 16:00:00', '2018-06-19 12:00:00', 1),
		(3, 105, '2018-06-18 16:00:00', '2018-06-20 12:00:00', 1),
		(1, 101, '2018-07-18 16:00:00', '2018-07-20 12:00:00', 1),
		(4, 102, '2018-06-16 16:00:00', '2018-06-23 12:00:00', 1),
		(4, 101, '2018-01-06 17:15:00', '2018-01-07 12:00:00', 2);
		


-- insert bookingdetails for client # 4 ms amy hardy room 101 early january
-- ( Skip id, autoincrement function allocates this automatically )
-- Fields : `booking`(`id`, `datetime`, `booking_id`, `servicei_id`) 

INSERT INTO `db_hotel`.`bookingdetails`(`datetime`, `booking_id`, `service_id`)
VALUES	('2018-01-06 17:15:00', 8, 6),
		('2018-01-06 17:15:30', 8, 4),
		('2018-01-06 17:16:00', 8, 5),
		('2018-01-07 08:00:00', 8, 2),
		('2018-01-07 08:00:00', 8, 2),
		('2018-01-07 08:00:00', 8, 2),
		('2018-01-07 08:00:00', 8, 2),
		('2018-01-07 07:00:00', 8, 6);
		




-- EOF() ########## end of file ##########