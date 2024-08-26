SELECT contact_name, company_name, phone, first_name, last_name, title, order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA';

--Этот код можно сократить используя ключевое слово USING

--Исправленный код
SELECT contact_name, company_name, phone, first_name, last_name, title, order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
JOIN order_details USING(order_id)
JOIN products USING(product_id) 
JOIN customers USING(customer_id) 
JOIN employees USING(employee_id)
WHERE ship_country = 'USA';

--Можно еще короче без USING, но есть и проблемы с этим подходом
SELECT order_id, customer_id, first)name, last_name, title
FROM orders
NATURAL JOIN employees
--NATURAL JOIN работает как и INNER JOIN, а соединение проходит по всем столбцам которые проименованы одинаково
--Проблемы в том, что этот код неявен, менее читаем.
--Гораздо лучше указывать по какому столбцу происходит соединение, потому что это легче отлаживать при появлении ошибок,
--Это более понятно при чтении запросов, а также NATURAL JOIN подвержен забагованности

--ПОДРОБНЕЕ ТУТ:
-- https://www.youtube.com/watch?v=oKVbDq84GzY&t=2136s