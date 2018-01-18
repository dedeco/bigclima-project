from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine

Base = automap_base()

engine = create_engine('mysql://dedeco:012288@localhost:3306/clima', echo=True)

Base.prepare(engine, reflect=True)

# Map the tables
State = Base.classes.states

session = Session(engine, autoflush=False)

