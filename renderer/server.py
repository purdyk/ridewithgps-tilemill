#!/usr/bin/env python

from flask import Flask
from flask import Response
from flask import request
from flask import render_template

from MapRenderer import MapRenderer

app = Flask(__name__)


@app.route("/")
def root():
    return render_template('root.html')

@app.route("/output.png")
def output():
    north = float(request.args.get('north', 1.0))
    south = float(request.args.get('south', -1.0))
    east = float(request.args.get('east', -1.0))
    west = float(request.args.get('west', 1.0))
    width = int(float(request.args.get('width', 1024)))
    height = int(float(request.args.get('height', 1024)))
    svg = bool(request.args.get('svg', False))
    scale = float(request.args.get('scale', 1.0))
    save = bool(request.args.get('save', False))

    mr = MapRenderer()
    mr.setBounds(west, south, east, north)
    mr.setSvg(svg)

    headers = {'Content-Type': 'image/png'}

    if save:
        headers = {
            'Content-Type': 'application/octet-stream',
            'Content-Disposition': 'attachment; filename="output.png"'
        }

    return Response(mr.render(width, height, scale), headers=headers)


if __name__ == "__main__":
    app.run()
