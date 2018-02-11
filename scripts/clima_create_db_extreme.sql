
-- Table: weather_stations
CREATE TABLE extreme_prcp (
    id serial  NOT NULL,
    wsid int NOT NULL,
    mdct_str timestamp  NOT NULL,
    mdct_end timestamp  NOT NULL,
    CONSTRAINT extreme_prcp_pk PRIMARY KEY (id)
);

ALTER TABLE extreme_prcp ADD CONSTRAINT extreme_prcp_ws
    FOREIGN KEY (wsid)
    REFERENCES weather_stations (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

