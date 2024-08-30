--Этот синтаксис используется тогда, когда мы намереваемся вставить данные по всем столбцам
INSERT INTO chair
VALUES
(1, 'Economy','Anet');

--Если мы хотим вставить данные лишь частично, нам надо в скобках после названия таблицы указать имена столбцом куда мы хотим вставить данные
INSERT INTO chair (chair_id, chair_name)
VALUES 
(2, 'Mathematics');

--Также мы можем вствлять больше одной строчки за раз
INSERT INTO chair (chair_id, chair_name)
VALUES 
(2, 'Mathematics'),
(3, 'Mathematics1'),
(4, 'Mathematics2');

--Синтаксис для создания сразу таблицы
SELECT *
INTO best_chairs
FROM chair
WHERE chair_id > 1;

SELECT * FROM best_chairs;

--Если мы хотим сделать из какой-то таблицы SELECT и эти данные вставить в другую таблицу, то это нужно сделать по другому
INSERT INTO best_chairs
SELECT * 
FROM chair
WHERE chair_id < 4;