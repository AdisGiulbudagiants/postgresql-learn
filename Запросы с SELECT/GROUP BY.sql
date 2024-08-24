--Эта структурная часть распологается между WHERE и ORDER BY

SELECT ship_country, COUNT(*)
FROM orders
WHERE freight > 50
GROUP BY ship_country --Группируем по странам, мы хотим по каждой стране видеть сколько в каждую страну отправлется посылок весом более 50
ORDER BY COUNT(*) DESC;

SELECT category_id, SUM(units_in_stock)
FROM products
GROUP BY category_id
ORDER BY SUM(units_in_stock) DESC
LIMIT 5;

