#standardSQL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1985` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1986` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1987` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1988` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1989` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1990` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1991` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1992` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1993` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1994` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1995` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1996` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1997` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1998` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod1999` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2000` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2001` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2002` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2003` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2004` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2005` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2006` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2007` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2008` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2009` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2010` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2011` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2012` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2013` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2014` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2015` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2016` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')
UNION ALL
SELECT d.stn, ws.lat, ws.lon, d.da, d.mo, d.year, d.temp
      , d.dewp, d.slp, d.stp, d.visib, d.wdsp, d.mxpsd
      , d.gust, d.max, d.min, d.prcp, d.flag_prcp, d.sndp
      , d.fog, d.rain_drizzle, d.snow_ice_pellets, d.hail
      , d.thunder, d.tornado_funnel_cloud
FROM
  `bigquery-public-data.noaa_gsod.gsod2017` AS d
JOIN
  `bigquery-public-data.noaa_gsod.stations` AS ws
ON
  d.stn = ws.usaf
  AND d.wban = ws.wban
WHERE
  ws.state IS NOT NULL
  AND ws.country = 'US'
  AND d.mo IN ('06','07','08')