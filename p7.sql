DROP DATABASE IF EXISTS dreamhouse;
CREATE DATABASE dreamhouse;
\connect dreamhouse;

CREATE TABLE "branch"  (
    "branch_id" VARCHAR(5) NOT NULL,
    "street" VARCHAR(25) NOT NULL,
    "city" VARCHAR(15) NOT NULL,
    "postcode" VARCHAR(10) NOT NULL,
    Constraint "branch_pkey" Primary Key ("branch_id")
);

CREATE TABLE "staff"  (
    "staff_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(15) NOT NULL,
    "lname" VARCHAR(15) NOT NULL,
    "position" VARCHAR(15) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "dob" VARCHAR(15) NOT NULL,
    "salary" FLOAT NOT NULL,
    "branch_id" VARCHAR(5),
    Constraint "staff_pkey" Primary Key ("staff_id")
);

CREATE TABLE "property4rent"  (
    "property_id" VARCHAR(5) NOT NULL,
    "street" VARCHAR(25) NOT NULL,
    "city" VARCHAR(15) NOT NULL,
    "postcode" VARCHAR(10) NOT NULL,
    "type" VARCHAR(10) NOT NULL,
    "rooms" INT NOT NULL,
    "rent" INT NOT NULL,
    "owner_id" VARCHAR(5),
    "staff_id" VARCHAR(5),
    "branch_id" VARCHAR(5),
    Constraint "property_pkey" Primary Key ("property_id")
);

CREATE TABLE "client"  (
    "client_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(15) NOT NULL,
    "lname" VARCHAR(15) NOT NULL,
    "telnumber" VARCHAR(15),
    "pref_type" VARCHAR(10),
    "max_rent" INT NOT NULL,
    Constraint "client_pkey" Primary Key ("client_id")
);

CREATE TABLE "privateowner"  (
    "owner_id" VARCHAR(5) NOT NULL,
    "fname" VARCHAR(15) NOT NULL,
    "lname" VARCHAR(15) NOT NULL,
    "address" VARCHAR(35) NOT NULL,
    "telnumber" VARCHAR(20),
    Constraint "owner_pkey" Primary Key ("owner_id")
);

CREATE TABLE "viewing"  (
    "client_id" VARCHAR(5) NOT NULL,
    "property_id" VARCHAR(5) NOT NULL,
    "viewdate" VARCHAR(20) NOT NULL,
    "comment" VARCHAR(30),
    Constraint "viewing_pkey" Primary Key ("client_id", "property_id")
);

CREATE TABLE "registration" (
    "client_id" VARCHAR (5) NOT NULL,
    "branch_id" VARCHAR (5) NOT NULL,
    "staff_id" VARCHAR (5) NOT NULL,
    "date_joined" VARCHAR(20) NOT NULL,
    Constraint "registration_pkey" Primary Key ("client_id", "branch_id")
);


INSERT INTO branch VALUES ('B005','22 Deer Rd', 'London', 'SW1 4EH');
INSERT INTO branch VALUES ('B007','16 Argyll St', 'Aberdeen', 'AB2 3SU');
INSERT INTO branch VALUES ('B003','163 Main St', 'Glasgow', 'G11 9QX');
INSERT INTO branch VALUES ('B004','32 Manse Rd', 'Bristol', 'BS99 1NZ');
INSERT INTO branch VALUES ('B002','56 Clover Dr', 'London', 'NW10 6EU');

INSERT INTO staff VALUES ('SL21','John', 'White', 'Manager', 'M', '1-Oct-45', 30000.0, 'B005');
INSERT INTO staff VALUES ('SG37','Ann', 'Beech', 'Assistant', 'F', '10-Nov-60', 12000.0, 'B003');
INSERT INTO staff VALUES ('SG14','David', 'Ford', 'Supervisor', 'M', '24-Mar-58', 18000.0, 'B003');
INSERT INTO staff VALUES ('SA9','Mary', 'Howe', 'Assistant', 'F', '19-Feb-70', 9000.0, 'B007');
INSERT INTO staff VALUES ('SG5','Susan', 'Brand', 'Manager', 'F', '3-Jun-40', 24000.0, 'B003');
INSERT INTO staff VALUES ('SL41','Julie', 'Lee', 'Assistant', 'F', '13-Jun-65', 9000.0, 'B005');

INSERT INTO property4rent VALUES ('PA14','16 Holhead', 'Aberdeen', 'AB7 5SU', 'House', 6, 650, 'CO46','SA9','B007');
INSERT INTO property4rent VALUES ('PL94','6 Argyll St', 'London', 'NW2', 'Flat', 4, 400, 'CO87','SL41','B005');
INSERT INTO property4rent VALUES ('PG4','6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', 3, 350, 'CO40',NULL,'B003');
INSERT INTO property4rent VALUES ('PG36','2 Manor Rd', 'Glasgow', 'G32 4QX', 'Flat', 3, 375, 'CO93','SG37','B003');
INSERT INTO property4rent VALUES ('PG21','18 Dale Rd', 'Glasgow', 'G12', 'House', 5, 600, 'CO87','SG37','B003');
INSERT INTO property4rent VALUES ('PG16','5 Novar Dr', 'Glasgow', 'G12 9AX', 'Flat', 4, 450, 'CO93','SG14','B003');

INSERT INTO client VALUES ('CR76','John','Kay','0207-774-5632','Flat',425);
INSERT INTO client VALUES ('CR56','Aline','Stewart',0141-848-1825,'Flat',350);
INSERT INTO client VALUES ('CR74','Mike','Ritchie',01475-392178,'House',750);
INSERT INTO client VALUES ('CR62','Mary','Tregear',01224-196720,'Flat',600);

INSERT INTO privateowner VALUES ('CO46','Joe','Keogh','2 Fergus Dr Aberdeen AB2 7SX','01224-861212');
INSERT INTO privateowner VALUES ('CO87','Carol','Farrel','6 Achray St Glasgow G32 9DX','0141-357-7419');
INSERT INTO privateowner VALUES ('CO40','Tina','Murphy','63 Well St Glasgow G42','0141-943-1728');
INSERT INTO privateowner VALUES ('CO93','Tony','Shaw','12 Park Pl Glasgow G4 0QR','0141-225-7025');

INSERT INTO viewing VALUES ('CR56','PA14', '24-May-04', 'too small');
INSERT INTO viewing VALUES ('CR76','PG4', '20-Apr-04', 'too remote');
INSERT INTO viewing VALUES ('CR56','PG4', '26-May-04', NULL);
INSERT INTO viewing VALUES ('CR62','PA14', '14-May-04', 'no dining room');
INSERT INTO viewing VALUES ('CR56','PG36', '28-Apr-04', NULL);

INSERT INTO registration VALUES ('CR76','B005', 'SL41', '2-Jan-04');
INSERT INTO registration VALUES ('CR56','B003', 'SL37', '11-Apr-03');
INSERT INTO registration VALUES ('CR74','B003', 'SG37', '16-Nov-02');
INSERT INTO registration VALUES ('CR62','B007', 'SA9', '7-Mar-03');



/*UPDATE staff SET salary = salary + salary*0.05 WHERE position = 'Manager';
UPDATE staff SET position = 'Manager' WHERE staff_id = 'SG14';
DELETE FROM viewing WHERE property_id = 'PG4';


ALTER TABLE staff ADD CONSTRAINT "staff_FK" FOREIGN KEY("branch_id")
REFERENCES branch ("branch_id");

ALTER TABLE property4rent ADD CONSTRAINT "property_FK" FOREIGN KEY("branch_id")
REFERENCES branch ("branch_id");
ALTER TABLE property4rent ADD CONSTRAINT "property_FK2" FOREIGN KEY("staff_id")
REFERENCES staff ("staff_id");
ALTER TABLE property4rent ADD CONSTRAINT "property_FK3" FOREIGN KEY("owner_id")
REFERENCES privateowner ("owner_id");

ALTER TABLE viewing ADD CONSTRAINT "viewing_FK" FOREIGN KEY("property_id")
REFERENCES property4rent ("property_id");
ALTER TABLE viewing ADD CONSTRAINT "viewing_FK2" FOREIGN KEY("client_id")
REFERENCES client ("client_id");

ALTER TABLE registration ADD CONSTRAINT "registration_FK" FOREIGN KEY("client_id")
REFERENCES client ("client_id");
ALTER TABLE registration ADD CONSTRAINT "registration_FK2" FOREIGN KEY("branch_id")
REFERENCES branch ("branch_id");
ALTER TABLE registration ADD CONSTRAINT "registration_FK3" FOREIGN KEY("staff_id")
REFERENCES staff ("staff_id");*/

CREATE VIEW staffNoSalary AS SELECT staff_id,fname,lname,position,sex,dob,branch_id FROM staff WHERE branch_id='B003';
SELECT * FROM staffNoSalary;
SELECT branch_id, COUNT(staff_id), SUM(salary) FROM staff GROUP BY branch_id ORDER BY SUM;
SELECT branch_id, COUNT(staff_id), SUM(salary) FROM staff GROUP BY branch_id HAVING COUNT(staff_id)>1 ORDER BY SUM;

CREATE VIEW avg AS SELECT AVG(salary) FROM staff;
SELECT fname,lname,position,salary-(SELECT avg FROM avg) AS saldif FROM staff WHERE salary-(SELECT avg FROM avg)>0;

SELECT property_id,street,city,postcode,type,rooms,rent FROM property4rent WHERE staff_id IN (SELECT staff_id FROM staff WHERE branch_id=(SELECT branch_id FROM branch WHERE street='163 Main St'));

SELECT staff_id,fname,lname,position,salary FROM staff WHERE salary>ANY(SELECT salary FROM staff WHERE branch_id='B003');
SELECT staff_id,fname,lname,position,salary FROM staff WHERE salary>ALL(SELECT salary FROM staff WHERE branch_id='B003');