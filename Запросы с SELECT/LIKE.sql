--LIKE используется для того, чтобы искать строки похожие на заданный шаблон

-- % означает 0,1 и более символов
-- _ ровно 1 любой символ


--Применяется примерно так:
--LIKE 'U%' - строки начинающиеся с U
--LIKE '%a' - строки кончающиеся на 'a' 
--LIKE '%John%' - строки содержащие John
--LIKE 'J%n' - строки, начинающиеся на J, и кончающиеся на n

--LIKE '_oh_' - строки, где 2 и 3 символы oh, а 1 и 4 любый сиволы
--LIKE '_oh%' - строки, где 2 и 3 символы oh, 1 любой один символ, а в конце 0,1 и более символов


SELECT last_name, first_name
FROM employees
WHERE first_name LIKE '%n'; --заканчивается на 'n'

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'B%'; --начинается на 'B'

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'Buch%'; --начинается на 'Buch'

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE '_uch%';