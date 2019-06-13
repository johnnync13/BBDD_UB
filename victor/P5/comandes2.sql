DROP DATABASE dreamhouse;

CREATE DATABASE dreamhouse;

\connect dreamhouse;

CREATE TABLE "branch"(
	"branch_id" VARCHAR(5) NOT NULL,
	"street" VARCHAR (25) NOT NULL,
	"city" VARCHAR (15) NOT NULL,
	"postcode" VARCHAR (10) NOT NULL,
	Constraint "branch_pkey" Primary Key ("branch_id")
	);
	
CREATE TABLE "staff" (
	"staff_id" VARCHAR(5) NOT NULL,
	"fname" VARCHAR(10) NOT NULL,
	"lname" VARCHAR(10) NOT NULL,
	"position" VARCHAR(15) NOT NULL,
	"sex" CHAR(1) NOT NULL,
	"dob" DATE NOT NULL,
	"salary" NUMERIC NOT NULL,
	"branch_id" VARCHAR(5) NOT NULL,
	Constraint "staff_pkey" Primary Key("staff_id"),
	Foreign key("branch_id") REFERENCES "branch"("branch_id")
	);
	
CREATE TABLE "client" (
	"client_id" VARCHAR(5) NOT NULL,
	"fname" VARCHAR(10) NOT NULL,
	"lname" VARCHAR(10) NOT NULL,
	"telnumber" NUMERIC NOT NULL,
	"pref_type" VARCHAR(10) NOT NULL,
	"max_rent" NUMERIC NOT NULL,
	Constraint "client_pkey" Primary Key("client_id")
	);
	
	
CREATE TABLE "privateowner" (
	"privateowner_id" VARCHAR(5) NOT NULL,
	"fname" VARCHAR(10) NOT NULL,
	"lname" VARCHAR(10) NOT NULL,
	"address" VARCHAR(50) NOT NULL,
	"telnumber" NUMERIC NOT NULL,
	Constraint "privateowner_pkey" Primary Key("privateowner_id")
	);
	
	
CREATE TABLE "property4rent" (
	"property_id" VARCHAR(5) NOT NULL,
	"street" VARCHAR(25) NOT NULL,
	"city" VARCHAR(15) NOT NULL,
	"postcode" VARCHAR(10) NOT NULL,
	"type" VARCHAR(10) NOT NULL,
	"romos" NUMERIC NOT NULL,
	"rent" NUMERIC NOT NULL,
	"owner_id" VARCHAR(5) NOT NULL,
	"staff_id" VARCHAR(5),
	"branch_id" VARCHAR(5) NOT NULL,
	Constraint "property4rent_pkey" Primary Key("property_id"),
	Foreign key("owner_id") REFERENCES "privateowner" ("privateowner_id"),
	Foreign key("staff_id") REFERENCES "staff" ("staff_id"),
	Foreign key("branch_id") REFERENCES "branch" ("branch_id")
	);
	
CREATE TABLE "viewing" (
	"client_id" VARCHAR (5) NOT NULL,
	"property_id" VARCHAR (5) NOT NULL,
	"viewdate" DATE NOT NULL,
	"comment" TEXT,
	Constraint "viewing_pkey" Primary Key ("client_id", "property_id"),
	Foreign key("client_id") REFERENCES "client" ("client_id"),
	Foreign key("property_id") REFERENCES "property4rent" ("property_id")
	);

CREATE TABLE "registration" (
	"client_id" VARCHAR (5) NOT NULL,
	"branch_id" VARCHAR (5) NOT NULL,
	"staff_id" VARCHAR (5) NOT NULL,
	"date_joined" DATE NOT NULL,
	Constraint "registration_pkey" Primary Key ("client_id", "branch_id"),
	Foreign key("client_id") REFERENCES "client" ("client_id"),
	Foreign key("branch_id") REFERENCES "branch" ("branch_id"),
	Foreign key("staff_id") REFERENCES "staff" ("staff_id")
	
	);
	
INSERT INTO branch (branch_id, street, city, postcode) VALUES 
	('B005','22 Deer Rd', 'London', 'SW1 4EH'),
	('B007','16 Argyll St', 'Aberdeen', 'AB2 3SU'),
	('B003','163 Main St', 'Glasgow', 'G11 9QX'),
	('B004','32 Manse Rd', 'Bristol', 'BS99 INZ'),
	('B002','56 Clover Dr', 'London', 'NW10 6EU');
	
INSERT INTO staff (staff_id, fname, lname, position, sex, dob, salary, branch_id) VALUES 
	('SL21','John','White','Manager','M','1-Oct-1950',30000,'B005'),
	('SG37','Ann','Beech','Assistant','F','10-Nov-1960',12000,'B003'),
	('SG14','David','Ford','Supervisor','M','24-Mar-1958',18000,'B003'),
	('SA9','Mary','Howe','Assistant','F','19-Feb-1970',9000,'B007'),
	('SG5','Susan','Brand','Manager','F','3-Jun-1955',24000,'B003'),
	('SL41','Julie','Lee','Assistant','F','13-Jun-1965',9000,'B005');
	
INSERT INTO client(client_id, fname, lname, telnumber, pref_type, max_rent) VALUES
	('CR76','John','Kay',02077745632,'Flat',425),
	('CR56','Aline','Stewart',01418481825,'Flat',350),
	('CR74','Mike','Ritchie',01475392178,'House',750),
	('CR62','Mary','Tregear',01224196720,'Flat',600);
	

INSERT INTO privateowner (privateowner_id, fname, lname, address, telnumber) VALUES 
	('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX',01224861212),
	('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX',01413577419),
	('CO40','Tina','Murphy','63 Well St, Glasgow G42',01419431728),
	('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR',01412257025);
	
INSERT INTO property4rent (property_id, street, city, postcode, type, romos, rent, owner_id, staff_id, branch_id) VALUES 
	('PA14','16 Holhead','Aberdeen','AB7 5SU','House',6,650,'CO46','SA9','B007'),
	('PL94','6 Argyll St','London','NW2','Flat',4,400,'CO87','SL41','B005'),
	('PG4','6 Lawrence St','Glasgow','G11 9QX','Flat',3,350,'CO40',NULL,'B003'),
	('PG36','2 Manor Rd','Glasgow','G32 4QX','Flat',3,375,'CO93','SG37','B003'),
	('PG21','18 Dale Rd','Glasgow','G12','House',5,600,'CO87','SG37','B003'),
	('PG16','5 Novar Dr','Glasgow','G12 9AX','Flat',4,450,'CO93','SG14','B003');

INSERT INTO viewing (client_id, property_id, viewdate, comment) VALUES 
	('CR56','PA14','24-May-2016','too small'),
	('CR76','PG4','20-Apr-2016','too remote'),
	('CR56', 'PG4','26-May-2016', NULL),
	('CR62','PA14','14-May-2016','no dinning room'),
	('CR56','PG36','28-Apr-2016', NULL);

INSERT INTO registration (client_id, branch_id, staff_id, date_joined) VALUES 
	('CR76','B005','SL41','2-Jan-2004'),
	('CR56','B003','SG37','11-Apr-2003'),
	('CR74','B003','SG37','16-Apr-2002'),
	('CR62','B007','SA9','7-Mar-2003');
	




