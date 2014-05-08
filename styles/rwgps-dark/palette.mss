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
Map { buffer-size: 256; background-color: @water; }

/* set up font sets for various weights and styles */
@sans_lt:           "Roboto Light", "unifont Medium";
@sans_lt_italic:    "Roboto Light Italic", "unifont Medium";
@sans:              "Roboto Medium", "unifont Medium";
@sans_italic:       "Roboto Medium Italic", "unifont Medium";
@sans_bold:         "Roboto Bold", "unifont Medium";
@sans_bold_italic:  "Roboto Bold Italic", "unifont Medium";


/* Some fonts are larger or smaller than others. Use this variable to
   globally increase or decrease the font sizes. */
/* Note this is only implemented for certain things so far */
@text_adjust: 0;

/* ================================================================== */
/* LANDUSE & LANDCOVER COLORS
/* ================================================================== */

@water:     		#111;
@land:      		#333;
@forest:    		#222;
@agriculture: 		lighten(@forest,2);
@grass:     		lighten(@forest,5);
@park:      		lighten(@forest,10);
@beach:     		#282828;
@building:  		#444;


@cemetery:          @park;
@wooded:            @forest;

@hospital:          #755654;
@school:            @park;
@sports:            @park;

@residential:       @land * 0.98;
@commercial:        @land * 0.97;
@industrial:        @land * 0.96;
@parking:           #454545;

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

@motorway_fill: 	#555;
@motorway_line: 	spin(darken(@motorway_fill,25),-10);
@motorway_case:     @motorway_line * 0.9;

@primary_fill:  	@motorway_fill;
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
@standard_fill:     #555;
@standard_case:     @land * 0.9;

@pedestrian_fill:   #666;
@pedestrian_line:   @standard_line;
@pedestrian_case:   @land;

@cycle_fill: 		#666;
@cycle_line: 		spin(darken(@cycle_fill,25),-10);
@cycle_case:   		@land;

@foot_fill: 		@cycle_fill;
@foot_line: 		spin(darken(@foot_fill,25),-10);
@foot_case:   		@land;

@path_fill: 		@foot_fill;
@path_line: 		spin(darken(@path_fill,25),-10);
@path_case:   		@land;

@rail_line:         #555;
@rail_fill:         #666;
@rail_case:         @land;

@aeroway:           #555;

/* ================================================================== */
/* BOUNDARY COLORS
/* ================================================================== */

@admin_2:           #324;

/* ================================================================== */
/* LABEL COLORS
/* ================================================================== */

/* We set up a default halo color for places so you can edit them all
   at once or override each individually. */
@place_halo:        fadeout(#111,25%);

@country_text:      #999;
@country_halo:      @place_halo;

@state_text:        @country_text;
@state_halo:        @place_halo;

@city_text:         @country_text;
@city_halo:         @place_halo;

@town_text:         @country_text;
@town_halo:         @place_halo;

@poi_text:          @country_text;

@road_text:         @country_text;
@road_halo:         @place_halo;

@cycle_halo: 		fadeout(#111,25%);
@cycle_text: 		#aaa;
@foot_halo: 		@cycle_halo;
@foot_text: 		@cycle_text;
@pedestrian_halo: 	@cycle_halo;
@pedestrian_text: 	@cycle_text;
@path_halo: 		@cycle_halo;
@path_text: 		@cycle_text;

@other_text:        @town_text;
@other_halo:        @place_halo;

@locality_text:     @town_text;
@locality_halo:     @place_halo;

/* Also used for other small places: hamlets, suburbs, localities */
@village_text:      @town_text;
@village_halo:      @place_halo;

/* ****************************************************************** */



