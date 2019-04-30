-- 2. Count

SELECT COUNT(*)
FROM fake_apps
WHERE price = 0;

-- 3. Sum

SELECT SUM(downloads)
FROM fake_apps;

-- 4. Max/Min

SELECT MIN(downloads)
FROM fake_apps;

SELECT MAX(price)
FROM fake_apps;

-- 5. Average

SELECT AVG(downloads)
FROM fake_apps;

SELECT AVG(price)
FROM fake_apps;

-- 6. Round

SELECT name, ROUND(price, 0)
FROM fake_apps;

SELECT ROUND(AVG(price), 2)
FROM fake_apps;

-- 7-8. Group By

SELECT price, COUNT(*)
FROM fake_apps
GROUP BY price;

SELECT price, COUNT(*)
FROM fake_apps
WHERE downloads > 20000
GROUP BY price;

SELECT category, SUM(downloads)
FROM fake_apps
GROUP BY category;

SELECT
  category,
  price,
  AVG(downloads)
FROM fake_apps
GROUP BY 1, 2;

-- 9. Having

SELECT
  price,
  ROUND(AVG(downloads)),
  COUNT(*)
FROM fake_apps
GROUP BY price
HAVING COUNT(*) > 10;
