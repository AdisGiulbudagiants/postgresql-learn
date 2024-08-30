CREATE TABLE publisher (
    publisher_id int,
    publisher_name varchar(128) NOT NULL,
    address text,

    CONSTRAINT PK_publisher_publisher_id PRIMARY KEY(publisher_id)
);

CREATE TABLE book (
    book_id int,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int,

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id)
);

--Если мы не добавляем внешний ключ FOREIGN KEY, то мы можем вставлять всякий бред

INSERT INTO publisher
VALUES
(1,'Everyman''s Library','NY'),
(2,'Oxford University Press','NY'),
(3,'Grand Central Publishing','Washington'),
(4,'Simon & Schuster','Chicago');

INSERT INTO book
VALUES
(1,'War And Peace','12345676851', 10); --Здесь мы ссылаемся на создателя в publisher, которого не существует

--Чтобы такого не было нужно добавить ограничение внешнего ключа
ALTER TABLE book
ADD CONSTRAINT FK_books_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id);


--Если мы хотим сразу задать ограничение FOREIGN KEY при создании таблицы, то нужно делать так:
CREATE TABLE book (
    book_id int,
    title text NOT NULL,
    isbn varchar(32) NOT NULL,
    publisher_id int,

    CONSTRAINT PK_book_book_id PRIMARY KEY(book_id),
    CONSTRAINT FK_book_publisher FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id)
);

--Если хотим удалить CONSTRAINT из таблицы, то вот команда:
ALTER TABLE book
DROP CONSTRAINT FK_book_publisher; --Здесь мы задали сами имя CONSTRAINT, поэтому можно просто написать имя