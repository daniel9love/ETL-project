-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS covid_19
(
    Country VARCHAR(100) NOT NULL,
    confirmed_cases_january2020 INTEGER,
    confirmed_cases_february2020 INTEGER,
    confirmed_cases_march2020 INTEGER,
    total_confirmed_cases BIGINT,
    PRIMARY KEY(Country)
);

CREATE TABLE IF NOT EXISTS weather_data
(
    Country VARCHAR(100) NOT NULL,
    precipitation_january2020 REAL,
    temp_avg_january2020 REAL,
    min_temp_january2020 REAL,
    max_temp_january2020 REAL,
    precipitation_february2020 REAL,
    temp_avg_february2020 REAL,
    min_temp_february2020 REAL,
    max_temp_february2020 REAL,
    precipitation_march2020 REAL,
    " temp_avg_march2020" REAL,
    min_temp_march2020 REAL,
    max_temp_march2020 REAL,
    PRIMARY KEY(Country)
);


-- Create FKs
ALTER TABLE weather_data
    ADD    FOREIGN KEY (Country)
    REFERENCES covid_19(Country)
    MATCH SIMPLE
;

SELECT * 
FROM covid_19;

SELECT * 
FROM weather_data;



