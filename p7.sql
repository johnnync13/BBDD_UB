DROP DATABASE IF EXISTS dreamhouse;
CREATE DATABASE dreamhouse;
--conectar con la base de datos
\connect dreamhouse;

--A) Creat tablas
CREATE TABLE "branch"
(
    "branch_id" VARCHAR(5) NOT NULL,
    "street" VARCHAR(25) NOT NULL,
    "city" VARCHAR(15) NOT NULL,
    "postcode" VARCHAR(19) NOT NULL,
    Constraint "branch_pkey" Primary Key ("branch_id")
);

CREATE TABLE "staff"
(
    "staff_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(10) NOT NULL,
    "lname" VARCHAR(10) NOT NULL,
    "position" VARCHAR(15) NOT NULL,
    "sex" VARCHAR(10) NOT NULL,
    "dob" VARCHAR(10) NOT NULL,
    "salary" NUMERIC NOT NULL,
    "branch_id" VARCHAR(5) NOT NULL,
    Constraint "staff_pkey" Primary Key ("staff_id")
);

CREATE TABLE "property4rent"
(
    "property_id" VARCHAR(5) NOT NULL,
    "street" VARCHAR(25) NOT NULL,
    "city" VARCHAR(15) NOT NULL,
    "postcode" VARCHAR(100) NOT NULL,
    "type" VARCHAR(5) NOT NULL,
    "rooms" VARCHAR(10) NOT NULL,
    "rent" NUMERIC NOT NULL,
    "owner_id" VARCHAR(5) NOT NULL,
    "staff_id" VARCHAR(5) NULL,
    "branch_id" VARCHAR(5) NOT NULL,
    Constraint "property_pkey" Primary Key ("property_id")
);

CREATE TABLE "client"
(
    "client_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(10) NOT NULL,
    "lname" VARCHAR(10) NOT NULL,
    "telnumber" VARCHAR(20) NOT NULL,
    "pref_type" VARCHAR(10) NOT NULL,
    "max_rent" VARCHAR(15) NOT NULL,
    Constraint "client_pkey" Primary Key ("client_id")
);

CREATE TABLE "privateowner"
(
    "privateowner_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(25) NOT NULL,
    "lname" VARCHAR(15) NOT NULL,
    "address" VARCHAR(100) NOT NULL,
    "telnumber" VARCHAR(20) NOT NULL,
    Constraint "privateowner_pkey" Primary Key ("privateowner_id")
);

CREATE TABLE "viewing"
(
    "client_id" VARCHAR(5) NOT NULL,
    "property_id" VARCHAR(5) NOT NULL,
    "viewdate" DATE NOT NULL,
    "comment" VARCHAR(30) NULL,
    Constraint "client_prop_pkey" Primary Key ("client_id", "property_id")
);

CREATE TABLE "registration"
(
    "client_id" VARCHAR(5) NOT NULL,
    "branch_id" VARCHAR(5) NOT NULL,
    "staff_id" VARCHAR(5) NOT NULL,
    "date_joined" VARCHAR(10) NOT NULL,
    Constraint "client_branch_pkey" Primary Key ("client_id", "branch_id")
); 

--B)INSERTAR DATOS
INSERT INTO branch (branch_id, street, city, postcode) VALUES
('b005','22 deer rd', 'london', 'sw1 4eh'),
('b007','16 argyll st', 'aberdeen', 'ab2 3su'),
('b003','163 main st', 'glasglow', 'g11 9qx'),
('b004','32 manse rd', 'bristol', 'bs99 1nz'),
('b002','56 clover dr', 'london', 'nw10 6eu');

INSERT INTO staff (staff_id, fname, lname, position, sex, dob, salary, branch_id) VALUES
('sl21', 'john', 'white', 'manager', 'm', '1-oct-45', '30000', 'b005'),
('sg37', 'ann', 'beech', 'assistant', 'f', '10-nov-60', '12000', 'b003'),
('sg14', 'david', 'ford', 'supervisor', 'm', '24-mar-58', '18000', 'b003'),
('sa9', 'mary', 'howe', 'assistant', 'f', '19-feb-70', '9000', 'b007'),
('sg5', 'susan', 'brand', 'manager', 'f', '3-jun-40', '24000', 'b003'),
('sl41', 'julie', 'lee', 'assistant', 'f', '13-jun-65', '9000', 'b005');

INSERT INTO property4rent (property_id, street, city, postcode, type, rooms, rent, owner_id, staff_id, branch_id) VALUES
('pa14', '16 holhead', 'aberteen', 'ab7 5su', 'house','6', '650', 'co46', 'sa9', 'b007'),
('pl94', '6 argyll st', 'london', 'nw2', 'flat' ,'4', '400', 'co87', 'sl41', 'b005'),
('pg4', '6 lawrence st', 'glasgow', 'g11 9qx', 'flat' ,'3', '350', 'co40', NULL, 'b003'),
('pg36', '2 manor rd', 'glasgow', 'g32 4qx', 'flat', '3', '375', 'co93', 'sg37', 'b003'),
('pg21', '18 dale rd', 'glasgow', 'g12', 'house', '5', '600', 'co87', 'sg37', 'b003'),
('pg16', '5 novar dr', 'glasgow', 'g12 9ax', 'flat', '4', '450', 'co93', 'sg14', 'b003');

INSERT INTO client (client_id, fname, lname, telnumber, pref_type, max_rent) VALUES
('cr76', 'john', 'kay', '0207-774-5632', 'flat', '425'),
('cr56', 'aline', 'stewart', '0141-848-1825', 'flat', '350'),
('cr74', 'mike', 'ritchie', '01475-392178', 'house', '750'),
('cr62', 'mary', 'tregear', '01224-196720', 'flat', '600');

INSERT INTO privateowner (privateowner_id, fname, lname, address, telnumber) VALUES
('C046', 'joe', 'keogh', '2 fergus dr, aberdeen ab2 7sx', '01224-861212'),
('C087', 'carol', 'farrel', '6 archay st, glasgow g32 9dx', '0141-357-7419'),
('C040', 'tina', 'murphy', '63 well st, glasgow g42', '0141-943-1728'),
('C093', 'tony', 'shaw', '12 park pl, glasgow g4 0qr', '0141-225-7025');

INSERT INTO viewing (client_id, property_id, viewdate, comment) VALUES
('cr56', 'pa14', '24-may-04', 'too small'),
('cr76', 'pg4', '20-apr-04', 'too remote'),
('cr56', 'pg4', '26-may-04', NULL),
('cr62', 'pa14', '14-may-04', 'no dining room'),
('cr56', 'pg36', '28-apr-04', NULL);

INSERT INTO registration (client_id, branch_id, staff_id, date_joined) VALUES
('cr76', 'b005', 'sl41', '2-jan-04'),
('cr56', 'b003', 'sg37', '11-apr-03'),
('cr74', 'b003', 'sg37', '16-nov-02'),
('cr62', 'b007', 'sa9', '7-mar-03');
--PRACTICA 7
--El codi anterior crea una vista amb nom manager3staff que té tots els treballadors de l’oficina
--amb identificador B003. Si consultes les taules a la base de dades (\d) veuràs que la vista apareix
--com a taula
CREATE VIEW manager3staff AS
SELECT * FROM staff WHERE branch_id = 'b003';
-- Els empleats de l’oficina B003.
SELECT * FROM manager3staff;
CREATE VIEW staffpropcnt (branch_id, staff_id, cnt) AS
SELECT s.branch_id, s.staff_id, COUNT (*)
FROM staff s, property4rent p
WHERE s.staff_id = p.staff_id
GROUP BY s.branch_id, s.staff_id;
--1) Calcula el nombre de treballadors de cada oficina i la suma dels seus salaris.
--2)Per cada oficina amb més d’un empleat, calcula quants empleats treballen en cadascuna
d’elles i la suma dels seus salaris.
SELECT staff_id, fname, lname, position
FROM staff
WHERE branch_id = (SELECT branch_id FROM branch WHERE street = '163 MainSt');
