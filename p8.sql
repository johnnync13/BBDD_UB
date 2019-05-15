--SELECT * FROM pg_stat_activity WHERE datname = 'entrega';
--CON ESTO PODEMOS BORRAR LA BASE DE DATOS, para desconectar
--SELECT pg_terminate_backend (pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'entrega';
--\q
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'entrega' AND pid <> pg_backend_pid();
DROP DATABASE IF EXISTS entrega;
CREATE DATABASE entrega;
--conectar con la base de datos
\connect entrega;

CREATE TABLE "table_left"
(
    "id" VARCHAR(5) NOT NULL,
    "value" VARCHAR(25) NOT NULL,
    Constraint "table_left_pkey" Primary Key ("id")
);

CREATE TABLE "table_right"
(
    "id" VARCHAR(5) NOT NULL,
    "value" VARCHAR(25) NOT NULL,
    Constraint "table_right_pkey" Primary Key ("id")
);

INSERT INTO table_left (id,value) VALUES
('1','FOX'),
('2','COP'),
('3','TAXI'),
('6','WASHINGTON'),
('7','DELL'),
('5','ARIZONA'),
('4','LINCOLN'),
('10','LUCENT');

INSERT INTO table_right (id,value) VALUES
('1','TROT'),
('2','CAR'),
('3','CAB'),
('6','MONUMENT'),
('7','PC'),
('8','MICROSOFT'),
('9','APPLE'),
('10','SCOTCH');

SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left INNER JOIN table_right ON table_left.id = table_right.id;
SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left LEFT JOIN table_right ON table_left.id = table_right.id;
SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left RIGHT JOIN table_right ON table_left.id = table_right.id;
SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left FULL OUTER JOIN table_right ON table_left.id = table_right.id;
SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left LEFT JOIN table_right ON table_left.id = table_right.id WHERE table_right.id IS NULL;
SELECT table_left.id, table_left.value, table_right.id, table_right.value FROM table_left RIGHT JOIN table_right ON table_left.id = table_right.id WHERE table_left.id IS NULL;