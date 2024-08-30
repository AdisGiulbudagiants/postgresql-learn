--DEFAULT нужен для автоматической вставки заданного значения в колонку,если это значение не заданно вручную

CREATE TABLE customer (
    customer_id serial, 
    full_name text,
    status char DEFAULT 'r', --Если мы ничего не вставим, то по умолчанию будет вставлено значение "r"

    CONSTRAINT PK_customer_customer_id PRIMARY KEY(customer_id),
    CONSTRAINT CHK_customer_status CHECK (status = 'r' OR status = 'p')
);

INSERT INTO customer (full_name)
VALUES
('name');

SELECT * FROM customer;

--Удаление ограничения DEFAULT
ALTER TABLE customer
ALTER COLUMN status DROP DEFAULT;

--Добавление ограничения DEFAULT
ALTER TABLE customer
ALTER COLUMN status SET DEFAULT 'r'
