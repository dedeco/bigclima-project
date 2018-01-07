from database import *
from sqlalchemy import and_, func

import pandas as pd
import datetime
import sqlalchemy

def main():
	q = session.query(MeasureRanges).filter(MeasureRanges.wsid>=32).order_by(MeasureRanges.wsid) 
	#q = session.query(MeasureRanges).order_by(MeasureRanges.wsid) 

	ranges = q.all()

	i =0

	for r in ranges:

		print ('Pivoting WS %s' %r.wsid)

		try:		
			m = session.query(func.max(MeasurementHourly.mdct)).filter(MeasurementHourly.wsid==r.wsid).scalar()
			print ('Exist min: %s' %m)			
		except NoResultFound:
			m = r.min

		if m < r.min:
			m = r.min

		dates = pd.date_range(r.min,r.max, freq="H")

		for d in dates:

			try:
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
				if i > 10000:
					print ('+ 10000 records commited!')
					session.commit()
					i=0

			except sqlalchemy.exc.IntegrityError:
				print ('duplicate date: %s' %d)
				session.rollback()

		session.commit()

if __name__ == "__main__":
	main()