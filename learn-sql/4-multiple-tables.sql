-- 1. Introduction

SELECT *
FROM orders
LIMIT 5;

SELECT *
FROM subscriptions
LIMIT 5;

SELECT *
FROM customers
LIMIT 5;

-- 3. Combining tables manually

SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id;

SELECT *
FROM orders
JOIN subscriptions
  ON orders.subscription_id = subscriptions.subscription_id
WHERE description = 'Fashion Magazine';

-- 4. Inner Joins

SELECT COUNT(*)
FROM newspaper;

SELECT COUNT(*)
FROM online;

SELECT COUNT(*)
FROM online
JOIN newspaper
  ON newspaper.id = online.id;
 
-- 5. Left Join

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id;

SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id
WHERE online.id IS NULL;

-- 6. Primary Key vs Foreign Key

SELECT *
FROM classes
JOIN students
  ON classes.id = students.class_id;
  
-- 7. Cross Join

SELECT COUNT(*)
FROM newspaper
WHERE start_month <= 3
  AND end_month >= 3;

SELECT *
FROM newspaper
CROSS JOIN months;

SELECT *
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
  AND end_month >= month;

SELECT
  month,
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
  AND end_month >= month
GROUP BY month;

SELECT
  month,
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month
  AND end_month >= month
GROUP BY month
ORDER BY COUNT(*) DESC;

-- 8. Union

SELECT *
FROM newspaper
UNION
SELECT *
FROM online;

-- 9. With

WITH previous_query AS (
  SELECT
    customer_id,
    COUNT(subscription_id) AS 'subscriptions'
  FROM orders
  GROUP BY customer_id
)
SELECT
  customers.customer_name,
  previous_query.subscriptions
FROM previous_query
JOIN customers
  ON previous_query.customer_id = customers.customer_id;
