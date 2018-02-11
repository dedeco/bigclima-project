#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(MeasurementHourly.wsid, MeasurementHourly.mdct, MeasurementHourly.prcp)
	q = q.join(WeatherStation, MeasurementHourly.wsid == WeatherStation.id)
	q = q.join(City, WeatherStation.cities_id == City.id)
	q = q.join(State, City.state_id == State.id)
	q = q.filter(State.abbreviation.in_(['MG','SP','ES','RJ']))
	#q = q.filter(WeatherStation.id == 329)
	q = q.order_by(MeasurementHourly.wsid, MeasurementHourly.mdct)

	i =0
	found = False
	start = None

	for wsid, mdct, prcp  in q.all():

		if not start:
			start = mdct
			_sum = 0

		if prcp:
			_sum += prcp
		else:
			if _sum ==0:
				i=0
				start = None

		if i == 24:

			if _sum >= 50:

				e = Extreme()
				e.wsid = wsid
				e.mdct_str = start
				e.mdct_end = mdct
				e.prcp = _sum

				session.add(e)
				session.commit()

				print ('Find it: %f !' %_sum)

				_sum = 0

			start = None
			i = 0

		i+=1


if __name__ == "__main__":
	export()

