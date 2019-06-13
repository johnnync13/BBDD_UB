
-- A) JOINS
-- Exemple:
SELECT c.client_id, fname, lname, property_id, comment FROM client c, viewing v
	WHERE c.client_id = v.client_id;

SELECT c.client_id, fname, lname, property_id, comment FROM client c 
	INNER JOIN viewing v ON c.client_id = v.client_id;

-- Ex 1:
SELECT p.branch_id, s.staff_id, s.fname, s.lname, p.property_id FROM property4rent p, staff s
	WHERE s.staff_id = p.staff_id ORDER BY p.branch_id ASC;
	
SELECT p.branch_id, s.staff_id, s.fname, s.lname, p.property_id FROM property4rent p 
	INNER JOIN staff s ON s.staff_id = p.staff_id ORDER BY p.branch_id ASC;
	
-- Exercicis --

DROP TABLE if exists table_left;
DROP TABLE if exists table_right;

CREATE TABLE "table_left" (
	"id" VARCHAR (5) NOT NULL,
	"valor" VARCHAR (25),
	Constraint "table_left_pkey" Primary Key ("id")
);

CREATE TABLE "table_right" (
	"id" VARCHAR (5) NOT NULL,
	"valor" VARCHAR (25),
	Constraint "table_right_pkey" Primary Key ("id")
);

INSERT INTO table_left(id, valor) VALUES 
	('1','FOX'),
	('2','COP'),
	('3','TAXI'),
	('4','LINCOLN'),
	('5','ARIZONA'),
	('6','WASHINGTON'),
	('7','DELL'),
	('10','LUCENT');
	
INSERT INTO table_right(id, valor) VALUES 
	('1','TROT'),
	('2','CAR'),
	('3','CAB'),
	('6','MONUMENT'),
	('7','PC'),
	('8','MICROSOFT'),
	('9','APPLE'),
	('10','SCOTCH');
	
-- CONSULTA A)
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left 	
	INNER JOIN table_right ON table_left.id = table_right.id;

-- TODO: CONSULTAS!
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left 
	LEFT JOIN table_right ON table_left.id = table_right.id;

	
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left   
	RIGHT JOIN  table_right  ON table_left.id = table_right.id;
	
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left FULL 
	OUTER JOIN table_right ON table_left.id = table_right.id;	
	
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left 
	LEFT JOIN table_right ON table_left.id = table_right.id 
	WHERE table_right.id IS NULL;
	
SELECT table_left.id, table_left.valor, table_right.id, table_right.valor FROM table_left 
	RIGHT JOIN table_right ON table_left.id = table_right.id
	WHERE table_left.id IS NULL;
	
	
-- 2) Mostratotes les oficines,i propietats que estiguin (o no) a lamateixa ciutat.

SELECT branch.branch_id, property_id FROM branch
	LEFT JOIN property4rent ON branch.city = property4rent.city;
	
SELECT property4rent.branch_id, property_id FROM property4rent
	LEFT JOIN branch ON branch.city = property4rent.city;

-- SELECT branch.branch_id, property_id FROM branch
--	RIGHT JOIN property4rent ON branch.city = property4rent.city;

--1)
SELECT city FROM branch
	UNION SELECT city FROM property4rent;

-- 2)
SELECT city FROM branch
	INTERSECT SELECT city FROM property4rent;

-- 3)
SELECT city FROM branch
	EXCEPT SELECT city FROM property4rent;




