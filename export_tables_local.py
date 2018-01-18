#!/usr/bin/env python

from databases import *
import csv

def export():

	q = session.query(State)
		
	file = './data/states.csv'
	
	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)
		
		header = State.__table__.columns.keys()

		outcsv.writerow(header)		

		for record in q.all():
			outcsv.writerow([getattr(record, c) for c in header ])

if __name__ == "__main__":
	export()

