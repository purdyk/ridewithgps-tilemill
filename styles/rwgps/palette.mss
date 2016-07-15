/* ****************************************************************** */
/* OSM BRIGHT for Imposm                                              */
/* ****************************************************************** */

/* For basic style customization you can simply edit the colors and
 * fonts defined in this file. For more detailed / advanced
 * adjustments explore the other files.
 *
 * GENERAL NOTES
 *
 * There is a slight performance cost in rendering line-caps.  An
 * effort has been made to restrict line-cap definitions to styles
 * where the results will be visible (lines at least 2 pixels thick).
 */

/* ================================================================== */
/* FONTS
/* ================================================================== */

/* directory to load fonts from in addition to the system directories */
Map { font-directory: url(./fonts); buffer-size: 256; background-color: @water; }

/* set up font sets for various weights and styles */
@sans_lt:           "Open Sans Light", "unifont Medium";
@sans_lt_italic:    "Open Sans Light Italic", "unifont Medium";
@sans:              "Open Sans Regular", "unifont Medium";
@sans_italic:       "Open Sans Italic", "unifont Medium";
@sans_bold:         "Open Sans Bold", "unifont Medium";
@sans_bold_italic:  "Open Sans Bold Italic", "unifont Medium";


/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@water:     		#c0d8ff;
@land:      		#f4f6f0;
@forest:    		#c7e6a8;
@agriculture: 		#f4f0e0;
@grass:     		lighten(@forest,5);
@park:      		lighten(@forest,10);
@beach:     		#ffeec7;
@building:  		#e8e4e4;


@cemetery:          #D6DED2;
@wooded:            #C3D9AD;

@hospital:          rgb(229,198,195);
@school:            #FFF5CC;
@sports:            #B8E6B8;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #EEE;

/* ================================================================== */
/* ROAD COLORS
/* ================================================================== */

/* For each class of road there are three color variables:
 * - line: for lower zoomlevels when the road is represented by a
 *         single solid line.
 * - case: for higher zoomlevels, this color is for the road's
 *         casing (outline).
 * - fill: for higher zoomlevels, this color is for the road's
 *         inner fill (inline).
 */

@motorway_fill: 	#a8bae0;
@motorway_line: 	spin(darken(@motorway_fill,25),-10);
@motorway_case:     @motorway_line * 0.9;

@primary_fill:  	#fcf7bd;
@primary_line:  	spin(darken(@primary_fill,25),-10);
@primary_case:      @primary_line * 0.9;

@trunk_fill:    	@primary_fill;
@trunk_line:    	spin(darken(@trunk_fill,25),-10);
@trunk_case:        @trunk_line * 0.9;

@secondary_fill: 	@primary_fill;
@secondary_line: 	spin(darken(@secondary_fill,25),-10);
@secondary_case:    @secondary_line * 0.9;

@tertiary_fill: 	@secondary_fill;
@tertiary_line: 	spin(darken(@tertiary_fill,25),-10);
@tertiary_case: 	@tertiary_line * 0.9;

@standard_line:     @land * 0.85;
@standard_fill:     #fff;
@standard_case:     @land * 0.9;

@pedestrian_fill:   #FAFAF5;
@pedestrian_line:   @standard_line;
@pedestrian_case:   @land;

/*
@foot_line:   		#77dd88;
@foot_fill:   		lighten(@foot_line,25);
@foot_case:   		@land;

@cycle_line:        #66aae0;
@cycle_fill:        lighten(@cycle_line,25);
@cycle_case:        @land;
*/

@cycle_fill: 		#66aae0;
@cycle_line: 		spin(darken(@cycle_fill,25),-10);
@cycle_case:   		@land;

@foot_fill: 		#77dd88;
@foot_line: 		spin(darken(@foot_fill,25),-10);
@foot_case:   		@land;

@path_fill: 		@foot_fill;
@path_line: 		spin(darken(@path_fill,25),-10);
@path_case:   		@land;

@rail_line:         #999;
@rail_fill:         #fff;
@rail_case:         @land;

@aeroway:           #ddd;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#fff,15%);

@country_text:      #435;
@country_halo:      @place_halo;

@state_text:        #546;
@state_halo:        @place_halo;

@city_text:         #555;
@city_halo:         @place_halo;

@town_text:         #666;
@town_halo:         @place_halo;

@poi_text:          #888;

@road_text:         #777;
@road_halo:         #fff;

@cycle_halo: 		lighten(@cycle_fill, 25);
@cycle_text: 		spin(darken(@cycle_fill, 40), -15);
@foot_halo: 		lighten(@foot_fill, 25);
@foot_text: 		spin(darken(@foot_fill, 40), -15);
@pedestrian_halo: 	lighten(@pedestrian_fill, 25);
@pedestrian_text: 	spin(darken(@pedestrian_fill, 40), -15);
@path_halo: 		lighten(@path_fill, 25);
@path_text: 		spin(darken(@path_fill, 40), -15);

@other_text:        #888;
@other_halo:        @place_halo;

@locality_text:     #aaa;
@locality_halo:     @land;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      #888;
@village_halo:      @place_halo;

/* ****************************************************************** */



