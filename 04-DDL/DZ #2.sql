--1
CREATE TABLE exam (
    exam_id serial UNIQUE NOT NULL,
    exam_name varchar(256),
    exam_date date,

    CONSTRAINT PK_exam_exam_id PRIMARY KEY(exam_id)
);

--2
ALTER TABLE exam
DROP CONSTRAINT PK_exam_exam_id;

--3
ALTER TABLE exam
ADD PRIMARY KEY(exam_id);

--4
CREATE TABLE IF NOT EXISTS person (
    person_id int,
    first_name varchar,
    last_name varchar,

    CONSTRAINT pk_person_person_id PRIMARY KEY(person_id)
);

--5
CREATE TABLE IF NOT EXISTS passport (
    passport_id int,
    serial_number int NOT NULL,
    registration text NOT NULL,
    person_id int NOT NULL,

    CONSTRAINT PK_passport_passport_id PRIMARY KEY(passport_id),
    CONSTRAINT FK_passport_registration FOREIGN KEY(person_id) REFERENCES person(person_id)
);

--6
ALTER TABLE book
ADD COLUMN freight int
CONSTRAINT CHK_book_freight CHECK (freight > 0 AND freight < 100);

--7
INSERT INTO book (title, isbn, publisher_id, freight)
VALUES
('War And Peace','isbn', 1, 68);

--8
CREATE TABLE IF NOT EXISTS student (
    student_id int GENERATED ALWAYS AS IDENTITY NOT NULL,
    full_name varchar,
    course int DEFAULT 1
);

--9
INSERT INTO student (full_name)
VALUES
('Adis'),
('Anet'),
('Ararat');

SELECT * FROM student;

--10
ALTER TABLE student
ALTER COLUMN course DROP DEFAULT;

--11
ALTER TABLE products
ADD CONSTRAINT CHK_products_unit_price CHECK (unit_price > 0);


--12
SELECT MAX(product_id) FROM products;

CREATE SEQUENCE IF NOT EXISTS products_product_id_seq
START WITH 78 OWNED BY products.product_id;

ALTER TABLE products
ALTER COLUMN product_id SET DEFAULT nextval('products_product_id_seq');


SELECT * FROM products;
--13
INSERT INTO products(product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES 
('prod', 1, 1, 10, 20, 20, 10, 1, 0)
RETURNING product_id;
