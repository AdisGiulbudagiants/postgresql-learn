--Левое соединение более используемое, чем Правое

SELECT company_name, product_name
FROM suppliers
LEFT JOIN products ON suppliers.supplier_id = products.supplier_id;

SELECT company_name, product_name
FROM suppliers
INNER JOIN products ON suppliers.supplier_id = products.supplier_id;
--Эти два вызова имеют одинаковый ответ 

--Зачем может понадобиться LEFT JOIN?
--Что если мы хотим определить компании, в которых не висят никакие заказы?
--Это как раз нужно делать с помощью LEFT JOIN
SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;

--Тоже самое с RIGHT JOIN, что и пример выше
SELECT company_name, order_id
FROM orders
RIGHT JOIN customers ON customers.customer_id = orders.customer_id
WHERE order_id IS NULL;


--Есть ли у нас работники, которые не обрабатывают никакие заказы?
SELECT first_name, last_name, order_id
FROM employees
LEFT JOIN orders ON employees.employee_id = orders.employee_id
WHERE order_id IS NULL; --В данном случае, работником без заказов нет