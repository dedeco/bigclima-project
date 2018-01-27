#!/usr/bin/env python

#from database import *

import csv
from slugify import slugify

def fix():


	#fs = FuzzySet(corpus)
	#fs.get(query)

	old = []

	with open('./data/weather-station.csv') as csvfile:
		reader1 = csv.DictReader(csvfile)
		for dct in map(dict,reader1):
			old.append(dct)

	for r in old:
		name  = r['name'].split('ESTAÇÃO METEOROLÓGICA AUTOMATICA DE ')[1]
		name = name.split('/')[0]
		#print (name)
		r['simple_name'] = name
		#	ws[row['id']]
			#print(row['id'], row['name'])

	#for r in old:
	#	print (slugify(r['simple_name'])) 
	
	#print (reader1)	
	new =[]

	with open('./data/estacoes_brasil_atualizar.csv') as csvfile:
		reader2 = csv.DictReader(csvfile)
		for dct in map(dict,reader2):
			new.append(dct)

	for r in new:
		name = r['Nome'].split('-')[0]
		r['simple_name'] = name

	dif = {}

	for rn in new:
		for ro in old:
			if slugify(rn['simple_name'])==slugify(ro['simple_name']):
				dif[ro['id']] = ( \
					slugify(rn['simple_name']) \
					,rn['Nome'] \
					,rn['Nome'].split('-')[0] \
					,rn['Nome'].split('-')[1] \
					,rn['Latitude'] \
					,rn['Longitude'] \
					,rn['Altitude'] \
					,ro['id'] \
					,ro['name'] \
					,ro['elevation'] \
					,ro['latitude_dms'] \
					,ro['longitude_dms'] \
				)

	for ro in old:
		if ro['id'] not in dif:
			dif[ro['id']] = ( \
				'' \
				,'' \
				,'' \
				,'' \
				,'' \
				,'' \
				,'' \
				,ro['id'] \
				,ro['name'] \
				,ro['elevation'] \
				,ro['latitude_dms'] \
				,ro['longitude_dms'] \
			)


	file = './data/diff.csv'
	print (dif)

if __name__ == "__main__":
	fix()

