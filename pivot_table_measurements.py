from database import *
from sqlalchemy import and_, func, text

import pandas as pd
import datetime
import sqlalchemy

def main():

	sql =  "SELECT measure_ranges.wsid AS wsid \
			FROM measure_ranges \
			JOIN weather_stations ON measure_ranges.wsid = weather_stations.id \
			JOIN cities ON weather_stations.cities_id = cities.id \
			JOIN states ON cities.state_id = states.id \
			WHERE  measure_ranges.wsid NOT IN \
				(SELECT measure_ranges.wsid AS wsid \
				 FROM measure_ranges \
				 JOIN weather_stations ON measure_ranges.wsid = weather_stations.id \
				 JOIN cities ON weather_stations.cities_id = cities.id \
				 JOIN states ON cities.state_id = states.id \
				 JOIN \
				   (SELECT cast(wsid AS int) AS wsid , \
						   max(mdct) AS m \
					FROM measurements_hourly \
					GROUP BY wsid) t ON t.wsid = measure_ranges.wsid \
				 WHERE states.abbreviation IN ('SP','MG','ES','RJ')) \
				 ORDER BY measure_ranges.wsid" 

	result = session.execute(sql)                               
	
	for r in result:

	#q = session.query(MeasureRanges)
	#q = q.join(WeatherStation, MeasureRanges.wsid == WeatherStation.id)
	#q = q.join(City, WeatherStation.cities_id == City.id)
	#q = q.join(State, City.state_id == State.id)
	#q = q.filter(State.abbreviation.in_(['MG','SP','ES','RJ']))
	#q = q.filter(MeasureRanges.wsid.notin_(sq))
	
		q = session.query(MeasureRanges).filter(MeasureRanges.wsid==r[0])   
		#q = session.query(MeasureRanges).filter(MeasureRanges.wsid>32).order_by(MeasureRanges.wsid) 
		#q = session.query(MeasureRanges).order_by(MeasureRanges.wsid) 

		ranges = q.all()

		i =0

		for r in ranges:

			print ('Pivoting WS %s' %r.wsid)

			m = session.query(func.max(MeasurementHourly.mdct)).filter(MeasurementHourly.wsid==r.wsid).scalar()
			
			if m:
				print ('Exist min: %s' %m)          
				if m <= r.min:
					m = r.min           
			else:
				m = r.min
			
			dates = pd.date_range(m,r.max, freq="H")

			for d in dates:

				try:

					ms = session.query(Measurement).filter(and_(Measurement.mdth==d,Measurement.wsid==r.wsid)).order_by(Measurement.mdth).all()
					
					values = [(i.ptid,i.vlue) for i in ms]
					l = dict(values)

					#print (d, l.get(6))

					mh = MeasurementHourly()
					mh.wsid = r.wsid
					mh.mdct = d
					mh.msdt = d 
					mh.uthr = d.strftime("%H:%M:%S")
					mh.prcp = l.get(1)
					mh.stp = l.get(2)
					mh.smax = l.get(3)
					mh.smin = l.get(4)
					mh.gbrd = l.get(5)
					mh.temp = l.get(6)
					mh.tmax = l.get(7)
					mh.tmin = l.get(8)
					mh.dewp = l.get(9)
					mh.dmax = l.get(10)
					mh.dmin = l.get(11)
					mh.hmdy = l.get(12)
					mh.hmax = l.get(13)
					mh.hmin = l.get(14)
					mh.wdsp = l.get(15)
					mh.wdct = l.get(16)
					mh.gust = l.get(17)

					session.add(mh)

					i += 1
					if i > 1000:
						session.commit()
						print ('+ 1000 records commited!')
						i=0

				except sqlalchemy.exc.IntegrityError:
					print ('duplicate date: %s' %d)
					session.rollback()

			session.commit()

if __name__ == "__main__":
	main()