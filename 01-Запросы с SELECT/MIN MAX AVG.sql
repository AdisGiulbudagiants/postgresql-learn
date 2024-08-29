SELECT ship_city, order_date
FROM orders
WHERE ship_city = 'London'
ORDER BY ship_city;

SELECT MIN(order_date)
FROM orders
WHERE ship_city = 'London';

--MIN ищет минемальное значение в заданной колонке

SELECT ship_city, order_date
FROM orders
WHERE ship_city = 'London'
ORDER BY ship_city;

SELECT MAX(order_date)
FROM orders
WHERE ship_city = 'London';

--MAX ищет максимальное значение в заданной колонке

SELECT AVG(unit_price)
FROM products
WHERE discontinued != 1;

--AVG ищет среднее значение в заданной колонке

SELECT SUM(units_in_stock)
FROM products
WHERE discontinued != 1;

--SUM складывает целую колонку