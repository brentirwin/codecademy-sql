-- 1. Table Transformation

SELECT *
FROM flights
LIMIT 10;

-- 2-4. Non-Correlated Subqueries

SELECT *
FROM flights
WHERE origin in (
  SELECT code
  FROM airports
  WHERE elevation < 2000
);

SELECT *
FROM flights
WHERE origin IN (
  SELECT code
  FROM airports
  WHERE faa_region = 'ASO'
);

SELECT
  a.dep_month,
  a.dep_day_of_week,
  AVG(a.flight_distance) AS average_distance
FROM (
  SELECT
    dep_month,
    dep_day_of_week,
    dep_date,
    SUM(distance) AS flight_distance
  FROM flights
  GROUP by 1, 2, 3
) a
GROUP BY 1, 2
ORDER BY 1, 2;

-- 5-6. Correlated Subqueries

SELECT id
FROM flights AS f
WHERE distance < (
  SELECT AVG(distance)
  FROM flights
  WHERE carrier = f.carrier
);

SELECT
  origin,
  id,
  ( SELECT COUNT(*)
    FROM flights f
    WHERE f.id < flights.id
    AND f.origin = flights.origin) + 1
    AS flight_sequence_number
FROM flights;
