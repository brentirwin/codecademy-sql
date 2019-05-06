-- 2-4. Dates

SELECT DATETIME(delivery_time)
FROM baked_goods;

SELECT
  DATE(delivery_time),
  COUNT(*) AS count_baked_goods
FROM baked_goods
GROUP BY 1;

SELECT
  DATETIME(delivery_time, '+5 hours', '20 minutes', '2 days')
    AS package_time
FROM baked_goods;

-- 5-6. Numbers

SELECT
  DATETIME(delivery_time, '-5 hours', '20 minutes', '2 days')
    AS package_time
FROM baked_goods;

SELECT
  id,
  MAX(cook_time, cool_down_time),
  MIN(cook_time, cool_down_time)
FROM baked_goods;

-- 7-8. Strings

SELECT first_name || ' ' || last_name AS full_name
FROM bakeries;

SELECT
  REPLACE(ingredients,'enriched_','')
    AS item_ingredients
FROM baked_goods;
