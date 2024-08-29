--Обединение данных из двух таблиц

SELECT product_name, units_in_stock , suppliers.company_name 
--Несмотря на то, что названия столбцов находятся в разных таблицах, мы их просто перечисляем через запятую.
--Но если названия столбцов одинаковые в двух разных таблицах, то можно обращатся через таблицу вот так: "suppliers.company_name"
FROM products
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id 
--После INNER JOIN пишем название таблицы, после которой происходит соединение
--Далее ON и после нужно написать по какому столбцу мы производим соединение. Здесь мы обращаемся через таблицу
--Мы проводим соединение по supplier_id
ORDER BY units_in_stock DESC;


--Считаем сколько единиц товара в продаже по категориям товаров, для этого нам нужно объединить продукты с категориями

SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT 5;


SELECT category_name, SUM(units_in_stock * unit_price)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued != 1
GROUP BY category_name
HAVING SUM(units_in_stock * unit_price) > 5000
ORDER BY SUM(units_in_stock * unit_price) DESC;


SELECT order_id, customer_id, first_name, last_name, title
FROM orders
INNER JOIN employees ON orders.employee_id = employees.employee_id;


--Множественное соединение

SELECT order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id;

SELECT contact_name, company_name, phone, first_name, last_name, title, order_date, product_name, ship_country, products.unit_price, quantity, discount
FROM orders
--INNER JOIN можно просто сокращать до просто JOIN
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
WHERE ship_country = 'USA';