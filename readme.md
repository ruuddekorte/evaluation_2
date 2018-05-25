# Creating a database for a hotel

UML Diagram :
- text version        .. documentation/db_hotel_setup_base.doc
- image version       .. documentation/db_hotel_structure.png

MYSQL Create database structure :
- executable sql file .. sql/db_hotel.sql
- readable version    .. documentation/db_hotel_script_create_db_print.doc

MYSQL test of database :
- executable sql file .. sql/backup.sql
- readable version    .. documentation/db_hotel_fill_db_print.doc



# Exercise instructions

You are asked to design and set up a database for a hotel.
This must respect the conditions defined below.

## Objectives
* ** Create the model of the database (UML diagram). **
    Estimated time: * 1 day *
    Competency: * 2 Design a database (level 3) *
* ** Design the database according to the model (sql file). **
    Estimated time: * 1 day *
    Competency: * 3 Establish a database (level 3) *

## Production :
** Duration: ** 2 days
** Group: ** Solo

## Rendering:
* The UML diagram
* The structure of the database in a .sql file
* A test game of the database in a .backup.sql file

## Users stories
* The hotel has several rooms, each with a name and an extra room.
* The rooms can be rooms or suites.
* It is possible to know the floor and the view of each room.
* Some rooms are accessible to people with reduced mobility.
* The rooms can have a single bed, double (queen size or king size).
* The hotel offers various services such as breakfast in the room, mini bar (for suites), bottle of champagne, etc.
* The bathrooms of the rooms can have a shower and / or a bath.
* The price of each room is per night and does not include services.
* Some services are only available for some rooms.
* Services have a description (in addition to a name) to help customers understand them.
* The services are categorized: equipment, well-being, meals and special.
* Each service has a cost to add to the order.
* The hotel manager can follow orders from guests.
* In addition to knowing the first and last name, the manager can contact the customer by phone or email.
* The customer can receive an invoice at his address.
* The customer can authenticate on the site via his email and a password to manage his reservation.
* The hotel manager can access all bookings, these contain the guest, room, date of arrival and departure date and associated services.
* The customer and the manager can see how much has cost a reservation (room rate + services).
* The manager can see the status of the booking: in progress, payment made, canceled, etc.