<?php
/**
 * Google Map shortcode
 */

if ( ! function_exists( 'zozo_vc_google_map_shortcode' ) ) {
	function zozo_vc_google_map_shortcode( $atts, $content = NULL ) {		
		
		$atts = vc_map_get_attributes( 'zozo_vc_google_map', $atts );
		extract( $atts );

		$output = '';
		
		// Classes
		$main_classes = '';
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		$main_classes .= zozo_vc_animation( $css_animation );
		
		$addresses = explode('|', $address);
		
		if( $map_overlay == "true" && $hue_color == '' ) {
			if( zozo_get_theme_option( 'zozo_custom_scheme_color' ) != '' ) {
				$hue_color = zozo_get_theme_option( 'zozo_custom_scheme_color' );
			} else {
				$hue_color = "#FEB600";
			}
		}
		
		if( isset( $saturation ) && $saturation == '' ) {
			$saturation = "80";
		}
		
		if( isset( $lightness ) && $lightness == '' ) {
			$lightness = "-10";
		}
		
		$data_attr = '';
		$data_attr = ' data-type="'. $map_type .'"';
		$data_attr .= ' data-zoom="'. $zoom .'"';
		$data_attr .= ' data-scrollwheel="'. $scroll_wheel .'"';
		$data_attr .= ' data-zoomcontrol="'. $zoom_control .'"';
		if( $map_overlay == "true" ) {
			$data_attr .= ' data-hue="'. $hue_color .'"';
		}
		if( isset( $marker_image ) && $marker_image == '' ) {
			$new_marker_image = ZOZOTHEME_URL . '/images/map-marker.png';
		} else if( isset( $marker_image ) && $marker_image != '' ) {
			$marker_image_id = preg_replace( '/[^\d]/', '', $marker_image );
			$new_marker_image_src = wp_get_attachment_image_src( $marker_image_id, 'full' );
			if ( ! empty( $new_marker_image_src[0] ) ) {
				$new_marker_image = $new_marker_image_src[0];
			}
		}
		$data_attr .= ' data-marker="'. $new_marker_image .'"';
		$data_attr .= ' data-saturation="'. $saturation .'"';
		$data_attr .= ' data-lightness="'. $lightness .'"';
		$data_attr .= ' data-address="'. $addresses[0] .'"';
		$data_attr .= ' data-addresses="'. $address .'"';
		$data_attr .= ' data-title="'. $title .'"';
		$data_attr .= ' data-content="' . str_replace( '"', "'", $info_content ) .'"';
		
		if( isset( $map_width ) && $map_width != '' ) {
			$map_styles = ' style="width: '.$map_width.'; ';
			if( isset( $map_height ) && $map_height != '' ) {
				$map_styles .= 'height: '.$map_height.';"';
			} else {
				$map_styles .= '"';
			}
		}
		
		wp_enqueue_script( 'zozo-gmaps-js' );
		
		$output .= '<div class="gmap-wrapper">';
			$output .= '<div class="gmap_canvas"'. $data_attr .''.$map_styles.'>';
			$output .= '</div>';
		$output .= '</div>';
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_google_map', 'zozo_vc_google_map_shortcode' );

if ( ! function_exists( 'zozo_vc_google_map_shortcode_map' ) ) {
	function zozo_vc_google_map_shortcode_map() {
	
		vc_map( 
			array(
				"name"					=> __( "Google Map", "zozothemes" ),
				"description"			=> __( "Google Map with different options and styles.", 'zozothemes' ),
				"base"					=> "zozo_vc_google_map",
				"category"				=> __( "Theme Addons", "zozothemes" ),
				"icon"					=> "zozo-vc-icon",
				"params"				=> array(					
					array(
						'type'			=> 'textfield',
						'admin_label' 	=> true,
						'heading'		=> __( 'Extra Class', "zozothemes" ),
						'param_name'	=> 'classes',
						'value' 		=> '',
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "CSS Animation", "zozothemes" ),
						"param_name"	=> "css_animation",
						"value"			=> array(
							__( "No", "zozothemes" )					=> '',
							__( "Top to bottom", "zozothemes" )			=> "top-to-bottom",
							__( "Bottom to top", "zozothemes" )			=> "bottom-to-top",
							__( "Left to right", "zozothemes" )			=> "left-to-right",
							__( "Right to left", "zozothemes" )			=> "right-to-left",
							__( "Appear from center", "zozothemes" )	=> "appear" ),
					),
					array(
						"type"			=> 'dropdown',
						'admin_label' 	=> true,
						"heading"		=> __( "Map Type", "zozothemes" ),
						"param_name"	=> "map_type",
						"value"			=> array(
							__( "Roadmap", "zozothemes" )		=> "roadmap",
							__( "Satellite", "zozothemes" )		=> "satellite",
							__( "Hybrid", "zozothemes" )		=> "hybrid",
							__( "Terrain", "zozothemes" )		=> "terrain" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Map Width", "zozothemes" ),
						"param_name"	=> "map_width",
						"value"			=> "100%",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Map Height", "zozothemes" ),
						"param_name"	=> "map_height",
						"value"			=> "376px",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Zoom Level", "zozothemes" ),
						"param_name"	=> "zoom",
						'admin_label' 	=> true,
						"value"			=> "12",
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Map Scrollwheel", "zozothemes" ),
						"param_name"	=> "scroll_wheel",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "true",
							__( "No", "zozothemes" )	=> "false",
						),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Map Zoom Control", "zozothemes" ),
						"param_name"	=> "zoom_control",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "true",
							__( "No", "zozothemes" )	=> "false",
						),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Map Overlay", "zozothemes" ),
						"param_name"	=> "map_overlay",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "true",
							__( "No", "zozothemes" )	=> "false",
						),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Map Overlay Color", "zozothemes" ),
						"param_name"	=> "hue_color",
						"value"			=> "",				
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Saturation", "zozothemes" ),
						"param_name"	=> "saturation",
						"description" 	=> __( "Saturation level 0 to 100", "zozothemes" ),
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Lightness", "zozothemes" ),
						"param_name"	=> "lightness",
						"description" 	=> __( "Lightness level 0 to 100", "zozothemes" ),
						"value"			=> "",
					),
					array(
						"type"			=> "attach_image",
						"heading"		=> __( "Marker Image", "zozothemes" ),
						"param_name"	=> "marker_image",
						"value"			=> "",
					),
					array(
						"type"			=> "textarea",
						"heading"		=> __( "Latitude/ Longtitude", "zozothemes" ),
						"param_name"	=> "address",
						'admin_label' 	=> true,
						"description" 	=> __( "Add latitude/longtitude to show marker on map. To show multiple marker locations on map, to separate latitude/longtitude by using | symbol. <br />Ex: -33.867139, 151.207114|-4.325, 15.322222", "zozothemes" ),
						"value"			=> "-33.867139, 151.207114",
					),
					// Content
					array(
						"type"			=> "exploded_textarea",
						"heading"		=> __( "Title", "zozothemes" ),
						"param_name"	=> "title",
						"value" 		=> 'Title for First Marker,Title for Second Marker',
						"description" 	=> __( "Enter title for each marker position here. Divide titles with linebreaks (Enter).", "zozothemes" ),
						"group"			=> __( "Content", "zozothemes" ),
					),
					array(
						"type"			=> 'textarea',
						"heading"		=> __( "Content", "zozothemes" ),
						"param_name"	=> "info_content",
						"value" 		=> 'Content for First Marker|Content for Second Marker',
						"description" 	=> __( "Enter content for each marker position here. Divide content with | and divide new line with ,", "zozothemes" ),
						"group"			=> __( "Content", "zozothemes" ),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_google_map_shortcode_map' );