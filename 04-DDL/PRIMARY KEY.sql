CREATE TABLE chair (
    chair_id serial PRIMARY KEY, --PRIMARY KEY это первичный ключ
    chair_name varchar,
    dean varchar
);

INSERT INTO chair
VALUES
(1,'Economy','Adis');

SELECT * FROM chair;

--Как работает PRIMARY KEY?
--Он гарантирует, что мы не можем вставить дупликат, а также мы не можем вставить NULL на место chair_id

INSERT INTO chair
VALUES
(NULL,'Economy','Adis');--Такой код даст ошибку, потому что chair_id NULL

DROP TABLE chair;

CREATE TABLE chair (
    chair_id serial UNIQUE NOT NULL, --UNIQUE NOT NULL это ПОЧТИ эквивалент PRIMARY KEY
    chair_name varchar,
    dean varchar
);

--Разница между PRIMARY KEY и UNIQUE в том, что UNIQUE не накладывает ограничение NOT NULL по дефолту, а PRIMARY KEY накладывает
--Также ключевой разницей является то, что PRIMARY KEY может быть только один в таблице, а UNIQUE NOT NULL сколько угодно


--С помощью этого кода ниже мы можем вывести имена которые даны ограничениям
SELECT constraint_name
FROM information_schema.key_column_usage
WHERE table_name = 'chair'
    AND table_schema = 'public'
    AND column_name = 'chair_id'; --Вывод будет chair_chair_id_key - это constraint_name 

--Если мы хотим удалить такое ограничение из таблицы, то нужно использовать следующий синтаксис:
ALTER TABLE chair
DROP CONSTRAINT chair_chair_id_key;

--Также их можно добавлять ограничения на столбец в таблице
ALTER TABLE chair
ADD PRIMARY KEY(chair_id);