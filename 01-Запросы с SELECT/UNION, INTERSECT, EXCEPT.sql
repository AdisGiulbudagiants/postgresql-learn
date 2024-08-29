-- UNION - Объединения
-- INTERSECT - Пересечения
-- EXCEPT - Исключения

--UNION
--Задача вывести все страны из которых наши заказчики и работники
SELECT country
FROM customers
UNION --объединение двух разных таблиц. Также УСТРАНЯЕТ дупликаты, если они имеются
SELECT country
FROM employees;

SELECT country
FROM customers
UNION ALL --Тоже самое, но НЕ УСТРАНЯЕТ имеются дупликаты
SELECT country
FROM employees;


--INTERSECT

SELECT country
FROM customers
INTERSECT
SELECT country
FROM suppliers;
--Это список стран из которых одновременно происходят и заказчики и supplier'ы


--EXCEPT

SELECT country
FROM customers
EXCEPT
SELECT country
FROM suppliers;
--То есть в таблице customers есть 9 стран в которых supplier'ы не проживают

--##############################################################################

SELECT country
FROM customers
WHERE country = 'USA'; -- Здесь при выводе получается 13 USA

SELECT COUNT(country)
FROM suppliers
WHERE country = 'USA'; -- Здесь при выводе получается 4 USA

SELECT country
FROM customers
EXCEPT ALL
SELECT country
FROM suppliers;
--Здесь мы получим те страны, которые есть в таблице suppliers, но встречаются меньшее кол-во раз чем в таблице customers.
--То есть будет учитываться кол-во дубликатов.
--Этот вариант вычисляет разницу между customers и suppliers, то есть  13 - 4 = 9 USA в этом выводе должно быть

--###############################################################################


