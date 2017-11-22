-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-05-01 16:37:39.469

-- tables
-- Table: locations
CREATE TABLE locations (
    id serial  NOT NULL,
    city varchar(255)  NOT NULL,
    state varchar(32)  NOT NULL,
    country varchar(32)  NOT NULL,
    region varchar(32)  NOT NULL,
    CONSTRAINT locations_pk PRIMARY KEY (id)
);

-- Table: measurements
CREATE TABLE measurements (
    id bigserial  NOT NULL,
    weather_stations_id int  NOT NULL,
    parameters_id int  NOT NULL,
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

-- Table: weather_stations
CREATE TABLE weather_stations (
    id serial  NOT NULL,
    location_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    elevation int  NOT NULL,
    latitude_dms varchar(32)  NOT NULL,
    longitude_dms varchar(32)  NOT NULL,
    latitude_dd decimal(6,6)  NOT NULL,
    longitude_dd decimal(6,6)  NOT NULL,
    CONSTRAINT weather_station_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: measurements_parameters (table: measurements)
ALTER TABLE measurements ADD CONSTRAINT measurements_parameters
    FOREIGN KEY (parameters_id)
    REFERENCES parameters (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: measurements_weather_stations (table: measurements)
ALTER TABLE measurements ADD CONSTRAINT measurements_weather_stations
    FOREIGN KEY (weather_stations_id)
    REFERENCES weather_stations (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: weather_station_location (table: weather_stations)
ALTER TABLE weather_stations ADD CONSTRAINT weather_station_location
    FOREIGN KEY (location_id)
    REFERENCES locations (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

