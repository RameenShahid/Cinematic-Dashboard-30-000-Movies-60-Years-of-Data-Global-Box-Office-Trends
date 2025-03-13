CREATE TABLE New_Movies (
    id VARCHAR(50) PRIMARY KEY,
    title TEXT NOT NULL,
    movie_link TEXT,
    year INT NOT NULL,
    duration VARCHAR(20),
    mpa VARCHAR(10),
    rating FLOAT,
    votes TEXT,
    budget FLOAT,
    gross_worldwide FLOAT,
    gross_us_canada FLOAT,
    opening_weekend_gross FLOAT,
    directors TEXT,
    writers TEXT,
    stars TEXT,
    genres TEXT,
    countries_origin TEXT,
    filming_locations TEXT,
    production_companies TEXT,
    languages TEXT,
    wins INT DEFAULT 0,
    nominations INT DEFAULT 0,
    oscars INT DEFAULT 0
);

COPY New_Movies FROM 'C:\SQL2022\SQL DATA\final_dataset.csv' 
DELIMITER ','  
CSV HEADER;
