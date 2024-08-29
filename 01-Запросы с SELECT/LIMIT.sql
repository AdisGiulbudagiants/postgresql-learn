--LIMIT это ключевое слово для ограничения вывода количества колонок
--Всегда указывается самым последним

SELECT product_name, unit_price
FROM products
WHERE discontinued != 1
ORDER BY unit_price DESC
LIMIT 15;

SELECT product_name, unit_price
FROM products
LIMIT 10;