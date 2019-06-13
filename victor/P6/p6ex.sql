-- Seleccionar todas las filas de una tabla --
SELECT * FROM client;

-- Seleccionar solo ciertas filas de una tabla --
SELECT fname, telnumber FROM client;

-- Renombrar una fila --
SELECT fname AS name, telnumber AS tel FROM client;



-- Ex 1: Mostrar tots els detalls dels empleats --
SELECT * FROM staff;

-- Ex 2: Per cada empleat mostrar el seu numero d'id, nom, cognom i salari --
SELECT staff_id, fname, lname, salary FROM staff;

-- Ex 3: Per cada empleat mostrar el numero d'id i el seu salari mensual amb la columna renombrada a salmen --
SELECT staff_id, salary AS salmen FROM staff;



-- 2) DISTINCT -- ELIMINAR DUPLICADOS
-- SELECT NO elimina DUPLICATS -> Per elminar duplicats utilitzem DISTINCT

-- Con duplicados --
SELECT property_id FROM viewing;

-- Sin duplicados --
SELECT DISTINCT property_id FROM viewing;


-- 3) WHERE X 

-- Ex 1: Mostrar tots els empleats amb un salari > 10.000
SELECT staff_id, fname, lname, salary FROM staff
	WHERE salary > 10000;
	
-- Ex 2: Mostrar la direccion de todas las oficinas a Londres o Glasgow --
SELECT * FROM branch
	WHERE city='London' OR city='Glasgow';
	
-- Ex 3: Mostrar nom, cognom, carrec i salary dels empleats de salari entre 20k i 30k --
SELECT fname, lname, position, salary FROM staff
	WHERE salary BETWEEN 20000 AND 30000;
	
-- Ex 4: Mostrar nom, cognom, carrec de tots els managers i supervisors utilitzant 'IN' --
SELECT fname, lname, position FROM staff
	WHERE position IN ('Manager', 'Supervisor');
	
-- Ex 5: Mostrar todos los propietarios que tengan la palabra Glasgow en su direccion. 
-- Utilizando el operador LIKE --
-- LIKE 'H%' Siginifca que empieza por H mayus i el resto puede ser X
-- LIKE 'H__' Significa que empeiza por H y tiene 3 caracteres.
SELECT fname, lname, address FROM privateowner
	WHERE address LIKE '%Glasgow%';
	
-- Ex 6: Para los propietarios sin comentarios en su visita, 
-- mostrar el identificador de los clientes i la fecha en la que visitaron. NUll aparece como '' en SQL
SELECT client_id, viewdate FROM viewing
	WHERE comment IS NULL; -- REVISAR --
	

-- 4) ORDER BY -- ASC | DESC

-- Ex 1: Mostrar una llista de empleats ordenada pel salari en ordre descendent --
SELECT staff_id, fname, lname, salary FROM staff
	ORDER BY salary DESC;
	
-- Ex 3: Mostrar un llistat de les propietats per llogar ordenades per tipus
SELECT property_id, pr.type, romos, rent FROM property4rent pr
	ORDER BY pr.type ASC;
	
-- Ex 3: Mostrar un llistat de les propietats per llogar ordenades per tipus i lloger en ASC
SELECT property_id, pr.type, romos, rent FROM property4rent pr
	ORDER BY pr.type, rent ASC;
	

-- 5) FUNCIONS D'AGREGACIO --

-- Ex 1: cuantas prop tienen un alquiler mas grande a 350?
SELECT COUNT(rent) AS resultado FROM property4rent
	WHERE rent > 350;
	
-- Ex 2: Cuantas propiedades diferentes fueron visitadas entre Marzo y abril del 2003
SELECT COUNT(viewdate) AS resultado FROM viewing
	WHERE viewdate BETWEEN '1-Mar-2016' AND '30-Apr-2016';

-- Ex 3: Cuantos managers hay en la base de datos y cual es la suma de sus salarios --
SELECT COUNT(position), SUM(salary) FROM staff
	WHERE position='Manager';
	
-- Ex 4: Mostrar el salari minim, maxim i mitja de treballadors
SELECT MIN(salary), MAX(salary), AVG(salary) FROM staff;
	

-- 6) Transaccions

BEGIN;
SELECT * FROM branch;
DELETE FROM branch WHERE branch_id='B005';
SELECT * FROM branch;
ROLLBACK;




