--DDL (Data Definition Language) это часть SQL синтаксиса, которая позволяет манипулировать данными

--CREATE TABLE table_name - Команда для создания новой таблицы
--ALTER TABEL table_name - Команда для изменения в существующей таблице. У ALTER TABLE доступны также команды:
        
        --ADD COLUMN column_name data_type - Команда позволяет добавить столбец в уже существующую таблицу.
        --После ADD COLUMN мы пишем имя для будущего столбца и после этого следует тип данных этого столбца
        
        --RENAME TO new_table_name - Команда для переименования самой таблицы
        
        --RENAME old_column_name TO new_column_name - Команда для переименования столбца в таблице
        
        --ALTER COLUMN column_name SET DATA TYPE data_type - Команда для изменения типа данных в столбце

--DROP TABLE table_name - Команда для удаления таблицы
--TRUNCATE TABLE table_name - Команда для удаления всех данных внутри таблицы, 
                            --но она не может удалить данные на которые есть ссылки из других таблиц
--DROP COLUMN column_name - Командя для удаления столбца в таблице

--Создание таблиц в базе данных
CREATE TABLE student (
    student_id serial,
    first_name varchar,
    last_name varchar,
    birthday date,
    phone varchar
);

CREATE TABLE cathedra (
    cathedra_ud serial,
    cathedra_name varchar,
    dekan varchar
);

--Добавляем столбцы в таблицу student
ALTER TABLE student
ADD COLUMN middle_name varchar;

ALTER TABLE student
ADD COLUMN rating float;

ALTER TABLE student
ADD COLUMN enrolled date;


--Удаление столбца в таблице
ALTER TABLE student
DROP COLUMN middle_name;


--Переименование таблицы
ALTER TABLE cathedra
RENAME TO chair;


--Переименование столбца
ALTER TABLE chair
RENAME cathedra_ud TO chair_id;

ALTER TABLE chair
RENAME cathedra_name TO chair_name;

ALTER TABLE chair
RENAME dekan TO dean;


--Изменение типа столбца
ALTER TABLE student
ALTER COLUMN first_name SET DATA TYPE varchar(64);
ALTER TABLE student
ALTER COLUMN last_name SET DATA TYPE varchar(64);
ALTER TABLE student
ALTER COLUMN phone SET DATA TYPE varchar(30);



CREATE TABLE faculty (
    faculty_id serial,
    faculty_name varchar
);

INSERT INTO faculty (faculty_name) --Если мы пропускаем serial, то нужно в скобочках указать, что мы вставляем faculty_name
VALUES
('faculty-1'),
('faculty-2'),
('faculty-3'),
('faculty-4');

SELECT * FROM faculty;

--Удаление данных из таблицы
TRUNCATE TABLE faculty; --По дефолту эта команда не перезапускает тип данных serial и если после этого снова добавить данные, то отсчет serial продолжиться как раньше
--Эта проблема решается добавлением RESTART IDENTITY
TRUNCATE TABLE faculty RESTART IDENTITY;

--Удаление таблицы полностью
DROP TABLE faculty;