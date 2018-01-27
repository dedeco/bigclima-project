#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(WeatherStation)

	file = './data/weather-station.csv'


	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		header = ['id','name','elevation','latitude_dms','longitude_dms','latitude_dd','longitude_dd','cities_id','cod_mapa'] 
		outcsv.writerow(header)		

		for r in q.all():
			outcsv.writerow([r.id,r.name,r.elevation,r.latitude_dms,r.longitude_dms,r.latitude_dd,r.longitude_dd,r.cities_id,r.cod_mapa])	

if __name__ == "__main__":
	export()

