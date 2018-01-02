from database import *
from sqlalchemy import and_

import pandas as pd
import datetime

def main():
	q = session.query(MeasureRanges).filter(MeasureRanges.wsid==329)

	ranges = q.all()

	i =0

	for r in ranges:
		dates = pd.date_range(r.min,r.max, freq="H")

		for d in dates:
			m = session.query(Measurement).filter(and_(Measurement.mdth==d,Measurement.wsid==r.wsid)).all()
			
			values = [(i.ptid,i.vlue) for i in m]
			l = dict(values)

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
				print ('1000 records!')
				session.commit()
				i=0



if __name__ == "__main__":
	main()