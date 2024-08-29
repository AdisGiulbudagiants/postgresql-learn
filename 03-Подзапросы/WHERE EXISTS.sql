--WHERE EXISTS с подзапросом внутри возвращает по сути дело true, если в подзапросе была найдена хотя бы одна строка и то есть WHERE не фильтрует данную запись
SELECT company_name, contact_name
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders
              WHERE customer_id = customers.customer_id
              AND freight BETWEEN 50 AND 100);

--В результирующий набор попадут те, заказчики для которых справедливо условие в WHERE EXISTS
--То есть где "customer_id = customers.customer_id" (здесь идет сравнение из разных таблиц, orders И customers) и где вес находится между 50 и 100 

--Здесь мы ищем заказчиком которые делали заказы в определнный даты
SELECT company_name, contact_name
FROM customers
WHERE EXISTS (SELECT customer_id FROM orders
              WHERE customer_id = customers.customer_id
              AND order_date BETWEEN '1995-02-01' AND '1995-02-15'); --Результата вывода нет, потому что заказчиков в этот период не было

--Здесь мы ищем заказчиком которые НЕ делали заказы в определнный даты
--Для этого мы используем WHERE NOT EXISTS
SELECT company_name, contact_name
FROM customers
WHERE NOT EXISTS (SELECT customer_id FROM orders
              WHERE customer_id = customers.customer_id
              AND order_date BETWEEN '1995-02-01' AND '1995-02-15');

--Здесь выбираем продукты, которые НЕ продавались в определенный период
SELECT product_name
FROM products
WHERE NOT EXISTS (SELECT orders.order_id FROM orders
                  JOIN order_details USING(order_id)
                  WHERE order_details.product_id = product_id
                  AND order_date BETWEEN '1995-02-01' AND '1995-02-15');