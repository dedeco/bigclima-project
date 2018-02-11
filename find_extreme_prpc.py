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

		data = q.all()

		go =  True
		start = end = 0
		stop = len(data)

		print('Finding extreme for:%s in %s records!' %(ws.name,str(stop)))

		while(go):
			
			rain = False
			while not (rain): # just when the rain starts
				#print (start)
				if start < stop and not data[start][1]:
					start += 1
				else:					
					break
			
			end = start + 24
			#print (start,end)
			_prcp = [x[1] for x in data[start:end]]
			prcp = [x[1] for x in data[start:end] if x[1]]
			#print (prcp)
			t = sum(prcp)
			if t > 50.0:
				str_time = [x[0] for x in data[start:end]][0] 
				end_time = [x[0] for x in data[start:end]][-1]

				e = Evolution()
				e.wsid = ws.id
				e.pstr = str_time
				e.pend = end_time
				e.psum = t
				e.hr01 = (_prcp[0]  if _prcp[0] else 0.0)
				e.hr02 = (_prcp[1]  if _prcp[1] else 0.0)
				e.hr03 = (_prcp[2]  if _prcp[2] else 0.0)
				e.hr04 = (_prcp[3]  if _prcp[3] else 0.0)
				e.hr05 = (_prcp[4]  if _prcp[4] else 0.0)
				e.hr06 = (_prcp[5]  if _prcp[5] else 0.0)
				e.hr07 = (_prcp[6]  if _prcp[6] else 0.0)
				e.hr08 = (_prcp[7]  if _prcp[7] else 0.0)
				e.hr09 = (_prcp[8]  if _prcp[8] else 0.0)
				e.hr10 = (_prcp[9]  if _prcp[9] else 0.0)
				e.hr11 = (_prcp[10] if _prcp[10] else 0.0)
				e.hr12 = (_prcp[11] if _prcp[11] else 0.0)
				e.hr13 = (_prcp[12] if _prcp[12] else 0.0)
				e.hr14 = (_prcp[13] if _prcp[13] else 0.0)
				e.hr15 = (_prcp[14] if _prcp[14] else 0.0)
				e.hr16 = (_prcp[15] if _prcp[15] else 0.0)
				e.hr17 = (_prcp[16] if _prcp[16] else 0.0)
				e.hr18 = (_prcp[17] if _prcp[17] else 0.0)
				e.hr19 = (_prcp[18] if _prcp[18] else 0.0)
				e.hr20 = (_prcp[19] if _prcp[19] else 0.0)
				e.hr21 = (_prcp[20] if _prcp[20] else 0.0)
				e.hr22 = (_prcp[21] if _prcp[21] else 0.0)
				e.hr23 = (_prcp[22] if _prcp[22] else 0.0)
				e.hr24 = (_prcp[23] if _prcp[23] else 0.0)             

				#print('Found it',t,str_time,end_time)
				#print(_prcp)

				session.add(e)
				session.commit()

			start += 1
			if (end>=stop):
				break

		#print('End of Finding extreme for:%s in %s records!' %(ws.name,str(stop)))
				
if __name__ == "__main__":
	export()

