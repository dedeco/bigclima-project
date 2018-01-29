#!/usr/bin/env python

from database import *


def fix():

	q = session.query(WeatherStation)

	for ws in q.all():
		name = ws.name.split('ESTAÇÃO METEOROLÓGICA AUTOMATICA DE ')[1]
		name = name.split('/')[0]
		ws.name = name
		session.commit()

	return

if __name__ == "__main__":
	fix()

