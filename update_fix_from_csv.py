import csv

def update_fix():

	file = './data/diff-working.csv'

	with open(file, 'r') as csvfile:
		spamreader = csv.reader(csvfile, delimiter=',',quotechar='"')
		for row in spamreader:
			print (row)
			#1cod
			#2lat
			#3lon
			#4alt
			#5id

if __name__ == "__main__":
	update_fix()
