SELECT * 
FROM customers
WHERE country = 'Mexico' OR country = 'Germany' OR country = 'USA' OR country = 'Canada';

-- Код выше плохо читается и этот запрос можно улучшить с помошью IN

SELECT *
FROM customers
WHERE country IN('Mexico','Germany','USA','Canada');

SELECT *
FROM products
WHERE category_id IN(1,3,5,7);

--Этот код читается гораздо проще

SELECT *
FROM customers
WHERE country NOT IN('Mexico','Germany','USA','Canada');

SELECT *
FROM products
WHERE category_id NOT IN(1,3,5,7);

--Если нужно запросить исключая какой-то список, то нужно использовать оператор NOT IN 