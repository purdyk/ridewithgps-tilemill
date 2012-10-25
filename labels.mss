/*@font_reg: "Ubuntu Regular","Arial Regular","DejaVu Sans Book";*/
@font_reg: "DejaVu Sans Book", "unifont Medium";



.parkname[zoom>=13] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#333;
  text-halo-fill:#fff;
  text-halo-radius:2;
  text-halo-radius: 1;
  text-fill: spin(darken(@park_fill, 70), -15);
  text-halo-fill: lighten(@park_fill, 8);
  text-min-distance: 10;
  [zoom=14] { text-size: 11; }
  [zoom>=15] { text-size: 12; }
}

/* ---- HIGHWAY ---- */
.highway-label[zoom>=9] {
  text-face-name:@font_reg;
  text-halo-radius:1;
  text-placement:line;
  text-name:"''";
  text-max-char-angle-delta: 30;
  text-label-position-tolerance: 80;
  text-avoid-edges: true;
  text-allow-overlap: false;
  [highway='motorway'][zoom>=9] {
    text-name:"[name]";
    text-fill:spin(darken(@motorway_fill,70),-15);
    text-halo-fill:lighten(@motorway_fill,8);
    [zoom>=11] { text-size:11; }
    [zoom=13] { text-size:12; }
    [zoom=14] { text-size:13; }
    [zoom>=15] { text-size:14; }
  }

  [highway='primary'][zoom>=11],
  [highway='trunk'][zoom>=11]  {
    text-name:"[name]";
    text-fill:spin(darken(@primary_fill,66),-15);
    text-halo-fill:lighten(@primary_fill,8);
    [zoom=11] { text-size:10; }
    [zoom=12] { text-size:11; }
    [zoom=13] { text-size:12; }
    [zoom=14] { text-size:13; }
    [zoom>=15] { text-size:14; }
  }
  [highway='secondary'][zoom>=11] {
    text-name:"[name]";
    text-fill:spin(darken(@secondary_fill,66),-15);
    text-halo-fill:lighten(@secondary_fill,8);
    [zoom=11] { text-size:10; }
    [zoom=12] { text-size:11; }
    [zoom=13] { text-size:12; }
    [zoom=14] { text-size:13; }
    [zoom>=15] { text-size:14; }
  }
  [highway='road'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@road_fill,66),-15);
    text-halo-fill:lighten(@road_fill,8);
    [zoom=13] { text-size:11; }
    [zoom=14] { text-size:12; }
    [zoom>=15] { text-size:13; }
  }
  [highway='tertiary'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@tertiary_fill,66),-15);
    text-halo-fill:lighten(@tertiary_fill,8);
    [zoom=13] { text-size:11; }
    [zoom=14] { text-size:13; }
    [zoom>=15] { text-size:14; }
  }
    
  [highway='residential'][zoom>=13],
  [highway='unclassified'][zoom>=13] {
    text-name:"[name]";
    text-fill:#444;
    text-halo-fill:#fff;
    [zoom>=13] { text-size: 11; }
    [zoom=15] { text-size:12; }
    [zoom>=16] { text-size:14; }
  }
  
  [highway='cycleway'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@cycleway_fill,40),-15);
    text-halo-fill:lighten(@cycleway_fill,40);
    [zoom=13] { text-size:11; }
    [zoom=14] { text-size:12; }
    [zoom=15] { text-size:12; }
    [zoom>=16] { text-size:13; }
  }
  [highway='footway'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@footway_fill,40),-15);
    text-halo-fill:lighten(@footway_fill,40);
    [zoom=13] { text-size:11; }
    [zoom=14] { text-size:12; }
    [zoom=15] { text-size:12; }
    [zoom>=16] { text-size:13; }
  }
  [highway='path'][zoom>=13] {
    text-name:"[name]";
    text-fill:spin(darken(@path_fill,40),-15);
    text-halo-fill:lighten(@path_fill,40);
    [zoom=13] { text-size:11; }
    [zoom=14] { text-size:12; }
    [zoom=15] { text-size:12; }
    [zoom>=16] { text-size:13; }
  }
}




/* ---- PLACENAMES ---- */

.placename.large[place='state'][zoom>3][zoom<=8],
.placename.large[place='country'][zoom>2][zoom<=7] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#333;
  text-halo-fill:#fff;
  text-halo-radius:2;
  [zoom>=3] { text-size:12; text-halo-radius:1; }
  [zoom=5] { text-size:13; text-halo-radius:1; }
  [zoom=6] { text-size:13; text-halo-radius:1; }
  [zoom=7] { text-size:13; text-halo-radius:1; }
  [zoom=8] { text-size:13; text-halo-radius:1; }
  [zoom=9] { text-size:13; }
  [zoom=10] { text-size:14; text-character-spacing:1; }
  [zoom=11] { text-size:15; text-character-spacing:2; }
  [zoom=12] { text-size:16; text-character-spacing:4; }
  [zoom>=13] { text-size:18; text-character-spacing:6; }
}

.placename.medium[place='city'][zoom>4][zoom<14],
.placename.medium[place='metropolis'][zoom>4][zoom<14] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#333;
  text-halo-fill:#fff;
  text-halo-radius:2;
  /*text-allow-overlap: true;*/
  [zoom=4] { text-size:12; text-halo-radius:1; }
  [zoom=5] { text-size:13; text-halo-radius:1; }
  [zoom=6] { text-size:13; text-halo-radius:1; }
  [zoom=7] { text-size:13; text-halo-radius:1; }
  [zoom=8] { text-size:13; text-halo-radius:1; }
  [zoom=9] { text-size:13; }
  [zoom=10] { text-size:14; text-character-spacing:1; }
  [zoom=11] { text-size:15; text-character-spacing:2; }
  [zoom=12] { text-size:16; text-character-spacing:4; }
  [zoom>=13] { text-size:18; text-character-spacing:6; }
}

.placename.medium[place='large_town'][zoom>6][zoom<16],
.placename.medium[place='town'][zoom>7][zoom<16],
.placename.medium[place='small_town'][zoom>7][zoom<16] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#333;
  text-halo-fill:#fff;
  text-halo-radius:2;
  [zoom=7] { text-size:10; text-halo-radius:1; }
  [zoom=8] { text-size:10; text-halo-radius:1; }
  [zoom=9] { text-size:11; text-halo-radius:1; }
  [zoom=10] { text-size:11; text-halo-radius:1; }
  [zoom=11] { text-size:13; }
  [zoom=12] { text-size:14; }
  [zoom=13] { text-size:14; text-character-spacing:1; }
  [zoom=14] { text-size:15; text-character-spacing:2; }
  [zoom=15] { text-size:16; text-character-spacing:4; }
  [zoom>=16] { text-size:18; text-character-spacing:6; }
}

.placename.small[place='village'][zoom>9][zoom<16],
.placename.small[place='hamlet'][zoom>9][zoom<16],
.placename.small[place='suburb'][zoom>10] {
  text-face-name:@font_reg;
  text-name:"[name]";
  text-fill:#444;
  text-halo-fill:#fff;
  text-halo-radius:2;
  [zoom=10] { text-size:10; text-halo-radius:1; }
  [zoom=11] { text-size:10; }
  [zoom=12] { text-size:11; }
  [zoom=13] { text-size:12; text-character-spacing:1; }
  [zoom=14] { text-size:13; text-character-spacing:2; }
  [zoom=15] { text-size:14; text-character-spacing:4; }
  [zoom>=16] { text-size:16; text-character-spacing:6; }
}