/*

OPEN STREETS
============

A TileMill map style for OpenStreetMap. For PostGIS databases created 
by osm2pgsql with a default style file, or style that is compatible 
with the default.

Use the included `configure.py` script to customize your database and
extent settings. See the README for more info.

<http://github.com/mapbox/open-streets-style>

*/

/* ---- PALETTE ---- */

@water:     #c0d8ff;
@land:      #f4f6f0;
@forest:    #c7e6a8;
@agriculture:#f4f0e0;
@grass:     lighten(@forest,5);
@park:      lighten(@forest,10);
@beach:     #ffeec7;
@building:  darken(#e8e4e4,8);

/* ---- NATURAL & LANDUSE ---- */

Map { background-color: @water; buffer-size: 128;}

#world[zoom<6],
#shoreline_300[zoom>=6][zoom<10],
#processed_p[zoom>=10] {
  polygon-fill: @land;
}

#ne-lakes[zoom<6],
.water[zoom>5] {
  polygon-fill:@water;
  polygon-gamma:0.8;
}
.water-outline[zoom>11] {
  line-color:darken(@water,10);
  [zoom=12] { line-width:0.8; }
  [zoom=13] { line-width:1.2; }
  [zoom=14] { line-width:1.4; }
  [zoom=15] { line-width:1.6; }
  [zoom=16] { line-width:1.8; }
  [zoom>16] { line-width:2; }
}

.wetland[zoom>10] {
  polygon-pattern-file:url(./res/wetland-8.png);
  [zoom>13] { polygon-pattern-file:url(./res/wetland-16.png); }
  [zoom>15] { polygon-pattern-file:url(./res/wetland-32.png); }
  polygon-pattern-alignment: global;
}

.forest[zoom>2][size='huge'],
.forest[zoom>4][size='large'],
.forest[zoom>7][size='medium'],
.forest[zoom>9][size='small'] {
  /* At lower zoom levels forests are dense and distracting. 
     Ramp them in gradually. */
  [zoom>=2] { polygon-fill:lighten(@forest,9); }
  [zoom>=4]{ polygon-fill:lighten(@forest,6); }
  [zoom>=8]{ polygon-fill:lighten(@forest,3); }
  [zoom>11] { polygon-fill:@forest; }
  [zoom>=9] {
    line-color: darken(@forest, 20);
    line-width: 0.5;
  }
  /* These outlines create a slight faux-blur effect. */
  [zoom>14] {
    line-color:@forest;
    line-opacity:0.4;
    line-join:round; }
  [zoom=15] { line-width:1.6; }
  [zoom=16] { line-width:2.6; }
  [zoom=17] { line-width:3.6; }
  [zoom>=18] { line-width:4.6; }
  /* a second outline for addtional blur */
  ::xtra {
    [zoom>16] {
      line-color:@forest;
      line-opacity:0.2;
      line-join:round; }
    [zoom=17] { line-width:7; }
    [zoom>=18] { line-width:9; }
  }
}

.agriculture[zoom>9] {
  polygon-fill:@agriculture;
}

.beach[zoom>9] {
  polygon-fill:@beach;
}

.grass[zoom>9][size='huge'],
.grass[zoom>10][size='large'],
.grass[zoom>11][size='medium'],
.grass[zoom>12][size='small'] {
  /* lighten relative to forest ramping */
  [zoom=10]{ polygon-fill:lighten(@grass,6); }
  [zoom=11]{ polygon-fill:lighten(@grass,3); }
  polygon-fill:@grass;
}

.park[zoom>9] {
  polygon-fill:@park;
  [zoom>13] { line-color:darken(@park,20); }
  [zoom=14] { line-width:0.6; }
  [zoom=15] { line-width:0.8; }
  [zoom>15] { line-width:1.2; }
}

/* ---- CAMPUSES ---- */
/* Note that amenity=school, amenity=hospital, etc are ideally polygons of the
   *campus*, but are occasionally applied to the physical building instead. */
@campus: #ECF;
.campus[zoom>10] {
  polygon-opacity:0.2;
  polygon-fill:@campus;
  [zoom>12] {
    line-opacity:0.4;
    line-color:spin(darken(@campus,20),20);
  }
  [zoom=13] { line-width:0.3; }
  [zoom=14] { line-width:0.5; }
  [zoom=15] { line-width:0.7; }
  [zoom=16] { line-width:0.8; }
  [zoom=17] { line-width:0.9; }
  [zoom=18] { line-width:1.0; }
}