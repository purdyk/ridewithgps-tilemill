#!/usr/bin/env python

import mapnik
from sys import argv

if len(argv) < 8:
    print("usage: {0} <outputfile> <width> <height> <scale> <south> <west> <north> <east> <svg>\n coords in WGS84".format(argv[0]))
    exit()

style = '/var/map-styles/ridewithgps-tilemill-512px/ridewithgps-tilemill.xml'
output = argv[1]
width = int(argv[2])
height = int(argv[3])
scale = float(argv[4])
south = float(argv[5])
west = float(argv[6])
north = float(argv[7])
east = float(argv[8])

svg = len(argv) == 10

map = mapnik.Map(width, height)

#webmercator projection
merc = mapnik.Projection('+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over')

# WGS lat/long source projection of centre
longlat = mapnik.Projection('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')

print("Loading style...")
mapnik.load_map(map, style)

#Might revisit?
bounds = mapnik.Box2d(west, south, east, north)

map.srs = longlat.params()

map.zoom_to_box(bounds)

print("Rendering to {0}...".format(output))

if svg:
    import cairo
    surface = cairo.SVGSurface(output, map.width, map.height)
    mapnik.render(map, surface, scale, 0, 0)
    surface.finish()
else:
    mapnik.render_to_file(map, output, 'png', scale)

print("Jobs done")