#!/usr/bin/env python

from database import *

import csv

def export():

	q = session.query(Parameter)

	file = './data/parameters-brasil.csv'


	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		header = ['id','name','unit','description'] 
		outcsv.writerow(header)		

		for r in q.all():
			outcsv.writerow([r.id,r.name,r.unit,r.description])	

if __name__ == "__main__":
	export()

