-- -----------------------------------------------------
-- SUBQUERIES – COMPLETE SQL FILE
-- -----------------------------------------------------

-- Drop existing tables if already present
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS rating;

-- -----------------------------------------------------
-- CREATE SAMPLE TABLES
-- -----------------------------------------------------

CREATE TABLE movie (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    country VARCHAR(50),
    rating INT
);

CREATE TABLE rating (
    id INT PRIMARY KEY,
    movie_id INT,
    user_rating INT,
    FOREIGN KEY(movie_id) REFERENCES movie(id)
);

-- -----------------------------------------------------
-- INSERT SAMPLE DATA
-- -----------------------------------------------------

INSERT INTO movie VALUES
(1, 'RRR', 'India', 9),
(2, 'KGF', 'India', 8),
(3, 'Inception', 'USA', 9),
(4, 'Interstellar', 'USA', 10),
(5, 'Dangal', 'India', 9);

INSERT INTO rating VALUES
(1, 1, 10),
(2, 1, 9),
(3, 2, 8),
(4, 3, 9),
(5, 5, 7);

-- -----------------------------------------------------
-- 1️⃣ SUBQUERY IN WHERE CLAUSE
-- -----------------------------------------------------
-- Get all movies that have rating equal to highest rating in table

SELECT *
FROM movie
WHERE rating = (SELECT MAX(rating) FROM movie);


-- Another example: Movies from India using IN()

SELECT *
FROM movie
WHERE id IN (SELECT id FROM movie WHERE country = 'India');


-- -----------------------------------------------------
-- 2️⃣ SUBQUERY IN FROM CLAUSE
-- (Derived table)
-- -----------------------------------------------------

SELECT MAX(rating) AS highest_rating_india
FROM (SELECT * FROM movie WHERE country = 'India') AS temp;


-- -----------------------------------------------------
-- 3️⃣ SUBQUERY IN SELECT CLAUSE
-- -----------------------------------------------------

SELECT 
    title,
    rating,
    (SELECT AVG(rating) FROM movie) AS avg_rating_all_movies
FROM movie;


-- -----------------------------------------------------
-- 4️⃣ DERIVED SUBQUERY (subquery becomes a new table)
-- -----------------------------------------------------

SELECT *
FROM (
    SELECT title, rating FROM movie WHERE country = 'USA'
) AS usa_movies;


-- -----------------------------------------------------
-- 5️⃣ CORRELATED SUBQUERY
-- -----------------------------------------------------
-- Each row of outer query triggers inner query

-- Find movies whose rating is above the average rating of that movie's country

SELECT m1.title, m1.country, m1.rating
FROM movie m1
WHERE m1.rating >
      (SELECT AVG(m2.rating)
       FROM movie m2
       WHERE m2.country = m1.country);


-- Another correlated example: movies having user rating > average user rating

SELECT m.title, r.user_rating
FROM movie m
JOIN rating r ON m.id = r.movie_id
WHERE r.user_rating >
    (SELECT AVG(r2.user_rating)
     FROM rating r2
     WHERE r2.movie_id = m.id);


-- -----------------------------------------------------
-- END OF FILE
-- -----------------------------------------------------
