from database import session, engine

from xlrd import open_workbook
wb = open_workbook('./docs/weather_stations_list_and_parameters.xls')

sh = wb.sheet_by_index(0)

ws = []

try:
	for r in range(sh.nrows):
		c = None
		name = sh.cell_value(r,5).strip()
		state =sh.cell_value(r,6)
		try:
			try:
				try:
					c = session.query(City).filter(func.UPPER(func.unaccent(City.name))==func.UPPER(func.unaccent(name))).one()
				except MultipleResultsFound:
					c = session.query(City).join(State,City.state_id == State.id).filter(State.abbreviation==state).filter(func.UPPER(func.unaccent(City.name))==func.UPPER(func.unaccent(name))).one()
			except NoResultFound:
				try:
					c = session.query(City).filter(City.name.contains(func.UPPER(func.unaccent(name)))).one()
				except NoResultFound:
					c = None
		except NoResultFound:
			print 'Verificar problema com cidade'
		
		if c:
			id = c.id
		else:
			id = 0 

		import re
		text = (sh.cell_value(r,2))

		try:
		    elevation = re.search('^(.+?(?=m))', text).group(1)
		except AttributeError:
			elevation = text

		WS = WeatherStation()
		WS.name = (sh.cell_value(r,1))
		WS.elevation = Decimal(elevation.replace(',','.')) 
		WS.latitude_dms = (sh.cell_value(r,3))
		WS.longitude_dms = (sh.cell_value(r,4))
		WS.cities_id = c.id
		session.add(WS)

except Exception, e:
	print 'Erro:', str(e)
	session.rollback()

session.commit()

