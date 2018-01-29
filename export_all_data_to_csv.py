#!/usr/bin/env python

from database import *
from slugify import slugify

import csv

def export():
	
	q = session.query(WeatherStation).filter_by(id=1)

	for ws in q.all():

		q = session.query(WeatherStation \
						,City.name \
						,State.abbreviation \
						,func.date_part('year',MeasurementHourly.msdt).label('yr') \
						,func.date_part('month',MeasurementHourly.msdt).label('mo') \
						,func.date_part('day',MeasurementHourly.msdt).label('da')\
						,func.date_part('hour',MeasurementHourly.msct).label('hr') \
						,MeasurementHourly)
		q = q.join(MeasurementHourly, MeasurementHourly.wsid == WeatherStation.id)
		q = q.join(City, WeatherStation.cities_id == City.id)
		q = q.join(State, City.state_id == State.id)
		q = q.filter(State.abbreviation.in_(['MG','SP','ES','RJ']))
		q = q.filter(WeatherStation.id == ws.id)		
		q = q.order_by(MeasurementHourly.mdct)

		file = './data/' + slugify(ws.name) + '.csv'


		with open(file, 'w') as csvfile:
			outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)
			
			header = [
				 'wsid'\
				,'wsnm'\
				,'elvt'\
				,'lat'\
				,'lon'\
				,'inme'\
				,'city'\
				,'prov'\
				,'dtct'\
				,'date'\
				,'yr'\
				,'mo'\
				,'da'\
				,'hr'\
				,'prcp'\
				,'stp'\
				,'smax'\
				,'smin'\
				,'gbrd'\
				,'temp'\
				,'tmax'\
				,'tmin'\
				,'dewp'\
				,'dmax'\
				,'dmin'\
				,'hmdy'\
				,'hmax'\
				,'hmin'\
				,'wdsp'\
				,'wdct'\
				,'gust'
				]
			outcsv.writerow(header)		

			for ws,city,abrv,yr,mo,da,hr, m in q.all():
				outcsv.writerow([
					 ws.wsid\
					,ws.name\
					,ws.elvt\
					,ws.lat\
					,ws.lon\
					,ws.inmet_code\
					,city\
					,abrv\
					,m.dtct\
					,m.date\
					,yr\
					,mo\
					,da\
					,hr\
					,m.prcp\
					,m.stp \
					,m.smax\
					,m.smin\
					,m.gbrd\
					,m.temp\
					,m.tmax\
					,m.tmin\
					,m.dewp\
					,m.dmax\
					,m.dmin\
					,m.hmdy\
					,m.hmax\
					,m.hmin\
					,m.wdsp\
					,m.wdct\
					,m.gust\
					])	

if __name__ == "__main__":
	export()

