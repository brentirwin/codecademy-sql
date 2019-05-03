-- 1. Aggregate Functions Revisited

SELECT COUNT(*) FROM flights;

-- 2. NULL

SELECT COUNT(*)
FROM flights
WHERE arr_time IS NOT NULL
  AND destination = 'ATL';

-- 3. CASE WHEN

SELECT
  CASE
    WHEN elevation < 250 THEN 'Low'
    WHEN elevation BETWEEN 250 and 1749 THEN 'Medium'
    WHEN elevation >= 1750 THEN 'High'
  END AS elevation_tier,
  COUNT (*)
FROM airports
GROUP BY 1;

-- 4. COUNT(CASE WHEN)

SELECT
  state,
  COUNT(
    CASE
      WHEN elevation < 1000 THEN 1
      ELSE NULL
    END
  ) as count_low_elevation_airports
FROM airports
GROUP BY state;

-- 5. SUM(CASE WHEN)

SELECT
  origin,
  SUM(distance) AS total_flight_distance,
  SUM(
    CASE
      WHEN carrier = 'DL' THEN distance
      ELSE 0
    END
  ) as total_delta_flight_distance
FROM flights
GROUP BY origin;

-- 6-7. Combining Aggregates

SELECT origin,
  (100.0 * (SUM(
    CASE WHEN carrier = 'DL' THEN distance ELSE 0 END)
  ) / SUM(distance)) as percentage_flight_distance_from_delta
FROM flights
GROUP BY origin;

SELECT state,
  (100.0 * (SUM(
    CASE WHEN elevation >= 2000 THEN 1 ELSE 0 END)
  ) / COUNT(*)) as percentage_high_elevation_airports
FROM airports
GROUP BY state;
