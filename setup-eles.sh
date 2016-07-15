#!/bin/bash

if [ ! -d eles ]; then
  mkdir eles
fi
rm eles/*

unzip N45W123.SRTMGL3.hgt.zip
gdalwarp -t_srs "EPSG:3857" -r bilinear -of VRT N45W123.hgt eles/srtm_30m.vrt
gdaldem hillshade eles/srtm_30m.vrt styles/rwgps/layers/srtm3_hillshade.tiff -of GTiff
gdaldem slope eles/srtm_30m.vrt styles/rwgps/layers/srtm3_slope.tiff -of GTiff

#make contours
gdal_contour -i 10 -a ele -snodata -32768 N45W123.hgt eles/contours.shp

#import 10m contours into db
ogr2ogr -f PostgreSQL -nln srtm -append -t_srs 'EPSG:3857' PG:"dbname=srtm user=gis" eles/contours.shp

psql -d srtm -U gis -f contour_pyramids.sql
