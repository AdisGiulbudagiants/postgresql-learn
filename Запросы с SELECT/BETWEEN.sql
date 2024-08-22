SELECT * 
FROM orders
WHERE freight >= 20 AND freight <= 40;

SELECT * 
FROM orders
WHERE freight BETWEEN 20 AND 40;

--Эти записи по сути идентичны, но имеют разный синтаксис. Также BETWEEN включает в себя и 20 и 40, точно также как и <= и >=

SELECT *
FROM orders 
WHERE order_date BETWEEN '1998-03-30' AND '1998-04-03';