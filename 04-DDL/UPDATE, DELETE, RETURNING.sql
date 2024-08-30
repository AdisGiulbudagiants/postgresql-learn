--Предположим, что я хочу переименовать chair_name в таблице chair
UPDATE chair
SET chair_name = 'Economy', dean = 'Adis'
WHERE chair_id = 1;
--Через WHERE мы находим именно ту строку, которую мы хотим обновить

SELECT * FROM chair;

--Для того, чтобы удалить конкретную строку в таблице нужно использовать DELETE FROM
DELETE FROM chair
WHERE chair_id < 3;

--Если мы хотим удалить все строки мы можем воспользоваться этой командой:
DELETE FROM chair;
--Разница между DELETE FROM и TRUNCATE TABLE в том, что TRUNCATE не пишет логов и работает быстрее


--RETURNING позволяет вернуть данные по модифицированной строке
DROP TABLE book;

CREATE TABLE book (
    book_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int NOT NULL,

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

--Если мы хотим происзвести ввод данных и вернуть в вывод book_id который был сгенерирован мы можем это сделать вот так:
INSERT INTO book (title, isbn, publisher_id)
VALUES
('title','isbn',3)
RETURNING book_id;


INSERT INTO book (title, isbn, publisher_id)
VALUES
('title','isbn',3)
RETURNING *; --Выводим все данные, которые ввели в таблицу

SELECT * FROM book;

--RETURNING можно использовать и при UPDATE и при DELETE
UPDATE book
SET title = 'War And Peace'
WHERE book_id = 1
RETURNING book_id, title;

DELETE FROM book
WHERE isbn = 'isbn0'
RETURNING book_id;