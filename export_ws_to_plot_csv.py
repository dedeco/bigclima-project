#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(WeatherStation)

	file = './data/weather-station-brasil.csv'


	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		header = ['id','name','lat','lon'] 
		outcsv.writerow(header)		

		for r in q.all():
			outcsv.writerow([r.id,r.name,r.lat,r.lon])	

if __name__ == "__main__":
	export()

