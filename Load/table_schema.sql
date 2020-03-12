-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS covid_19
(
    primary_key INTEGER NOT NULL,
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
	date VARCHAR(10),
    confirmed_cases INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS weather_data
(
    primary_key INTEGER NOT NULL,
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
    date VARCHAR(10),
    average_temp REAL,
    min_temp REAL,
    max_temp REAL,
    precipitation_sum REAL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS country
(
    country_key INTEGER NOT NULL,
    country VARCHAR(100),
    PRIMARY KEY(country_key)
);

-- Create FKs
ALTER TABLE covid_19
    ADD    FOREIGN KEY (country_key)
    REFERENCES country(country_key)
    MATCH SIMPLE
;
    
ALTER TABLE weather_data
    ADD    FOREIGN KEY (country_key)
    REFERENCES country(country_key)
    MATCH SIMPLE
;
    
--Table Views
SELECT * FROM country;
SELECT * FROM covid_19;
SELECT * FROM weather_data;