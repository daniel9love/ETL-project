-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS country
(
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
    PRIMARY KEY(country_key)
);

CREATE TABLE IF NOT EXISTS covid19
(
    covid19_key INTEGER NOT NULL,
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
	date DATE,
    lat REAL,
    long REAL,
    confirmed_cases INTEGER,
    PRIMARY KEY(covid19_key)
);


CREATE TABLE IF NOT EXISTS weather
(
    weather_key INTEGER NOT NULL,
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
    date DATE,
    precipitation REAL,
    avg_temp REAL,
    max_temp REAL,
    min_temp REAL,
    PRIMARY KEY(weather_key)
);


-- Create FKs
ALTER TABLE covid19
    ADD    FOREIGN KEY (country_key)
    REFERENCES country(country_key)
    MATCH SIMPLE
;
    
ALTER TABLE weather
    ADD    FOREIGN KEY (country_key)
    REFERENCES country(country_key)
    MATCH SIMPLE
;
    
-- Drop tables
DROP TABLE country;
DROP TABLE covid19;
DROP TABLE weather;


-- Display tables
SELECT * FROM country;
SELECT * FROM covid19;
SELECT * FROM weather;

--COMBINE TABLES VIA DATABASE WITH ALL USEFUL INFO
SELECT c.covid19_key, w.weather_key, c.country, c.date, w.country, w.date, w.precipitation, 
w.avg_temp, w.max_temp, w.min_temp, c.confirmed_cases, c.lat, c.long
FROM weather w
INNER JOIN covid19 c ON
c.country = w.country
AND c.date = w.date;






