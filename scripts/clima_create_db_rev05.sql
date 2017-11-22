-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-05-19 15:48:24.636

-- tables
-- Table: cities
CREATE TABLE cities (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    state_id int  NOT NULL,
    CONSTRAINT cities_pk PRIMARY KEY (id)
);

-- Table: countries
CREATE TABLE countries (
    id serial  NOT NULL,
    name varchar(32)  NOT NULL,
    abbreviation varchar(2)  NOT NULL,
    CONSTRAINT countries_pk PRIMARY KEY (id)
);

-- Table: measurements
CREATE TABLE measurements (
    id bigserial  NOT NULL,
    weather_station_id int  NOT NULL,
    parameter_id int  NOT NULL,
    measure_date_complete date  NOT NULL,
    measure_date date  NOT NULL,
    utc_hour interval  NOT NULL,
    value decimal(5,5)  NOT NULL,
    CONSTRAINT measurements_pk PRIMARY KEY (id)
);

-- Table: parameters
CREATE TABLE parameters (
    id serial  NOT NULL,
    name varchar(255)  NOT NULL,
    unit varchar(32)  NOT NULL,
    description varchar(255)  NOT NULL,
    CONSTRAINT parameters_pk PRIMARY KEY (id)
);

-- Table: states
CREATE TABLE states (
    id serial  NOT NULL,
    name varchar(32)  NOT NULL,
    abbreviation varchar(32)  NOT NULL,
    region varchar(32)  NULL,
    country_id int  NOT NULL,
    CONSTRAINT states_pk PRIMARY KEY (id)
);

-- Table: weather_stations
CREATE TABLE weather_stations (
    id serial  NOT NULL,
    cod_mapa int  NULL,
    name varchar(255)  NOT NULL,
    elevation decimal(6,2)  NOT NULL,
    latitude_dms varchar(32)  NOT NULL,
    longitude_dms varchar(32)  NOT NULL,
    latitude_dd decimal(6,6)  NULL,
    longitude_dd decimal(6,6)  NULL,
    cities_id int  NOT NULL,
    CONSTRAINT weather_station_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: cities_states (table: cities)
ALTER TABLE cities ADD CONSTRAINT cities_states
    FOREIGN KEY (state_id)
    REFERENCES states (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: measurements_parameters (table: measurements)
ALTER TABLE measurements ADD CONSTRAINT measurements_parameters
    FOREIGN KEY (parameter_id)
    REFERENCES parameters (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: measurements_weather_stations (table: measurements)
ALTER TABLE measurements ADD CONSTRAINT measurements_weather_stations
    FOREIGN KEY (weather_station_id)
    REFERENCES weather_stations (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: state_country (table: states)
ALTER TABLE states ADD CONSTRAINT state_country
    FOREIGN KEY (country_id)
    REFERENCES countries (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: weather_stations_cities (table: weather_stations)
ALTER TABLE weather_stations ADD CONSTRAINT weather_stations_cities
    FOREIGN KEY (cities_id)
    REFERENCES cities (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

