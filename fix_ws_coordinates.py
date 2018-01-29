#!/usr/bin/env python

#from database import *

import csv
from slugify import slugify
from fuzzyset import FuzzySet

def fix():

	old = {}
	i =0
	with open('./data/weather-station.csv') as csvfile:
		reader1 = csv.DictReader(csvfile)
		for dct in map(dict,reader1):
			old[i] = dct
			i+=1

	for k,r in old.items():
		name  = r['name'].split(u'ESTAÇÃO METEOROLÓGICA AUTOMATICA DE ')[1]
		name = name.split('/')[0]
		#print (name)
		r['simple_name'] = name
		#	ws[row['id']]
			#print(row['id'], row['name'])

	#for r in old:
	#	print (slugify(r['simple_name'])) 
	
	#print (reader1)	
	new ={}
	i =0
	with open('./data/estacoes_brasil_atualizar.csv') as csvfile:
		reader2 = csv.DictReader(csvfile)
		for dct in map(dict,reader2):
			new[i] = dct
			i+=1
	j=0
	for k,r in new.items():
		name = r['Nome'].split('-')[0]
		r['simple_name'] = name
		r['idd'] = j
		j+=1

	dif = {}

	ids =set()

	for k, rn in new.items():
		for j, ro in old.items():
			if slugify(rn['simple_name'])==slugify(ro['simple_name']):
				dif[ro['id']] = ( \
					 k \
					,slugify(ro['simple_name']) \
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
					,'IGUAL' \
					,1 \
				)
				ids.add(k)

	for k in ids:
		new.pop(k, None)

	for k,rn in new.items():
		biggest = -1.0
		item = None
		for j,ro in old.items():
			if ro['id'] not in dif:	
				t = FuzzySet()
				name_old = slugify(ro['simple_name'])
				#print ('old:',name_old)
				t.add(name_old)
				name_new = slugify(rn['simple_name'])
				#print ('new:',name_new)
				result = t.get(name_new)
				#print (result)
				if result:
					for r, s in result:
						#print (r)
						if r >= biggest:
							 biggest = r
							 item = k,rn,ro, r
				#print (item)
				#print ('b',biggest)

		if item:
			k,x,y,z = item
			if z > 0.67 and k not in [156,192,252,439,441,518,539]:
				dif[y['id']] = ( \
					 k
					,slugify(y['simple_name']) \
					,x['Nome'] \
					,x['Nome'].split('-')[0] \
					,x['Nome'].split('-')[1] \
					,x['Latitude'] \
					,x['Longitude'] \
					,x['Altitude'] \
					,y['id'] \
					,y['name'] \
					,y['elevation'] \
					,y['latitude_dms'] \
					,y['longitude_dms'] \
					,'SEMELHANTE' \
					,z \
				)
			else:
				dif[y['id']] = ( \
					k
					,slugify(y['simple_name']) \
					,'' \
					,'' \
					,'' \
					,'' \
					,'' \
					,'' \
					,y['id'] \
					,y['name'] \
					,y['elevation'] \
					,y['latitude_dms'] \
					,y['longitude_dms'] \
					,'?' \
					,0 \
				)

	file = './data/diff.csv'

	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		header = ['id-ditc','nome-slug','nome-antes','nome','cod','lat','lon','alt','id','name-original','elevação','lat_dms','lon_dms','Igualdade','FuzzySet'] 
		outcsv.writerow(header)		

		for k,v in dif.items():
			outcsv.writerow(list(v))	

	no_match = {}

	for k, x in new.items():
		no_match[x['idd']] = ( \
			k
			,slugify(y['simple_name']) \
			,x['Nome'] \
			,x['Nome'].split('-')[0] \
			,x['Nome'].split('-')[1] \
			,x['Latitude'] \
			,x['Longitude'] \
			,x['Altitude'] \
			,'' \
			,'' \
			,'' \
			,'' \
			,'' \
			,'?' \
			,0 	\
		)


	file = './data/diff-no-match.csv'

	with open(file, 'w') as csvfile:
		outcsv = csv.writer(csvfile, delimiter=',',quotechar='"', quoting = csv.QUOTE_MINIMAL)

		header = ['id-ditc','nome-slug','nome-antes','nome','cod','lat','lon','alt','id','name-original','elevação','lat_dms','lon_dms','Igualdade','FuzzySet'] 
		outcsv.writerow(header)		

		for k,v in no_match.items():
			outcsv.writerow(list(v))	


if __name__ == "__main__":
	fix()

