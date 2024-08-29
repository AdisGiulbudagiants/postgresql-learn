--Запросы бывают логически сложными, в таком случае можно напсать подзапрос, который решает часть задачи
--Бывают запросы, которые без подзапросов реализовать тяжело либо невозможно
--Подзапросы всегда идут в скобках

--Если можно избавиться от подзапросы - надо ли это делать?
--  Не обязательно
--  Если запрос с подзапросом так же производителен как и запрос с соединением, то надо сравнивать читабельность
--  Зачастую, планировщик раскрывает запросы с подзапросами в запросы с соединениями



--Это мы выводим страны из которых заказчики
SELECT DISTINCT country
FROM customers;

--Как найти все компании поставщиков, которые находятся в списке выше?
--Мы могли бы сделать как ниже, но тогда нужно перечислять очень много стран
SELECT company_name
FROM suppliers
WHERE country IN ('USA','Argentina');

--Для рещения нужно использовать подзапрос.
SELECT company_name,country
FROM suppliers
WHERE country IN(SELECT DISTINCT country FROM customers);
--Соотвественно из suppliers будут возвращаться только те записи в которых country находится в списке SELECT country FROM customers

--Запросы выше можно было и переписать без подзапроса с помощью JOIN
SELECT DISTINCT suppliers.company_name
FROM suppliers
JOIN customers USING(country);

--Что если мы хотим вывести сумму единиц товара, разбитых на группы, и лимитировать результирующий набор числом, которое необходимо вычислить.
--И вычислить его найдя наименьший product_id и прибавить к нему 4
--Это нужно делать в секции LIMIT
SELECT category_name, SUM(units_in_stock)
FROM products
JOIN categories USING(category_id)
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT (SELECT MIN(product_id) + 4 FROM products);

--Что если мы хотим вывести такие товары, количество которых в наличии больше чем в среднем?
--Это просто выводит среднее количество товаров в products
SELECT AVG(units_in_stock) FROM products; --выводит 40,5

--Это уже финальный запрос с подзапросом
SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock > (SELECT AVG(units_in_stock) FROM products)
ORDER BY units_in_stock;
