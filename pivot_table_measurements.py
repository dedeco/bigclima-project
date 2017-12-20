from database import session
from database import MeasureRanges

def main():
	q = session.query(MeasureRanges,(MeasureRanges.max - MeasureRanges.min).label("diff")).filter_by(weather_station_id=329)

	ranges = q.all()

	for r,diff in ranges:
		print diff, '%%%%%%%%%%%%%%%'

if __name__ == "__main__":
	main()


