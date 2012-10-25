/* ---- PALETTE ---- */
/*
@cycleway_fill: #66aae0;
@footway_fill: #77dd88;
@path_fill: @cycleway_fill;
@cycleway_line: spin(darken(@cycleway_fill,25),-10);
@footway_line: spin(darken(@footway_fill,25),-10);
@path_line: spin(darken(@path_fill,25),-10);


.path.line[highway='footway'] {
  [zoom>11] { line-color:@footway_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.path.fill[highway='footway'] {
  [zoom>13]{ line-color:@footway_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}

.path.line[highway='cycleway'] {
  [zoom>11] { line-color:@cycleway_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2.0; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.path.fill[highway='cycleway'] {
  [zoom>13]{ line-color:@cycleway_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}

.path.line[highway='path'] {
  [zoom>11] { line-color:@path_line; line-cap:round; line-join:round; }
  [zoom=12]{ line-width:0.5 }
  [zoom=13]{ line-width:1.0; }
  [zoom=14]{ line-width:2; }
  [zoom=15]{ line-width:3.5; }
  [zoom=16]{ line-width:5.5; }
  [zoom=17]{ line-width:7; }
  [zoom>17]{ line-width:12; }
}
.path.fill[highway='path'] {
  [zoom>13]{ line-color:@path_fill; line-cap:round; line-join:round; }
  [zoom=14]{ line-width:1; }
  [zoom=15]{ line-width:1.5; }
  [zoom=16]{ line-width:3.0; }
  [zoom=17]{ line-width:4; }
  [zoom>17]{ line-width:9; }
}
*/