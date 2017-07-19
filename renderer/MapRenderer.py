import mapnik


class MapRenderer:
    def __init__(self, style):
        self.style = style

        # webmercator projection
        self.merc = mapnik.Projection(
            '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +no_defs +over')

        # WGS lat/long source projection of centre
        self.longlat = mapnik.Projection('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')

        self.transform = mapnik.ProjTransform(self.longlat, self.merc)

        self.svg = False

    def setBounds(self, west, south, east, north):
        self.bounds = mapnik.Envelope(west, south, east, north)

    def setSvg(self, doSvg):
        self.svg = doSvg

    def render(self, width, height, scale):
        map = mapnik.Map(width, height)
        mapnik.load_map(map, self.style)
        map.zoom_to_box(self.transform.forward(self.bounds))

        # if svg:
        #     import cairo
        #     surface = cairo.SVGSurface(output, map.width, map.height)
        #     mapnik.render(map, surface, scale, 0, 0)
        #     surface.finish()
        # else:

        image = mapnik.Image(map.width, map.height)
        mapnik.render(map, image, scale, 0, 0)
        return image.tostring('png')
