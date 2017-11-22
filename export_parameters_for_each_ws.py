#!/usr/bin/env python
import os
import xlrd
import xlwt

path = './data'

workbook = xlwt.Workbook()
sheet = workbook.add_sheet("WS") 

header = [u'WS Name',u'Level',u'Latitude',u'Longitude',u'Parameters']

column =0
for h in header:
	sheet.write(0, column, h)
	column += 1

row = 1

for root,dirs,files in os.walk(path):
	xlsfiles=[ _ for _ in files if _.endswith('.xls') ]
	for xlsfile in xlsfiles:
		print 'File:', xlsfile 
		wb = xlrd.open_workbook(os.path.join(root,xlsfile))
		sh = wb.sheet_by_index(0)
		basic = {'name': sh.cell_value(2,0),'altitude': sh.cell_value(5,1), 'latitude': sh.cell_value(6,1), 'longitude': sh.cell_value(7,1)}
		column =0
		for key, v in basic.iteritems():
			sheet.write(row, column, v)
			column += 1
		parameters =[]
		for cols in range(sh.ncols):
			parameters.append(sh.cell_value(9,cols))
		for p in set(parameters):
			if p:
				sheet.write(row, column, p)
				column += 1
		row += 1
	#if row >= 3:
	#	break

workbook.save("parameters_per_ws.xls") 

#civ