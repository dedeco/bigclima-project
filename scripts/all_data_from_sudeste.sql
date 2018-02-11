CREATE TABLE tmpsudeste AS
select weather_stations.id AS wsid
,weather_stations.name AS wsnm
,weather_stations.elvt
,weather_stations.lat
,weather_stations.lon
,weather_stations.inmet_code AS inme
,cities.name AS city
,states.abbreviation AS abrv
,measurements_hourly.mdct
,measurements_hourly.msdt
,date_part('year' ,measurements_hourly.msdt) AS yr
,date_part('month',measurements_hourly.msdt) AS mo
,date_part('day',measurements_hourly.msdt) AS da
,date_part('hour',measurements_hourly.mdct) AS hr
,measurements_hourly.prcp
,measurements_hourly.stp
,measurements_hourly.smax
,measurements_hourly.smin
,measurements_hourly.gbrd
,measurements_hourly.temp
,measurements_hourly.tmax
,measurements_hourly.tmin
,measurements_hourly.dewp
,measurements_hourly.dmax
,measurements_hourly.dmin
,measurements_hourly.hmdy
,measurements_hourly.hmax
,measurements_hourly.hmin
,measurements_hourly.wdsp
,measurements_hourly.wdct
,measurements_hourly.gust 
FROM weather_stations 
JOIN measurements_hourly ON measurements_hourly.wsid = weather_stations.id 
JOIN cities ON weather_stations.cities_id = cities.id 
JOIN states ON cities.state_id = states.id 
WHERE states.abbreviation IN ('SP','ES','RJ','MG')  
ORDER BY weather_stations.id ,measurements_hourly.mdct;

