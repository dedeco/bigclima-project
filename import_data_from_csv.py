#!/usr/bin/env python
import os
import xlrd
import logging
import sys

from datetime import datetime, timedelta 
from database import session, engine
from database import Parameter, Measurement, WeatherStation
from sqlalchemy.orm.exc import MultipleResultsFound, NoResultFound
from sqlalchemy import func

def main():


	try:
		arquivos = 0
		path = './data'

		logging.basicConfig(filename='processamento.log', level=logging.INFO, format='%(asctime)s %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p')
		logging.info(u'Started')

		for root,dirs,files in os.walk(path):
			xlsfiles=[ _ for _ in files if _.endswith('.xls') ]
			for xlsfile in xlsfiles:

				logging.info(u'File: ' + xlsfile)

				wb = xlrd.open_workbook(os.path.join(root,xlsfile))
				sh = wb.sheet_by_index(0)

				'''
				try:
				    cod = re.search('^_[a-zA-Z0-9]+_([a-zA-Z0-9]+)_([a-zA-Z0-9]+)_[a-zA-Z0-9]+', xlsfile).group(3) 
				except AttributeError:
					pass
				'''
				name = sh.cell_value(2,0) 
				WS = session.query(WeatherStation).filter(func.Upper(func.unaccent(WeatherStation.name)).ilike(func.Upper(func.unaccent(name)))).one()
				logging.info(u'Name Weather Station: %s' % WS.name)

				limite_row = 0

				c = r = 0 

				for col in range (1, sh.ncols):

					try:
						hora_utc = sh.cell_value(10,col) 
						#print hora_utc
						hora_utc_td = timedelta(hours = float(hora_utc)/100)
						#print hora_utc_td
					except ValueError:
						hora_utc_td = None


					for row in range (9, sh.nrows):

						cell_type = sh.cell_type(row,0)
						if cell_type == xlrd.XL_CELL_DATE:
							dt_tuple = xlrd.xldate_as_tuple(sh.cell_value(row,0) , wb.datemode)
							dt_complete = datetime(dt_tuple[0], dt_tuple[1], dt_tuple[2], int(hora_utc/100), dt_tuple[4], dt_tuple[5])
							#print dt_complete
							dt = datetime(dt_tuple[0], dt_tuple[1], dt_tuple[2], dt_tuple[3], dt_tuple[4], dt_tuple[5])
							#print dt

						cell = sh.cell_value(row,col)
						cell_type = sh.cell_type(row,col)

						if row ==9: #linha do nome do parametro

							import re

							try:
							    p = re.search('^.*?(?=\s\()', cell).group(0)
							except AttributeError:

								#print cell, 'value'

								if cell.strip() == None:
									limite_row = row
									logging.info(u'End of line, stop please, cell %s, collumn %s, row: %s.' %(cell, col, row))
									break
								else: 
									p = cell

							try:
								try:
									parameter = session.query(Parameter).filter(func.Upper(func.unaccent(Parameter.name)).ilike(func.Upper(func.unaccent(p.strip())))).one()
								except MultipleResultsFound:
									parameter = session.query(Parameter).filter(func.Upper(func.unaccent(Parameter.name)).ilike(func.Upper(func.unaccent(p.strip())))).all()
									for i in parameter:
										logging.warning(u'I have to fix this, because it found so many parameters, id %d and name: %s.'  %(i.id, i.name, i))
									break
							except NoResultFound:
								if p:
									logging.warning(u'Without parameter with name or end of row: %s' %p)
								else:
									logging.warning(u'End of row. Value: %s' %p)
								break

						if row >= 11 and not cell_type == xlrd.XL_CELL_EMPTY:

							logging.info(u'Parameter %s data %s hour UTC %f value %s ' %(parameter.name, dt.strftime('%d/%m/%Y %H:%M:%S'), hora_utc, cell))
							if cell:
								if cell =='NULL':
									cell = 0.0 
								m = Measurement()
								m.weather_station_id = WS.id
								m.parameter_id = parameter.id
								m.measure_date_complete = dt_complete
								m.measure_date = dt
								m.utc_hour = hora_utc_td
								m.value = float(cell)
								session.add(m)

						r= row
					c = col 

				logging.info(u'Ending of sheet, row: %s and collumn %s' %(r,c))
				#session.rollback()
				session.commit()


			#arquivos += 1
			#if arquivos > 3:
			#	logging.info(u'Ending NOW')
			#	return

		logging.info(u'End of everything')

	except  Exception, e:
		logging.error(u'Unexpected error: %s. %s' %(sys.exc_info()[0],str(e)))
		session.rollback()
		raise

	logging.info(u'Commit')
	#session.rollback()
	session.commit()

	return

if __name__ == "__main__":
	main()



					
