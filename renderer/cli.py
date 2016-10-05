#!/usr/bin/env python

from sys import argv
from MapRenderer import MapRenderer

if len(argv) < 8:
    print("usage: {0} <outputfile> <width> <height> <scale> <south> <west> <north> <east> <svg>\n coords in WGS84".format(argv[0]))
    exit()

output = argv[1]
width = int(argv[2])
height = int(argv[3])
scale = float(argv[4])
south = float(argv[5])
west = float(argv[6])
north = float(argv[7])
east = float(argv[8])

svg = len(argv) == 10

mr = MapRenderer()
mr.setBounds(west, south, east, north)
mr.setSvg(svg)

fh = open(output, 'w')
fh.write(mr.render(width, height, scale))
fh.close