SELECT ship_city, ship_region, ship_country
FROM orders 
WHERE ship_region IS NULL; --выводит значения где ship_region РАВЕН NULL

SELECT ship_city, ship_region, ship_country
FROM orders 
WHERE ship_region IS NOT NULL; --выводит значения где ship_region НЕ РАВЕН NULL