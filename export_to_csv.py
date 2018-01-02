#!/usr/bin/env python

from database import *

import csv

def export():
	
	q = session.query(WeatherStation).all()

	for ws in q.all():

		q = session.query(WeatherStation.name, MeasurementHourly)
		q = q.join(WeatherStation, WeatherStation.id == MeasurementHourly.wsid)
		q = q.filter(MeasurementHourly.wsid == ws.id)

		file = '.data/' + ws.name + '.csv'

		outfile = open(file, 'wb')
		outcsv = csv.writer(outfile)

		header = [u'ws-name','prcp','stp','smax','smin','gbrd','temp','tmax','tmin','dewp','dmax','dmin','hmdy','hmax','hmin','wdsp','wdct','gust']
		
		outcsv.writerow(header)		

		for r in q.all():			
			outcsv.writerow([r.name,r.prcp,r.stp,r.smax,r.smin,r.gbrd,r.temp,r.tmax,r.tmin,r.dewp,r.dmax,r.dmin,r.hmdy,r.hmax,r.hmin,r.wdsp,r.wdct,r.gust])
	
	outfile.close()			

if __name__ == "__main__":
	export()

