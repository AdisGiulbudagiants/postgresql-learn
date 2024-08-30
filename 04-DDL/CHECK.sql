--Логические ограничения

DROP TABLE IF EXISTS book;

CREATE TABLE book (
    book_id int,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int,

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);


--Добавляем колонку с логической проверкой по условию
ALTER TABLE book
ADD COLUMN price decimal CONSTRAINT CHK_book_price CHECK (price >= 0); --С помощью CHECK мы проверяем, что цена всегда должна быть больше либо равна 0

INSERT INTO book
VALUES
(1,'title','isbn', 1, -1.5); --Такой ввод данных выдаст ошибку, потому мы столбец price не прошел проверку, цена не может быть отрицательной

INSERT INTO book
VALUES
(1,'title','isbn', 1, 1.5); --Такой ввод уже валиден

SELECT * FROM book;