-- 2. Select

SELECT name, genre, year
FROM movies;

-- 3. As

SELECT name AS 'Title'
FROM movies;

SELECT imdb_rating AS 'IMDb'
FROM movies;

-- 4. Distinct

SELECT DISTINCT genre
FROM movies;

SELECT DISTINCT year
FROM movies;

-- 5. Where

SELECT *
FROM movies
WHERE imdb_rating < 5;

SELECT *
FROM movies
WHERE year > 2014;

-- 6-7. Like

SELECT *
FROM movies
WHERE name LIKE 'Se_en';

SELECT *
FROM movies
WHERE name LIKE '%man%';

SELECT *
FROM movies
WHERE name LIKE 'The %';

-- 8. Is Null

SELECT name
FROM movies
WHERE imdb_rating IS NULL;

-- 9. Between

SELECT *
FROM movies
WHERE name BETWEEN 'D' AND 'G';

SELECT *
FROM movies
WHERE year BETWEEN 1970 AND 1979;

-- 10. And

SELECT *
FROM movies
WHERE year BETWEEN 1970 and 1979
  AND imdb_rating > 8;

SELECT *
FROM movies
WHERE year < 1985
  AND genre = 'horror';

-- 11. Or

SELECT *
FROM movies
WHERE year > 2014
  OR genre = 'action';

SELECT *
FROM movies
WHERE genre = 'romance'
  OR genre = 'comedy';

-- 12. Order By

SELECT name, year
FROM movies
ORDER BY name;

SELECT name, year, imdb_rating
FROM movies
ORDER BY imdb_rating DESC;

-- 13. Limit

SELECT *
FROM movies
ORDER BY imdb_rating DESC
LIMIT 3;

-- 14. Case

SELECT name,
  CASE
    WHEN genre = 'romance' THEN 'Chill'
    WHEN genre = 'comedy' THEN 'Chill'
    ELSE 'Intense'
  END AS 'Mood'
FROM movies;
