--SELF JOIN чаще всего нужен для того, чтобы построить некую иерархию.

--Создаем табличку employee
CREATE TABLE employee (
	employee_id int PRIMARY KEY,
	first_name varchar (255) NOT NULL,
	last_name varchar (255) NOT NULL,
	manager_id int,
	FOREIGN KEY (manager_id) REFERENCES employee (employee_id) 
);
--manager_id это внешний ключ, который ссылается на первичный ключ в этой же таблице.
-- В чем смысл?
--Смысл в том, что у работника может быть менеджер и этот самый менеджер тоже является обычным работником, то есть записью таблицы employee

INSERT INTO employee (
	employee_id,
	first_name,
	last_name,
	manager_id
)
VALUES
(1, 'Windy','Hays', NULL), --У этого работника нет менеджера, поэтому NULL
(2, 'Ava','Christensen', 1),
(3, 'Hassan','Conner', 1),
(4, 'Anna','Reeves', 2),
(5, 'Sau','Norman', 2),
(6, 'Kelsie','Hays', 3),
(7, 'Tory','Goff', 3),
(8, 'Salley','Lester', 3);

--Что если, мы хотим вывести имена и фамилии работников и во второй колонке менеджера этого работника?
SELECT e.first_name || ' ' || e.last_name AS employee,
	   m.first_name || ' ' || m.last_name AS manager
--Мы здесь выводим first_name и last_name с одной и той же таблицы, поэтому мы использовали псевдонимы
FROM employee e
LEFT JOIN employee m ON m.employee_id = e.manager_id
ORDER BY manager;
--Мы объединили таблицу с самой собой используя внешний ключ, это и есть пример SELF JOIN