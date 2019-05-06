-- 2. Union

SELECT brand FROM legacy_products
UNION
SELECT brand FROM new_products;

-- 3. Union All

SELECT id, AVG(a.sale_price)
FROM (
  SELECT id, sale_price FROM order_items
  UNION ALL
  SELECT id, sale_price FROM order_items_historic
) as a
GROUP BY a.id;

-- 4. Intersect

SELECT category FROM new_products
INTERSECT
SELECT category FROM legacy_products;

-- 5. Except

SELECT category FROM legacy_products
EXCEPT
SELECT category FROM new_products;
