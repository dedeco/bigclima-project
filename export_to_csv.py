#!/usr/bin/env python

from database import *
from slugify import slugify

import csv

def export():
	
	q = session.query(WeatherStation).filter_by(id=1)

	for ws in q.all():

		q = session.query(WeatherStation.name, MeasurementHourly)
		q = q.join(MeasurementHourly, MeasurementHourly.wsid == WeatherStation.id)
		q = q.filter(WeatherStation.id == ws.id)
		q = q.order_by(MeasurementHourly.mdct)

		file = './data/' + slugify(ws.name) + '.csv'


		with open(file, 'w') as csvfile:
			outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)
			
			header = ['date_complete','date','hour','prcp','stp','smax','smin','gbrd','temp','tmax','tmin','dewp','dmax','dmin','hmdy','hmax','hmin','wdsp','wdct','gust']
			outcsv.writerow(header)		

			for name, r in q.all():
				outcsv.writerow([r.mdct,r.msdt,r.uthr,r.prcp,r.stp,r.smax,r.smin,r.gbrd,r.temp,r.tmax,r.tmin,r.dewp,r.dmax,r.dmin,r.hmdy,r.hmax,r.hmin,r.wdsp,r.wdct,r.gust])	

if __name__ == "__main__":
	export()

