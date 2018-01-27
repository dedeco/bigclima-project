SELECT measure_ranges.wsid AS wsid
FROM measure_ranges
JOIN weather_stations ON measure_ranges.wsid = weather_stations.id
JOIN cities ON weather_stations.cities_id = cities.id
JOIN states ON cities.state_id = states.id
JOIN (Select cast(wsid as int) as wsid
            , max(mdct) as m
      from measurements_hourly
      GROUP by wsid) t
 ON t.wsid = measure_ranges.wsid
WHERE states.abbreviation IN ('SP',
                              'MG',
                              'ES',
                              'RJ')


SELECT measure_ranges.wsid AS wsid
FROM measure_ranges
JOIN weather_stations ON measure_ranges.wsid = weather_stations.id
JOIN cities ON weather_stations.cities_id = cities.id
JOIN states ON cities.state_id = states.id
WHERE states.abbreviation IN ('SP',
                              'MG',
                              'ES',
                              'RJ')
  AND measure_ranges.wsid NOT IN
    (SELECT measure_ranges.wsid AS wsid
     FROM measure_ranges
     JOIN weather_stations ON measure_ranges.wsid = weather_stations.id
     JOIN cities ON weather_stations.cities_id = cities.id
     JOIN states ON cities.state_id = states.id
     JOIN
       (SELECT cast(wsid AS int) AS wsid ,
               max(mdct) AS m
        FROM measurements_hourly
        GROUP BY wsid) t ON t.wsid = measure_ranges.wsid
     WHERE states.abbreviation IN ('SP',
                                   'MG',
                                   'ES',
                                   'RJ') )


SELECT t.wsid
FROM measure_ranges
JOIN
  (SELECT cast(wsid as int) as wsid
         ,max(mdct) as m
   FROM measurements_hourly
   GROUP BY wsid) t ON (t.wsid = measure_ranges.wsid
                        AND t.m < measure_ranges.max);

