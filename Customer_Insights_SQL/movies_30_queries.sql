SELECT * FROM New_Movies

-- 1. Total number of movies
SELECT COUNT(*) AS total_movies FROM df;

-- 2. Earliest and latest movie release year
SELECT MIN("Year") AS earliest_year, MAX("Year") AS latest_year FROM df;

-- 3. Number of movies with a recorded budget
SELECT COUNT(*) AS movies_with_budget FROM df WHERE "budget" IS NOT NULL;

-- 4. Highest worldwide gross revenue
SELECT MAX("grossWorldWide") AS highest_gross FROM df;

-- 5. Average rating of all movies
SELECT AVG("Rating") AS avg_rating FROM df;

-- 6. Count of movies with an IMDb rating of 8.0 or higher
SELECT COUNT(*) AS highly_rated_movies FROM df WHERE "Rating" >= 8.0;

-- 7. Most common MPA rating
SELECT "MPA", COUNT(*) AS count FROM df GROUP BY "MPA" ORDER BY count DESC LIMIT 1;

-- 8. Most frequently occurring genre
SELECT "genres", COUNT(*) AS count FROM df GROUP BY "genres" ORDER BY count DESC LIMIT 1;

-- 9. Number of movies released per decade
SELECT ("Year" / 10) * 10 AS decade, COUNT(*) AS movie_count FROM df GROUP BY decade ORDER BY decade;

-- 10. Total gross revenue for each country
SELECT "countries_origin", SUM("grossWorldWide") AS total_gross FROM df GROUP BY "countries_origin" ORDER BY total_gross DESC;

-- 11. Director of the highest-grossing movie
SELECT "directors", "Title", "grossWorldWide" FROM df ORDER BY "grossWorldWide" DESC LIMIT 1;

-- 12. Average budget for Oscar-winning movies
SELECT AVG("budget") AS avg_budget_oscars FROM df WHERE "oscars" > 0;

-- 13. Number of movies that won at least one Oscar
SELECT COUNT(*) AS movies_with_oscars FROM df WHERE "oscars" > 0;

-- 14. Top-grossing production company
SELECT "production_companies", SUM("grossWorldWide") AS total_gross FROM df GROUP BY "production_companies" ORDER BY total_gross DESC LIMIT 1;

-- 15. Year with the most movies released
SELECT "Year", COUNT(*) AS movie_count FROM df GROUP BY "Year" ORDER BY movie_count DESC LIMIT 1;

-- 16. Correlation between budget and worldwide gross revenue
SELECT CORR("budget", "grossWorldWide") AS budget_gross_correlation FROM df;

-- 17. Number of movies with opening weekend gross over $100M
SELECT COUNT(*) AS high_opening_weekend FROM df WHERE "opening_weekend_Gross" > 100000000;

-- 18. Highest-grossing movie for each decade
SELECT DISTINCT ON (("Year" / 10) * 10) ("Year" / 10) * 10 AS decade, "Title", "grossWorldWide"
FROM df ORDER BY decade, "grossWorldWide" DESC;

-- 19. Top-rated movie for each country
SELECT DISTINCT ON ("countries_origin") "countries_origin", "Title", "Rating" FROM df ORDER BY "countries_origin", "Rating" DESC;

-- 20. Top 10 movies with highest revenue-to-budget ratio
SELECT "Title", "grossWorldWide", "budget", ("grossWorldWide" / NULLIF("budget", 0)) AS revenue_ratio FROM df ORDER BY revenue_ratio DESC LIMIT 10;

-- 21. Top 15 movies by worldwide gross
SELECT "Title", "grossWorldWide" FROM df ORDER BY "grossWorldWide" DESC LIMIT 15;

-- 22. Top 15 directors by worldwide gross
SELECT "directors", SUM("grossWorldWide") AS total_gross FROM df GROUP BY "directors" ORDER BY total_gross DESC LIMIT 15;

-- 23. Movies count by country
SELECT "countries_origin", COUNT(*) AS movie_count FROM df GROUP BY "countries_origin" ORDER BY movie_count DESC;

-- 24. Rating distribution (grouped)
SELECT ROUND("Rating") AS rating_group, COUNT(*) AS count FROM df GROUP BY rating_group ORDER BY rating_group;

-- 25. Budget vs Gross Earnings scatter plot data
SELECT "budget", "grossWorldWide" FROM df WHERE "budget" IS NOT NULL AND "grossWorldWide" IS NOT NULL;

-- 26. Oscars vs Gross Earnings scatter plot data
SELECT "oscars", "grossWorldWide" FROM df WHERE "oscars" > 0 AND "grossWorldWide" IS NOT NULL;

-- 27. Top 15 movies by rating
SELECT "Title", "Rating" FROM df ORDER BY "Rating" DESC LIMIT 15;

-- 28. Top 15 production companies by worldwide gross
SELECT "production_companies", SUM("grossWorldWide") AS total_gross FROM df GROUP BY "production_companies" ORDER BY total_gross DESC LIMIT 15;

-- 29. Top 15 movies by Oscars won
SELECT "Title", "oscars" FROM df ORDER BY "oscars" DESC LIMIT 15;

-- 30. Top 15 genres by average rating
SELECT "genres", AVG("Rating") AS avg_rating FROM df GROUP BY "genres" ORDER BY avg_rating DESC LIMIT 15;
