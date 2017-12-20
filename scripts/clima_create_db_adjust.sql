-- tables
CREATE TABLE measurements_hourly (
    id bigserial  NOT NULL,
    wsid        int  NOT NULL,
    mdct        date  NOT NULL,
    msdt        date  NOT NULL,
    uthr        interval  NOT NULL,
    prcp        numeric NULL,
    stp         numeric NULL,
    smax        numeric NULL,
    smin        numeric NULL,
    gbrd        numeric NULL,
    temp        numeric NULL,
    tmax        numeric NULL,
    tmin        numeric NULL,
    dewp        numeric NULL,
    dmax        numeric NULL,
    dmin        numeric NULL,
    hmdy        numeric NULL,
    hmax        numeric NULL,
    hmin        numeric NULL,
    wdsp        numeric NULL,
    wdct        numeric NULL,
    gust        numeric NULL,
    CONSTRAINT measurements_hourly_pk PRIMARY KEY (id)
);
-- foreign keys
ALTER TABLE measurements_hourly ADD CONSTRAINT measurements_weather_stations
    FOREIGN KEY (wsid)
    REFERENCES weather_stations (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;
-- End of file.