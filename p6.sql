--Practica 6
--A)SELECT 
 --SELECT ens permet escriure i
--realitzar operacions d’àlgebra relacional (selecció, projecció) d’una manera ‘més humana’.
--• SELECT: especifica les columnes que volem recuperar i mostrar en el resultat.
--• FROM: especifica les taules que utilitzarem en la consulta.
--• WHERE: filtra les files de la consulta segons una condició.
--• GROUP BY: agrupa les files del resultat que tinguin el mateix valor a una columna.
--• HAVING: filtra els resultats segons una condició.
--L’ordre no es pot canviar. Una consulta SQL no pot començar amb FROM.
--SELECT i FROM són obligatoris. La resta, opcionals.
--* significa totes les columnes d’una taula. Per exemple, si tenim la relació:
--CLIENT (id, nom, cognom, ciutat, país, telèfon)
SELECT * FROM client;
SELECT nom, telèfon FROM client;
SELECT no, telèfon AS tel FROM client;

SELECT * FROM staff;
SELECT staff_id, fname, lname, salary FROM staff;
SELECT staff_id, salary AS salmen FROM staff;
--B)DISTINCT --PERMITE ELIMINAR DUPLICADOS
SELECT property_id FROM viewing;
SELECT DISTINCT property_id FROM viewing;
--C)WHERE
--Habitualment necessitem restringir les files de les consultes. Això ho podem fer amb la clàusula
--WHERE, seguida de la condició de cerca. Les condicions bàsiques de cerca són:
--• Comparació: compara el valor d’una expressió amb el valor d’una altra expressió
--• Rang: comprova si el valor d’una expressió està dins d’un rang de valors
--• Conjunt: comprova si un valor es troba dins d’un conjunt de valors
--• NULL: comprova si una columna té un valor desconegut
--• Patrons: comprova si un patró alfanumèric es troba a una cadena de caràcters
--Per realitzar les comparacions, podem utilitzar:
--• = igual
--• < > diferent
--• < menor que; > major que; <= menor o igual que; >= major o igual que
--• AND, OR, IN, NOT, BETWEEN, IS (NOT) NULL
--• LIKE (per patrons)
SELECT * FROM staff WHERE salary > 10000;

SELECT * FROM branch WHERE city = 'london' OR city = 'glasgow';

SELECT fname,lname,position FROM staff WHERE salary > 20000 AND salary < 30000;

SELECT fname,lname,position FROM staff WHERE position IN ('manager','supervisor');

SELECT fname,lname,address FROM privateowner WHERE address LIKE '%glasgow%';

SELECT client_id,viewdate FROM viewing WHERE comment IS NULL;

--D)ORDER	BY
--En general, les files d’una consulta SQL no estan ordenades. D’altra banda, però, a vegades ens
--interessa que sí que estiguin ordenades – per exemple, de menor a major en el cas dels salaris. Per
--això, utilitzem la clàusula ORDER BY 
SELECT staff_id, fname, lname, salary FROM staff ORDER BY salary DESC;

SELECT property_id, type, rooms, rent FROM property4rent ORDER BY type ASC;

SELECT property_id, type, rooms, rent FROM property4rent ORDER BY type ASC , rent ASC;
--E)	Funcions	d’agregació
--Les funcions d’agregació ens permeten realitzar operacions que no siguin únicament de consulta.
--Les funcions d’agregació que veurem a l’assignatura són:
--• COUNT: retorna el número de files d’una columna.
--• SUM: retorna la suma de valors d’una columna.
--• AVG: retorna la mitjana dels valors d’una columna.
--• MIN / MAX: retorna el valor mínim i / o màxim d’una columna.
--Les funcions d’agregació treballen sobre una única columna i retornen un únic valor.
--AVG, MIN i MAX únicament treballen amb camps numèrics.
--Per eliminar duplicats, escrivim DISTINCT abans del nom de la columna. DISTINCT no té cap
--efecte amb MIN i MAX.
--Les funcions d’agregació es poden utilitzar amb la clàusula SELECT i HAVING. No es poden
--utilitzar en qualsevol altre lloc de la consulta.
SELECT COUNT (*) FROM property4rent WHERE rent > 350;

SELECT  COUNT (DISTINCT property_id) FROM viewing WHERE viewdate BETWEEN '1-apr-04' AND '31-may-04';

SELECT COUNT (position), SUM(salary) FROM staff WHERE position = 'manager';

SELECT MIN(salary),MAX(salary),AVG(salary) FROM staff;
--E)	Transaccions
--Tot i que les transaccions no formin part de les consultes senzilles, són part d’aquesta pràctica
--perquè les podem relacionar amb les consultes.
--PostgreSQL té AUTOCOMMIT per defecte. Això significa que sempre es realitza un COMMIT
--després d’executar instruccions SQL. Per indicar que volem iniciar una transacció de manera
--explícita – i, per tant, haurem d’acabar amb un COMMIT o ROLLBACK – hem d’escriure BEGIN.
--Realitza les següents transaccions i comenta el que succeeix.
BEGIN;
DELETE FROM branch WHERE branch_id = 'b005';
SELECT * FROM branch;
ROLLBACK;
SELECT * FROM branch;
--ROLLBACK deshace los cambios en la base de datos realizados en BEGIN;