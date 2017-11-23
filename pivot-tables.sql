SELECT measurements.measure_date_complete AS measurements_measure_date_complete ,
       measurements.measure_date AS measurements_measure_date ,
       measurements.utc_hour AS measurements_utc_hour ,
       measurements.value AS measurements_value ,
       weather_stations.id AS weather_stations_id ,
       weather_stations.name AS weather_stations_name ,
       weather_stations.elevation AS weather_stations_elevation ,
       weather_stations.latitude_dms AS weather_stations_latitude_dms ,
       weather_stations.longitude_dms AS weather_stations_longitude_dms ,
       weather_stations.cod_mapa AS weather_stations_cod_mapa ,
       parameters.id AS parameters_id ,
       parameters.name AS parameters_name 
FROM measurements
JOIN weather_stations ON measurements.weather_station_id = weather_stations.id
JOIN PARAMETERS ON measurements.parameter_id = PARAMETERS.id
WHERE weather_stations.id = 363 
order by measurements.measure_date_complete,measurements.parameter_id
LIMIT 4

CREATE TEMP TABLE PIVOT363 as
Select *
from crosstab (
'SELECT measurements.measure_date_complete AS mdate ,
       parameters.name AS par,
       measurements.value AS mvalue
FROM measurements
JOIN weather_stations ON measurements.weather_station_id = weather_stations.id
JOIN PARAMETERS ON measurements.parameter_id = PARAMETERS.id
WHERE weather_stations.id = 363
order by measurements.measure_date_complete,measurements.parameter_id',
'select name from PARAMETERS order by id'
) as FINAL_RESULT(mdate DATE, prec NUMERIC, pa NUMERIC, pa_amax NUMERIC, pa_min NUMERIC,ra NUMERIC, temp_ar NUMERIC, temp_orv NUMERIC, temp_max NUMERIC, temp_max_orv NUMERIC, temp_min NUMERIC, temp_min_orv NUMERIC, umid NUMERIC, umid_max NUMERIC, umid_min NUMERIC, vento_vel NUMERIC, vento_dir NUMERIC, vento_raj NUMERIC);



SELECT *
FROM measurements
WHERE weather_station_id = 363
  AND measure_date_complete >= '2008-06-07'
  AND measure_date_complete <= '2008-06-07'
  AND parameter_id = 2;

select name from PARAMETERS order by parameter_id


SELECT * 
FROM crosstab( 'select student, subject, evaluation_result from evaluations order by 1,2') 
     AS final_result(Student TEXT, Geography NUMERIC,History NUMERIC,Language NUMERIC,Maths NUMERIC,Music NUMERIC);

Precipitação
 Pressão Atmosferica
 Pressão Atmosférica Máxima
 Pressão Atmosférica Mínima
 Radiacao Global
 Temperatura Do Ar
 Temperatura Do Ponto De Orvalho
 Temperatura Máxima
 Temperatura Máxima Do Ponto De Orvalho
 Temperatura Mínima
 Temperatura Mínima Do Ponto De Orvalho
 Umidade Relativa Do Ar
 Umidade Relativa Maxima Do Ar
 Umidade Relativa Minima Do Ar
 Vento Velocidade
 Vento, Direção
 Vento, Rajada Maxima