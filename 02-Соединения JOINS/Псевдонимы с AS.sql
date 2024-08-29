--Для проименовывания колонок в SQL есть Псевдонимы и ключевое слово в них AS.

SELECT COUNT(*) AS employees_count --Переименовали колонку на employees_count
FROM employees;

SELECT COUNT(DISTINCT country) AS country
FROM employees;

--Этими псевдонимами нельзя пользоваться в WHERE и в HAVING, потому что когда отрабатывает WHERE И HAVING псевдоним еще не назначен
--SELECT работает после FROM И WHERE

--Но можно использовать в GROUP BY и ORDER BY, потому что они происходят уже после того как происходит SELECT

SELECT category_id, SUM(units_in_stock) AS units_in_stock
FROm products
GROUP BY category_id
ORDER BY units_in_stock DESC --здесь мы обращаемся по ранее заданному псевдониму units_in_stock
LIMIT 5;

SELECT category_id, SUM(unit_price * units_in_stock) AS total_price
FROM products
WHERE discontinued != 1
GROUP BY category_id
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY total_price DESC; --здесь мы обращаемся по ранее заданному псевдониму total_price

--Также псевдонимы можно использовать при наличии подзапросов

--Псевдонимы стоит использовать ко всем калькулируемым столбцам, а также где это возможно, чтобы не дублировать длинные выражения
