SELECT * FROM new_movies;
UPDATE new_movies 
SET budget = 0 WHERE budget IS NULL;

UPDATE new_movies 
SET votes = 0 WHERE votes IS NULL;
