 SELECT company_name, contact_name, phone, country
 FROM customers
 WHERE country='USA';

 SELECT *
 FROM products
 WHERE unit_price >=50;

 SELECT COUNT(*)
 FROM products
 WHERE unit_price >= 50;

 SELECT *
 FROM products
 WHERE discontinued = 1;

 SELECT *
 FROM customers
 WHERE city !='Berlin';

 SElECT * 
 FROM orders
 WHERE order_date > '1998-03-01'; --С датами нужно быть осторожным, потому что есть много вариантов написания даты и плюс сама дата должна быть прописана в одинарных кавычках

 -- Все операторы неравенства, больше, меньше и тд пишутся как обычно кроме равенства, оно пишется вот так "="