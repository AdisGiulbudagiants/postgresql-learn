--Необхдимо выбрать все уникальные компании заказчиков, которые делали заказы на более чем 40 единиц товаров
SELECT DISTINCT company_name
FROM customers
JOIN orders USING(customer_id)
JOIN order_details USING(order_id)
WHERE quantity > 40;

--Тоже самое можно реализовать с подзапросом

--Это сам подзапрос, его нужно объединить с внешней частью
SELECT customer_id
FROM orders
JOIN order_details USING(order_id)
WHERE quantity > 40

SELECT DISTINCT company_name
FROM customers
WHERE customer_id = ANY( --Здесь мы проверяем совпадает ли customer_id с какой-либо записью из подзапроса, для этого используется ключевое слово ANY
    SELECT customer_id
    FROM orders
    JOIN order_details USING(order_id)
    WHERE quantity > 40
);

--Давайте выберем такие продукты, количество которых больше среднего по заказам
--Это сам подзапрос
SELECT AVG(quantity)
FROM order_details

SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity > (
    SELECT AVG(quantity)
    FROM order_details
)
ORDER BY quantity;

--Кроме ANY есть также полезное ключевое слово ALL

--Предположим, что нам нужно найти все продукты, количество которых больше среднего значения количества среднего значения из групп по product_id
--Это сам подзапрос
SELECT AVG(quantity)
FROM order_details
GROUP BY product_id

SELECT DISTINCT product_name, quantity
FROM products
JOIN order_details USING(product_id)
WHERE quantity > ALL ( --Мы хотим найти те продукты, количество которых больше чем ЛЮБОЕ из средних значений
    SELECT AVG(quantity)
    FROM order_details
    GROUP BY product_id
)
ORDER BY quantity;
