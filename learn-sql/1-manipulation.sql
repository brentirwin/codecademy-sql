-- 4. Create

CREATE TABLE celebs (
  id INTEGER,
  name TEXT,
  age INTEGER
);

-- 5. Insert

INSERT INTO celebs (id, name, age)
VALUES (1, 'Justin Bieber', 22);

INSERT INTO celebs (id, name, age)
VALUES (2, 'Beyonce Knowles', 33);

INSERT INTO celebs (id, name, age)
VALUES (3, 'Jeremy Lin', 26);

INSERT INTO celebs (id, name, age)
VALUES (3, 'Taylor Swift', 26);

-- 6. Select

SELECT name from celebs;

SELECT * from celebs;

-- 7. Alter

ALTER TABLE celebs
ADD COLUMN twitter_handle TEXT;

SELECT * FROM celebs;

-- 8. Update

UPDATE celebs
SET twitter_handle = '@taylorswift13'
WHERE id = 4;

SELECT * FROM CELEBS;

-- 9. Delete

DELETE FROM celebs
WHERE twitter_handle IS NULL;

SELECT * FROM celebs;

-- 10. Constraints

CREATE TABLE awards (
  id INTEGER PRIMARY KEY,
  recipient TEXT NOT NULL,
  award_name TEXT DEFAULT 'Grammy'
);
