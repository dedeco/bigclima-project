#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(WeatherStation)
	q = q.join(City, WeatherStation.cities_id == City.id)
	q = q.join(State, City.state_id == State.id)
	q = q.filter(State.abbreviation.in_(['MG','SP','ES','RJ']))
	#q = q.filter(WeatherStation.id == 329)
	q = q.order_by(WeatherStation.id)

	for ws in q.all():

		q = session.query(MeasurementHourly.mdct, MeasurementHourly.prcp)
		q = q.filter(MeasurementHourly.wsid == ws.id)
		q = q.order_by(MeasurementHourly.mdct)


		print('Finding extreme for:%s' %ws.name)

		data = q.all()

		go =  True
		start = end = 0
		stop = len(data)

		while(go):

			end = start + 24
			#print (start,end)
			#_prcp = [x[1] for x in data[start:end]]
			prcp = [x[1] for x in data[start:end] if x[1]]
			#print (prcp)

			t = sum(prcp)

			if t > 50.0:

				str_time = [x[0] for x in data[start:end]][0] 
				end_time = [x[0] for x in data[start:end]][-1]
				
				e = Extreme()
				e.wsid = ws.id
				e.mdct_str = str_time
				e.mdct_end = end_time
				e.prcp = t

				#print('Found it',t,str_time,end_time)
				#print(_prcp)

				session.add(e)
				session.commit()

			start += 1
			if (end>=stop):
				break
				
if __name__ == "__main__":
	export()

