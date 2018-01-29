
from database import *
import csv

def update_fix():

	file = './data/diff-working.csv'

	with open(file, 'r') as csvfile:
		spamreader = csv.reader(csvfile, delimiter=',',quotechar='"')
		for r in spamreader:

			_id = int(r[5])
			ws = session.query(WeatherStation).get(_id)
			ws.inmet_code = r[1]
			ws.lat= float(r[2])
			ws.lon= float(r[3])
			ws.elvt= float(r[4])

			session.commit()


if __name__ == "__main__":
	update_fix()
