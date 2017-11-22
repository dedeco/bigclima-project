from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
import string
from decimal import Decimal

ECHO = False
AUTOFLUSH = False

Base = automap_base()

engine = create_engine('postgresql://dedeco:kMusashi745@localhost:5432/Clima', echo=ECHO)

Base.prepare(engine, reflect=True)

# mapped classes are now created with names by default
# matching that of the table name.
Country = Base.classes.countries
State = Base.classes.states
City = Base.classes.cities
Measurement = Base.classes.measurements
Parameter = Base.classes.parameters
WeatherStation = Base.classes.weather_stations

session = Session(engine, autoflush=AUTOFLUSH)