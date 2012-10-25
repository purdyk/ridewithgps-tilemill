/* ---- PALETTE ---- */

@motorway_fill: #a8bae0; /*#93b5d9;*/
@motorway_line: spin(darken(@motorway_fill,25),-10);
@primary_fill:  #fcf7bd;
@primary_line:  spin(darken(@primary_fill,25),-10);
@trunk_fill:    @primary_fill;
@trunk_line:    @primary_line;
@secondary_fill:@primary_fill;
@secondary_line:@primary_line;
@road_fill:     #fff;
@road_line:     #bbb;
@tertiary_fill: #fff;
@access_fill:   @road_fill;
@access_line:   @road_line;
@track:         @road;
@footway:       #6B9;
@cycleway:      #69B;
@rail:          #999;


@cycleway_fill: #66aae0;
@footway_fill: #77dd88;
@path_fill: @cycleway_fill;
@cycleway_line: spin(darken(@cycleway_fill,25),-10);
@footway_line: spin(darken(@footway_fill,25),-10);
@path_line: spin(darken(@path_fill,25),-10);


.route.line[highway='footway'] {
  [zoom>11] { line-color:@footway_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.route.fill[highway='footway'] {
  [zoom>13]{ line-color:lighten(@footway_fill, 25); line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}

.route.line[highway='cycleway'] {
  [zoom>11] { line-color:@cycleway_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.route.fill[highway='cycleway'] {
  [zoom>13]{ line-color:lighten(@cycleway_fill, 25); line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}

.route.line[highway='path'] {
  [zoom>11] { line-color:@path_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.route.fill[highway='path'] {
  [zoom>13]{ line-color:lighten(@path_fill, 25); line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}

.highway-label {
  [zoom>=9][highway='trunk'],
  [zoom>=9][highway='primary'],
  [zoom>=7][highway='motorway'] {
    shield-name: "[ref]";
    shield-face-name: @font_reg;
    shield-avoid-edges: true;
    shield-min-distance: 80;
    shield-size: 10;
    shield-fill: #000;
    shield-file: url(./res/horizontal-shield.png);
    [ref_length=2] {
      shield-file: url(./res/horizontal-shield-2.png);
    }
    [ref_length=3] {
      shield-file: url(./res/horizontal-shield-3.png);
    }
    [ref_length=4] {
      shield-file: url(./res/horizontal-shield-4.png);
    }
    [ref_length=5] {
      shield-file: url(./res/horizontal-shield-5.png);
    }
    [ref_length=6] {
      shield-file: url(./res/horizontal-shield-6.png);
    }
    [ref_length=7] {
      shield-file: url(./res/horizontal-shield-7.png);
    }
    [ref_length=8] {
      shield-file: url(./res/horizontal-shield-8.png);
    }
    [ref_length=9] {
      shield-file: url(./res/horizontal-shield-9.png);
    }
    [highway='motorway'][zoom>=7][zoom<=10] {
      shield-min-distance: 90;
    }
  }
}



/* ---- ROADS ---- */

/* Service/Access */
.route.line[highway='service'] {
  [zoom>12]{ line-color:@access_line; line-cap:square; line-join:round; }
  [zoom=13]{ line-width:0.2; line-opacity:0.4; }
  [zoom=14]{ line-width:0.4; line-opacity:0.6; }
  [zoom=15]{ line-width:1; line-opacity:0.8; }
  [zoom=16]{ line-width:1.6 + 2; }
  [zoom=17]{ line-width:4 + 2; }
  [zoom>17]{ line-width:7 + 3; }
}
.route.fill[highway='service'] {
  [zoom>15]{ line-color:@access_fill; line-cap:square; line-join:round; }
  [zoom=16]{ line-width:1.6; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:7; }
}

/* Motorway Links */
.route.line[highway='motorway_link'][tunnel='no'],
.route.tunnel[highway='motorway_link'] {
  [zoom>9] { line-color:@motorway_line; line-cap:round; line-join:round; }
  .tunnel[zoom>11] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}
.route.fill[highway='motorway_link'] {
  [zoom>11]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Trunk Links */
.route.line[highway='trunk_link'][tunnel='no'],
.route.tunnel[highway='trunk_link'] {
  [zoom>9] { line-color:@trunk_line; line-cap:round; line-join:round; }
  .tunnel[zoom>11] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}

.route.fill[highway='trunk_link'] {
  [zoom>11]{ line-color:@trunk_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@trunk_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Primary Links */
.route.line[highway='primary_link'][tunnel='no'],
.route.tunnel[highway='primary_link'] {
  [zoom>9] { line-color:@primary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>11] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.8; }
  [zoom=11]{ line-width:1; }
  [zoom=12]{ line-width:1.0 + 2; }
  [zoom=13]{ line-width:1.2 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}

.route.fill[highway='primary_link'] {
  [zoom>11]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Secondary Links */
.route.line[highway='secondary_link'][tunnel='no'],
.route.tunnel[highway='secondary_link'] {
  [zoom>9] { line-color:@secondary_line; line-cap:round; line-join:round; }
  .tunnel[zoom>12] { line-dasharray:4,2; line-cap:butt; }
  .tunnel[zoom>13]{ line-dasharray:6,2; }
  [zoom=10]{ line-width:0.6; }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:0.9 + 1.8; }
  [zoom=13]{ line-width:1.0 + 2; }
  [zoom=14]{ line-width:2 + 2; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:5 + 2.5; }
  [zoom=17]{ line-width:6 + 2.5; }
  [zoom>17]{ line-width:14 + 2.5; }
}

.route.fill[highway='secondary_link'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>12][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5; }
  [zoom=17]{ line-width:6; }
  [zoom>17]{ line-width:14; }
}

/* Standard/Unknown */
.route.line[highway='living_street'],
.route.line[highway='residential'],
.route.line[highway='unclassified'] {
  [zoom>10]{ line-color:@road_line; line-cap:round; line-join:round; }
  [zoom=11]{ line-width:0.6; line-opacity:0.6; }
  [zoom=12]{ line-width:0.6; line-opacity:0.6; }
  [zoom=13]{ line-width:0.8; }
  [zoom=14]{ line-width:1.0 + 1.8; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:6 + 2; }
  [zoom=17]{ line-width:8 + 2; }
  [zoom>17]{ line-width:10 + 3; }
}

.route.line[highway='road'] {
  [zoom>9]{ line-color:@road_line; line-cap:round; line-join:round; }
  [zoom=10]{ line-width:0.6; line-opacity:0.6; }
  [zoom=11]{ line-width:0.6; line-opacity:0.6; }
  [zoom=12]{ line-width:0.6; line-opacity:0.6; }
  [zoom=13]{ line-width:0.8; }
  [zoom=14]{ line-width:1.0 + 1.8; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:6 + 2; }
  [zoom=17]{ line-width:8 + 2; }
  [zoom>17]{ line-width:10 + 3; }
}

.route.line[highway='tertiary'],
.route.line[highway='tertiary_link'] {
  [zoom>9] { line-color:@road_line; line-cap:round; line-join:round; }
  [zoom=10]{ line-width:0.6; line-opacity:0.8; }
  [zoom=11]{ line-width:0.8; line-opacity:0.8; }
  [zoom=12]{ line-width:1.0; line-opacity:0.8; }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:1.0 + 1.8; }
  [zoom=15]{ line-width:3.5 + 2; }
  [zoom=16]{ line-width:6 + 2; }
  [zoom=17]{ line-width:8 + 2; }
  [zoom>17]{ line-width:10 + 3; }
}

.route.fill[highway='living_street'],
.route.fill[highway='residential'],
.route.fill[highway='road'],
.route.fill[highway='tertiary'],
.route.fill[highway='tertiary_link'],
.route.fill[highway='unclassified'] {
  [zoom>13]{ line-color:@road_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:6; }
  [zoom=17]{ line-width:8; }
  [zoom>17]{ line-width:10; }
}

/* Secondary */
.route.line[highway='secondary'][tunnel='no'],
.route.tunnel[highway='secondary'] {
  [zoom>9] { line-color:@road_line; line-cap:round; line-join:round; }
  .tunnel[zoom>12] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }
  [zoom=10]{ line-width:1.0; }
  [zoom>10]{ line-color:@secondary_line; }
  [zoom=11]{ line-width:2.0; }
  [zoom=12]{ line-width:3.0; }
  [zoom=13]{ line-width:3.2; }
  [zoom=14]{ line-width:4.6; }
  [zoom=15]{ line-width:6.0; }
  [zoom=16]{ line-width:8.5; }
  [zoom=17]{ line-width:11.0; }
  [zoom>17]{ line-width:19.0; }
}

.route.fill[highway='secondary'] {
  [zoom>11]{ line-color:@secondary_fill; line-cap:round; line-join:round; }
  [zoom>12][tunnel='yes'] { line-color:lighten(@secondary_fill,10); }
  [zoom=12]{ line-width:0.9; }
  [zoom=13]{ line-width:1.2; }
  [zoom=14]{ line-width:2.6; }
  [zoom=15]{ line-width:4; }
  [zoom=16]{ line-width:6; }
  [zoom=17]{ line-width:8; }
  [zoom>17]{ line-width:16; }
}

.route.line[highway='primary'][tunnel='no'] {
  [zoom>6] { line-color:@primary_line; line-cap:round; line-join:round; }
  [zoom=7] { line-width:1.0; line-opacity:0.7; }
  [zoom=8] { line-width:1.0; line-opacity:0.7; }
  [zoom=9] { line-width:2.0; line-opacity:0.7; }
  [zoom=10]{ line-width:2.2; }
  [zoom=11]{ line-width:2.8; }
  [zoom=12]{ line-width:3.0; }
  [zoom=13]{ line-width:3.4; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:5 + 2; }
  [zoom=16]{ line-width:7 + 2.5; }
  [zoom=17]{ line-width:9 + 3; }
  [zoom>17]{ line-width:18 + 3; }
}

/* Primary and trunk */
.route.line[highway='trunk'][tunnel='no'] {
  [zoom>7] { line-color:@primary_line; line-cap:round; line-join:round; }
  [zoom=8] { line-width:1.0; line-opacity:0.7; }
  [zoom=9] { line-width:2.0; line-opacity:0.7; }
  [zoom=10]{ line-width:2.2; }
  [zoom=11]{ line-width:2.8; }
  [zoom=12]{ line-width:3.0; }
  [zoom=13]{ line-width:3.4; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:5 + 2; }
  [zoom=16]{ line-width:7 + 2.5; }
  [zoom=17]{ line-width:9 + 3; }
  [zoom>17]{ line-width:18 + 3; }
}

.route.tunnel[highway='primary'],
.route.tunnel[highway='trunk'] {
  [zoom>12] { line-dasharray:2,1; line-cap:butt; }
  [zoom=13]{ line-dasharray:4,2; }
  [zoom=14]{ line-dasharray:6,2; }
  [zoom=15]{ line-dasharray:8,2; }
  [zoom>15]{ line-dasharray:10,2; }
}

.route.fill[highway='primary'],
.route.fill[highway='trunk'] {
  [zoom>10]{ line-color:@primary_fill; line-cap:round; line-join:round; }
  [zoom>12][tunnel='yes'] { line-color:lighten(@primary_fill,10); }
  [zoom=11]{ line-width:0.8; }
  [zoom=12]{ line-width:1.0; }
  [zoom=13]{ line-width:1.4; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:5; }
  [zoom=16]{ line-width:7; }
  [zoom=17]{ line-width:9; }
  [zoom>17]{ line-width:18; }
}

/* Motorway */
.route.line[highway='motorway'][tunnel='no'],
.route.tunnel[highway='motorway'] {
  [zoom>4] { line-color:@motorway_line; line-cap:round; line-join:round; }
  .tunnel[zoom>11] { line-dasharray:2,1; line-cap:butt; }
  .tunnel[zoom=13]{ line-dasharray:4,2; }
  .tunnel[zoom=14]{ line-dasharray:6,2; }
  .tunnel[zoom=15]{ line-dasharray:8,2; }
  .tunnel[zoom>15]{ line-dasharray:10,2; }
  [zoom=5] { line-width:1.0; line-opacity: 0.8; }
  [zoom=6] { line-width:1.3; line-opacity: 0.8; }
  [zoom=7] { line-width:2.5; }
  [zoom=8] { line-width:2.5; }
  [zoom=9] { line-width:2.5; }
  [zoom=10]{ line-width:2.5; }
  [zoom=11]{ line-width:3.3; }
  [zoom=12]{ line-width:3.5; }
  [zoom=13]{ line-width:2 + 2; }
  [zoom=14]{ line-width:3 + 2; }
  [zoom=15]{ line-width:6 + 2; }
  [zoom=16]{ line-width:8 + 2.5; }
  [zoom=17]{ line-width:10 + 3; }
  [zoom>17]{ line-width:20 + 3; }
}

.route.fill[highway='motorway'] {
  [zoom>6]{ line-color:@motorway_fill; line-cap:round; line-join:round; }
  [zoom>11][tunnel='yes'] { line-color:lighten(@motorway_fill,10); }
  [zoom>=7]{ line-width:1.0; }
  [zoom>=11]{ line-width:1.0; }
  [zoom=13]{ line-width:2; }
  [zoom=14]{ line-width:3; }
  [zoom=15]{ line-width:6; }
  [zoom=16]{ line-width:8; }
  [zoom=17]{ line-width:10; }
  [zoom>17]{ line-width:20; }
}

/* ---- TURNING CIRCLES ---- */

.turning-circle[zoom>=14] {
  marker-fill:@road_fill;
  marker-line-color:@road_line;
  marker-line-width:1;
  [zoom=14] { marker-width: 2; }
  [zoom=15] { marker-width: 4; }
  [zoom=16] { marker-width: 7; }
  [zoom=17] { marker-width: 9; }
  [zoom>17] { marker-width: 12; marker-line-width: 1.5; }
}

/* ---- ONE WAY ARROWS ---- */
/* TODO: oneway='-1' */
.highway-label::arrow[oneway='yes'][zoom>15] {
  marker-type:arrow;
  marker-line-width:1;
  marker-line-opacity:0.5;
  marker-line-color:#fff;
  marker-spacing: 300;
  marker-fill:darken(@motorway_line,10);
  marker-opacity:0.8;
  [zoom=16] {
    marker-transform:"scale(0)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(0.8)"; }
  }
  [zoom=17] {
    marker-transform:"scale(0.8)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(0.9)"; }
  }
  [zoom>17] {
    marker-transform:"scale(1)";
    [highway='motorway'],
    [highway='trunk'],
    [highway='primary'],
    [highway='secondary'] { marker-transform:"scale(1.2)"; }
  }
}

/* ---- AERO ---- */
.aero.poly[zoom>13] {
  line-color:lighten(@road_line,5);
  polygon-fill:lighten(#fff,10);
}

.route.line[aeroway='runway'][zoom>=11],
.route.line[aeroway='taxiway'][zoom>=11] {
  line-cap: square;
  line-color: lighten(@road_line,5);
}
.route.fill[aeroway='runway'][zoom>=12],
.route.fill[aeroway='taxiway'][zoom>=12] {
  line-cap: square;
  line-color: lighten(#fff,10);
}

.route.line[aeroway='runway'] {
  [zoom=11] { line-width: 2; }
  [zoom=12] { line-width: 1 + 2; }
  [zoom=13] { line-width: 3 + 2; }
  [zoom=14] { line-width: 9 + 2; }
  [zoom=15] { line-width: 16 + 2; }
  [zoom=16] { line-width: 22 + 2; }
  [zoom=17] { line-width: 28 + 2; }
  [zoom>17] { line-width: 34 + 2; }
}

.route.fill[aeroway='runway'] {
  [zoom=12] { line-width: 1; }
  [zoom=13] { line-width: 3; }
  [zoom=14] { line-width: 9; }
  [zoom=15] { line-width: 16; }
  [zoom=16] { line-width: 22; }
  [zoom=17] { line-width: 28; }
  [zoom>17] { line-width: 34; }
}

.route.line[aeroway='taxiway'] {
  [zoom=11] { line-width: 1; }
  [zoom=12] { line-width: 0.8 + 1.8; }
  [zoom=13] { line-width: 1 + 2; }
  [zoom=14] { line-width: 2 + 2; }
  [zoom=15] { line-width: 6 + 2; }
  [zoom=16] { line-width: 10 + 2; }
  [zoom=17] { line-width: 10 + 2; }
  [zoom>17] { line-width: 14 + 2; }
}

.route.fill[aeroway='taxiway'] {
  [zoom=12] { line-width: 0.8; }
  [zoom=13] { line-width: 1; }
  [zoom=14] { line-width: 2; }
  [zoom=15] { line-width: 6; }
  [zoom=16] { line-width: 10; }
  [zoom=17] { line-width: 10; }
  [zoom>17] { line-width: 14; }
}

/* ---- PARKING ---- */
.parking[zoom>13] {
  polygon-fill:lighten(@land,3);
  line-color:darken(@land,6);
  [zoom=14] { line-width:0.4; }
  [zoom=15] { line-width:0.6; }
  [zoom>15] { line-width:0.8; }
}

/* ---- RAILWAYS ---- */
.route.fill[railway='rail'][zoom>10] {
  line-color:@rail;
  line-width:0.3;
  line-dasharray:4,3;
  ::x {
    line-color:lighten(@rail,10);
    line-dasharray:0,4,3,0;
    line-width:0.3;
  }
  [zoom=13], ::x[zoom<14] { line-width:0.4; }
  [zoom=14], ::x[zoom=14] { line-width:0.5; }
  [zoom=15], ::x[zoom=15] { line-width:0.6; }
  [zoom=16], ::x[zoom=16] { line-width:0.8; }
  [zoom=17], ::x[zoom=17] { line-width:1.5; }
  [zoom=18], ::x[zoom=18] { line-width:2.0; }
}
