--Postgres поддерживает последовательности, с ними можно работать явным образом

--Создание последовательности
CREATE SEQUENCE seq1;

--Для того, чтобы сгенерировать следующее значение в последовательности, нужно вызвать функцию nextval() и передать ей в качестве аргумента имя последовательности
SELECT nextval('seq1');

--Также есть функция currval(), которой мы передаем имя последовательности и она возвращает текущее значение
SELECT currval('seq1');

--Также есть функция lastval(), она не принимает аргумента. Она возвращает последнее значение сгенерированное какой либо из последовательностей в  текущей сессии
SELECT lastval();


--Мы можем проманипулировать SEQUENCE используя setval()
--Первым аргументом мы передаем имя последовательности,
--вторым какое значение установить в последовательности
--третьим нужно передать аргумент типа boolean (по умолчанию true)
SELECT setval('seq1', 16, true);
SELECT currval('seq1');
SELECT nextval('seq1');

SELECT setval('seq1', 16, false); --Когда мы устанавливаем false currval() не модифицируется, там хранится старое значение
SELECT currval('seq1');
SELECT nextval('seq1'); --nextval(), когда мы вызываем setval() с false, генерирует первым числом то число которое мы указали в setval() 


--Мы можем создавать счетчики с разным инкриментом (по умолчанию инкримент равен 1)
CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 16;
SELECT nextval('seq2');

--Кроме инкремента мы можем задать и другие условия
CREATE SEQUENCE IF NOT EXISTS seq3
INCREMENT 16
MINVALUE 0
MAXVALUE 128
START WITCH 0; --По умолчанию начинается с 1, но мы здесь поставили с 0

SELECT nextval('seq3');

--Переименовываем имеющийся SEQUENCE
ALTER SEQUENCE seq3 RENAME TO seq4;

--Рестартим имеющийся SEQUENCE
ALTER SEQUENCE seq4 RESTART WITH 16;

--Удаляем имеющийся SEQUENCE
DROP SEQUENCE seq4;