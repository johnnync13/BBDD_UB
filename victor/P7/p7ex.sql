-- A) VISTES

-- EXEMPLE:

DROP VIEW IF EXISTS staffpropcnt;

CREATE VIEW staffpropcnt (branch_id, staff_id, cnt) 
	AS SELECT s.branch_id, s.staff_id, COUNT (*) FROM staff s, property4rent p
	WHERE s.staff_id = p.staff_id
	GROUP BY s.branch_id, s.staff_id;

SELECT * FROM staffpropcnt;
-- INSERT INTO staffpropcnt VALUES ('B003', 'SG5', 2);
--SELECT * FROM staffpropcnt;


-- Ex 1: Crear una vista de los empleados de la oficina con id B003 sin su salario
-- Para elminar una vista: DROP VIEW nom-de-la-vista

DROP VIEW IF EXISTS staffnosalaryview;

CREATE VIEW staffnosalaryview
	AS SELECT staff_id,fname,lname,position,sex,dob,branch_id FROM staff
	WHERE branch_id='B003';

SELECT * FROM staffnosalaryview;

-- B) GROUP BY, HAVING

-- WHERE treballa sobre files individuals
-- HAVING treballa per grups

-- Ex 1: Calcula el nombre de treballadors de cada oficina i la suma dels seus salaris
SELECT branch_id, COUNT(staff_id), SUM(salary) FROM staff
	GROUP BY branch_id ORDER BY SUM DESC;
	
-- Ex 2: Per cada oficina amb més d’un empleat, calcula quants empleats treballen en cadascuna d’elles i la suma dels seus salaris.
SELECT branch_id, COUNT(staff_id), SUM(salary) FROM staff
	GROUP BY branch_id HAVING COUNT(staff_id)>1 ORDER BY SUM DESC;
	
-- C) CONSULTES NIADES

-- EXEMPLE:
SELECT staff_id, fname, lname, position FROM staff
	WHERE branch_id = (SELECT branch_id FROM branch WHERE street = '163 Main St');
	
-- Ex 1:
DROP VIEW IF EXISTS salaryavg;

CREATE VIEW salaryavg
	AS SELECT AVG(salary) FROM staff;
	
SELECT * FROM salaryavg;

SELECT fname,lname,position,salary-(SELECT AVG FROM salaryavg) AS salarydif FROM staff
	WHERE salary-(SELECT AVG FROM salaryavg) >= 0; 
	
-- Ex 2:
SELECT property_id,street,city,postcode,type,romos,rent FROM property4rent
	WHERE staff_id IN (SELECT staff_id FROM staff 
	WHERE branch_id=(SELECT branch_id FROM branch WHERE street='163 Main St'));
	
-- Exercicis --

SELECT staff_id, fname, lname, position, salary FROM staff
	WHERE salary > ANY(SELECT salary FROM staff WHERE branch_id='B003');
	
SELECT staff_id, fname, lname, position, salary FROM staff
	WHERE salary > ALL(SELECT salary FROM staff WHERE branch_id='B003');

	
