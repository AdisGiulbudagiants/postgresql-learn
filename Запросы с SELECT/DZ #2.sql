SELECT *
FROM orders
WHERE ship_country IN('France','Austria','Spain');

SELECT *
FROM orders
ORDER BY required_date DESC, shipped_date ASC;

SELECT MIN(unit_price)
FROM products
WHERE units_in_stock > 30;

SELECT MAX(units_in_stock)
FROM products
WHERE unit_price > 30;

SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country IN ('USA');

SELECT SUM(units_in_stock * unit_price)
FROM products
WHERE discontinued != 1;