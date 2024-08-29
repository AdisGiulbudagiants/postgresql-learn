SELECT DISTINCT country
FROM customers;

--Чтобы отсортировать результаты вызовы по какому-то порядку нужно использовать ключевое слово ORDER BY

SELECT DISTINCT country
FROM customers
ORDER BY country;

--Данные отсортировались в порядке возрастанния от "A" До "Z" НЕЯВНЫМ способом

SELECT DISTINCT country
FROM customers
ORDER BY country ASC;

--Данные отсортировались в порядке возрастанния от "A" До "Z" ЯВНЫМ способом

SELECT DISTINCT country
FROM customers
ORDER BY country DESC;

--Данные отсортировались в порядке убывания от "Z" До "A" ЯВНЫМ способом

SELECT DISTINCT country,city
FROM customers
ORDER BY country DESC, city DESC;

--Данные отсортировались в порядке убывания по странам и городам в них

SELECT DISTINCT country,city
FROM customers
ORDER BY country DESC, city ASC;

--Данные отсортировались в порядке убывания по странам и возростания по городам

