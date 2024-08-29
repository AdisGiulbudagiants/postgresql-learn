--1
SELECT c.company_name, CONCAT(e.first_name, ' ', e.last_name)
FROM orders AS o
JOIN customers AS c USING(customer_id)
JOIN employees AS e USING(employee_id)
JOIN shippers AS s ON o.ship_via = s.shipper_id
WHERE c.city = 'London' AND e.city = 'London' AND s.company_name = 'Speedy Express';

--2
SELECT product_name, units_in_stock, contact_name, phone
FROM products
JOIN categories AS c USING(category_id)
JOIN suppliers AS s USING(supplier_id)
WHERE discontinued != 1 AND category_name IN ('Beverages','Seafood') AND units_in_stock < 20
ORDER BY units_in_stock DESC;

--3
SELECT contact_name, order_id
FROM customers
LEFT JOIN orders USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;

--4
SELECT contact_name, order_id
FROM orders
RIGHT JOIN customers USING(customer_id)
WHERE order_id IS NULL
ORDER BY contact_name;