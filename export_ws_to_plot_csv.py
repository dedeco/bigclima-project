#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(WeatherStation)

	file = './data/weather-station-brasil_only.csv'


	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		#header = ['lat','lon'] 
		#outcsv.writerow(header)		

		for r in q.all():
			if r.lat != 0.0 and r.lon != 0.0:
				outcsv.writerow([r.lon,r.lat])	

if __name__ == "__main__":
	export()

