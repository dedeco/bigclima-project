from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
import string
from decimal import Decimal

ECHO = False
AUTOFLUSH = False

Base = automap_base()

engine = create_engine('postgresql://dedeco:123456@localhost:5432/clima', echo=ECHO)

Base.prepare(engine, reflect=True)

Country = Base.classes.countries
State = Base.classes.states
City = Base.classes.cities
Measurement = Base.classes.measurements
MeasurementHourly = Base.classes.measurements_hourly
MeasureRanges = Base.classes.measure_ranges
Parameter = Base.classes.parameters
WeatherStation = Base.classes.weather_stations
Extreme = Base.classes.extreme_prcp
Evolution = Base.classes.extreme_prcp_evo

session = Session(engine, autoflush=AUTOFLUSH)

