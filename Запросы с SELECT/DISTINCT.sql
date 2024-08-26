--DISTINCT позволяет выводить уникальные строки

SELECT city
FROM employees;
--При таком запросы города повторяются в списке

SELECT DISTINCT city
FROM employees;
--При таком запросе все города повторяются единажды


--Если после SELECT прописан DISTINCT, то мы можем использовать не только одну колонку
SELECT DISTINCT city, country
FROM employees