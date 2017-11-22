-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-05-19 15:48:24.636

-- foreign keys
ALTER TABLE cities
    DROP CONSTRAINT cities_states;

ALTER TABLE measurements
    DROP CONSTRAINT measurements_parameters;

ALTER TABLE measurements
    DROP CONSTRAINT measurements_weather_stations;

ALTER TABLE states
    DROP CONSTRAINT state_country;

ALTER TABLE weather_stations
    DROP CONSTRAINT weather_stations_cities;

-- tables
DROP TABLE cities;

DROP TABLE countries;

DROP TABLE measurements;

DROP TABLE parameters;

DROP TABLE states;

DROP TABLE weather_stations;

-- End of file.

