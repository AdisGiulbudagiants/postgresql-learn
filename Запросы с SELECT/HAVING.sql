--WHERE и HAVING это одно и тоже, только WHERE это первичный фильтр, а HAVING вторчный

SELECT category_id, SUM(unit_price * units_in_stock)
FROM products
WHERE discontinued != 1
GROUP BY category_id
HAVING SUM(unit_price * units_in_stock) > 5000 --распологается после GROUP BY, но до ORDER BY
ORDER BY SUM(unit_price * units_in_stock) DESC;
