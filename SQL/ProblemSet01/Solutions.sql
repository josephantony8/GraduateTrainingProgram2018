
 ProblemSet<01>, August 09 2018
 Submission by j.antony.arockiaraj@accenture.com 

 CREATE TABLE HOTEL(HOTEL_NO VARCHAR(5) PRIMARY KEY,NAME VARCHAR(20),CITY VARCHAR(20));
 Insert into Hotel VALUES("H111","Empire Hotel","New York");
 Insert into Hotel values ('H235','Park Place','New York');
 Insert into Hotel values('H432','Brownstone Hotel','Toronto');
 Insert into Hotel values('H498','James Plaza','Totonto');
 Insert into Hotel values('H193','Devon Hotel','Boston');
 Insert into Hotel values('H437','Clairmont Hotel','Boston');


 create table Room(Room_No varchar(20),Hotel_NO varchar(20) references Hotels(Hotel_NO),Type varchar(20),Price int(10),primary key(Room_No,Hotel_NO));
 INSERT INTO ROOM VALUES(313,'H111','S',145.00);
 INSERT INTO ROOM VALUES(412,'H111','N',145.00);
 INSERT INTO ROOM VALUES(1267,'H235','N',175.00);
 INSERT INTO ROOM VALUES(1289,'H235','N',195.00);
 INSERT INTO ROOM VALUES(876,'H432','S',124.00);
 INSERT INTO ROOM VALUES(898,'H432','S',124.00);
 INSERT INTO ROOM VALUES(345,'H498','N',160.00);
 INSERT INTO ROOM VALUES(467,'H498','N',180.00);
 INSERT INTO ROOM VALUES(1001,'H193','S',150.00);
 INSERT INTO ROOM VALUES(1201,'H193','N',175.00);
 INSERT INTO ROOM VALUES(257,'H437','N',140.00);
 INSERT INTO ROOM VALUES(223,'H437','N',155.00);
 
 
 CREATE TABLE GUEST (GUEST_NO CHAR(4) PRIMARY KEY, NAME CHAR(20),CITY CHAR(20));
 INSERT INTO GUEST VALUES('G256','ADAM WAYNE','PITTSBURGH');
 INSERT INTO GUEST VALUES('G367','TARA CUMMINGS','BALTIMORE');
 INSERT INTO GUEST VALUES('G879','VANESSA PARRY','PITTSBURGH');
 INSERT INTO GUEST VALUES('G230','TOM HANCOCK','PHILADELPHIA');
 INSERT INTO GUEST VALUES('G467','ROBERT SWIFT','ATLANTA');
 INSERT INTO GUEST VALUES('G190','EDWARD CANE','BALTIMORE');
 
 create table Booking(Hotel_NO varchar(20) references Hotel(Hotel_NO) ,Guest_No varchar(20) references Guest(Guest_No)  ,Date_from varchar(20),Date_to varchar(20),Room_No varchar(20) references room(Room_No),primary key(Hotel_NO,Guest_No,Room_No));
 INSERT INTO BOOKING VALUES('H111','G256','10-AUG-99','15-AUG-99',412);
 INSERT INTO BOOKING VALUES('H111','G367','18-AUG-99','21-AUG-99',412);
 INSERT INTO BOOKING VALUES('H235','G879','05-SEP-99','12-SEP-99',1267);
 INSERT INTO BOOKING VALUES('H498','G230','15-SEP-99','18-SEP-99',467);
 INSERT INTO BOOKING VALUES('H498','G256','30-NOV-99','02-DEC-99',345);
 INSERT INTO BOOKING VALUES('H498','G467','03-NOV-99','05-NOV-99',345);
 INSERT INTO BOOKING VALUES('H193','G190','15-NOV-99','19-NOV-99',1001);
 INSERT INTO BOOKING VALUES('H193','G367','12-SEP-99','14-SEP-99',1001);
 INSERT INTO BOOKING VALUES('H193','G367','01-OCT-99','06-OCT-99',1201);
 INSERT INTO BOOKING VALUES('H437','G190','04-OCT-99','06-OCT-99',223);
 INSERT INTO BOOKING VALUES('H437','G879','14-SEP-99','17-SEP-99',223);
 
 1.List full details of all hotels.
 select * from hotel;
 record count-6
 H111|Empire Hotel|New York
 H235|Park Place|New York
 H432|Brownstone Hotel|Toronto
 H498|James Plaza|Totonto
 H193|Devon Hotel|Boston
 H437|Clairmont Hotel|Boston

 2.List full details of all hotels in New York.
 select * from hotel where city='New York';
 record count-2
 H111|Empire Hotel|New York
 H235|Park Place|New York

 3.List the names and cities of all guests, ordered according to their cities.
 select name,city from guest order by city;
 record count-6
 ROBERT SWIFT|ATLANTA
 TARA CUMMINGS|BALTIMORE
 EDWARD CANE|BALTIMORE
 TOM HANCOCK|PHILADELPHIA
 ADAM WAYNE|PITTSBURGH
 VANESSA PARRY|PITTSBURGH

 4.List all details for non-smoking rooms in ascending order of price.
 select * from room where type='N' order by price;
 record count-8
 257|H437|N|140
 412|H111|N|145
 223|H437|N|155
 345|H498|N|160
 1267|H235|N|175
 1201|H193|N|175
 467|H498|N|180
 1289|H235|N|195

 5.List the number of hotels there are.
 select count(*) from hotel;
 6

 6.List the cities in which guests live. Each city should be listed only once.
 select distinct city from guest;
 record count-4
 PITTSBURGH
 BALTIMORE
 PHILADELPHIA
 ATLANTA

 7.List the average price of a room.
 select avg(price) as Average_Price from room;
 155.666666666667

 8.List hotel names, their room numbers, and the type of that room.
 select h.name, r.room_no,r.type from hotel h inner join room r where h.hotel_no=r.hotel_no;
 record count-12
 Empire Hotel|313|S
 Empire Hotel|412|N
 Park Place|1267|N
 Park Place|1289|N
 Brownstone Hotel|876|S
 Brownstone Hotel|898|S
 James Plaza|345|N
 James Plaza|467|N
 Devon Hotel|1001|S
 Devon Hotel|1201|N
 Clairmont Hotel|257|N
 Clairmont Hotel|223|N

 9.List the hotel names, booking dates, and room numbers for all hotels in New York.
 select h.name,b.date_from,b.date_to,b.hotel_no,b.room_no from hotel h inner join booking b where h.hotel_no=b.hotel_no and h.city='New York';
 record count-3
 Empire Hotel|10-AUG-99|15-AUG-99|H111|412
 Empire Hotel|18-AUG-99|21-AUG-99|H111|412
 Park Place|05-SEP-99|12-SEP-99|H235|1267 

 10.What is the number of bookings that started in the month of September?
 select count(*) from booking where date_from like '%SEP%';
 4

 11.List the names and cities of guests who began a stay in New York in August.
 select g.name,g.city from guest g inner join booking b on b.guest_no=g.guest_no inner join hotel h on h.hotel_no=b.hotel_no where b.date_from like '%AUG%' and h.city='New York';
 record count-2
 ADAM WAYNE|PITTSBURGH
 TARA CUMMINGS|BALTIMORE
 
 12.List the hotel names and room numbers of any hotel rooms that have not been booked.
 select h.hotel_no,r.room_no from hotel h inner join room r where h.hotel_no=r.hotel_no and r.room_no not in(select distinct room_no from booking);
 record count-5
 H235|1289
 H437|257
 H111|313
 H432|876
 H432|898
 
 
 13.List the hotel name and city of the hotel with the highest priced room.
 select h.name,h.city from hotel h inner join room r where r.hotel_no=h.hotel_no and r.price=(select max(price) from room);
 reord count-1
 Park Place|New York
 
 14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.
 select h.name,r.room_no,h.city,r.price from hotel h inner join room r where h.hotel_no=r.hotel_no and r.price<(select min(price) from room where hotel_no in(select hotel_no from hotel where city='Boston'));
 record count-2
 Brownstone Hotel|876|Toronto|124
 Brownstone Hotel|898|Toronto|124
 
 15.List the average price of a room grouped by city.
 select distinct h.city,avg(price) from hotel h inner join room r on r.hotel_no=h.hotel_no group by h.city;
 record count-3
 Boston|155.0
 New York|165.0
 Toronto|147.0

