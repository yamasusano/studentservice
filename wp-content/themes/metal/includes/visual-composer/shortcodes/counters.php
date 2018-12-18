<?php 
/**
 * Counters shortcode
 */

if ( ! function_exists( 'zozo_vc_counters_shortcode' ) ) {
	function zozo_vc_counters_shortcode( $atts, $content = NULL ) {

		$atts = vc_map_get_attributes( 'zozo_vc_counters', $atts );
		extract( $atts );

		$output = '';
		$extra_class = '';
		static $counter_id = 1;

		// Icon style		
		$icon_style = '';
		if( $icon_color ) {
			$icon_style .= 'color:'. $icon_color .';';
		}
		if( $icon_font_size ) {
			$icon_style .= 'font-size:'. $icon_font_size .';';
		}
		if( $icon_line_height ) {
			$icon_style .= 'line-height:'. $icon_line_height .';';
		}
		if( $icon_style ) {
			$icon_style = ' style="'. $icon_style  .'"';
		}
		
		// Counter style
		if( isset( $counter_value ) && $counter_value != '' ) {
			$counter_styles = '';
			if ( $counter_color ) {
				$counter_styles .= 'color:'. $counter_color.';';
			}
			if ( $counter_styles ) {
				$counter_styles = ' style="'. $counter_styles .'"';
			}
		}
		
		// Title style
		if( isset( $counter_title ) && $counter_title != '' ) {
			$title_style = '';
			if ( $title_color ) {
				$title_style .= 'color:'. $title_color.';';
			}
			if ( $title_style ) {
				$title_style = ' style="'. $title_style .'"';
			}
		}
		
		// Classes
		$main_classes = 'zozo-counter-wrapper';
		
		$main_classes .= ' counter-' . $counter_style;
		$main_classes .= ' counter-icon-' . $icon_position;
		
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		
		$main_classes .= zozo_vc_animation( $css_animation );
		
		$output .= '<div id="zozo-counter-'.$counter_id.'" class="'. esc_attr( $main_classes ) .'">';
			$output .= '<div class="counter-item zozo-counter">';
				
				// Icon
				if( isset( ${'icon_'. $type} ) && ${'icon_'. $type} != '' ) {
					if( isset( $icon_position ) && ( $icon_position == 'top' || $icon_position == 'left' ) ) {
						$output .= '<div class="counter-icon">';
							$output .= '<i class="'. esc_attr( ${'icon_'. $type} ) .'"'.$icon_style.'></i>';
						$output .= '</div>';
					}
				}
				
				// Content						
				if( isset( $counter_value ) && $counter_value != '' ) {
					$output .= '<div class="counter-info">';
						$output .= '<div class="zozo-count-number" data-count="'.$counter_value.'">';
							$output .= '<h3 class="counter zozo-counter-count"'.$counter_styles.'>0</h3>';		
						$output .= '</div>';
						$output .= '<div class="counter-title">';
							if( isset( $counter_title ) && $counter_title != '' ) {
								$output .= '<h3'.$title_style.'>' . esc_html( $counter_title );
								if( isset( $counter_subtitle ) && $counter_subtitle != '' ) {
									$output .= ' <span>' . esc_html( $counter_subtitle ).'</span>';
								}
								$output .= '</h3>';
							}
						$output .= '</div>';
					$output .= '</div>';
				}
				
				// Icon
				if( isset( ${'icon_'. $type} ) && ${'icon_'. $type} != '' ) {
					if( isset( $icon_position ) && $icon_position == 'bottom' ) {
						$output .= '<div class="counter-icon">';
							$output .= '<i class="'. esc_attr( ${'icon_'. $type} ) .'"'.$icon_style.'></i>';
						$output .= '</div>';
					}
				}			
				
			$output .= '</div>';
		$output .= '</div>';
		
		$counter_id++;
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_counters', 'zozo_vc_counters_shortcode' );

if ( ! function_exists( 'zozo_vc_counters_shortcode_map' ) ) {
	function zozo_vc_counters_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Counters", "zozothemes" ),
				"description"			=> __( "Animated number counters.", 'zozothemes' ),
				"base"					=> "zozo_vc_counters",
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
						"heading"		=> __( "Counter Style", "zozothemes" ),
						"param_name"	=> "counter_style",
						'admin_label' 	=> true,
						"value"			=> array(
							__( "Default", "zozothemes" )	=> "default",
							__( "Style 1", "zozothemes" )	=> "style-1",
						),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Counter Value", "zozothemes" ),
						'admin_label' 	=> true,
						"param_name"	=> "counter_value",						
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Counter Title", "zozothemes" ),
						"param_name"	=> "counter_title",						
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Counter Sub Title", "zozothemes" ),
						"param_name"	=> "counter_subtitle",						
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Counter Text Color", "zozothemes" ),
						"param_name"	=> "counter_color",						
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Title Text Color", "zozothemes" ),
						"param_name"	=> "title_color",						
					),
					// Icon
					array(
						"type" 			=> "dropdown",
						"heading" 		=> __( "Choose from Icon library", "zozothemes" ),
						"value" 		=> array(
							__( "None", "zozothemes" ) 				=> "",
							__( "Font Awesome", "zozothemes" ) 		=> "fontawesome",
							__( "Lineicons", "zozothemes" ) 		=> "lineicons",
							__( "Flaticons", "zozothemes" ) 		=> "flaticons",
						),
						"admin_label" 	=> true,
						"param_name" 	=> "type",
						"description" 	=> __( "Select icon library.", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),
					),					
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Counter Icon", "zozothemes" ),
						"param_name" 	=> "icon_fontawesome",
						"value" 		=> "fa fa-minus-circle",
						"settings" 		=> array(
							"emptyIcon" 	=> true,
							"iconsPerPage" 	=> 4000,
						),
						"dependency" 	=> array(
							"element" 	=> "type",
							"value" 	=> "fontawesome",
						),
						"description" 	=> __( "Select icon from library.", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),
					),				
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Counter Icon", "zozothemes" ),
						"param_name" 	=> "icon_lineicons",
						"value" 		=> "",
						"settings" 		=> array(
							"emptyIcon" 	=> true,
							"type" 			=> 'simplelineicons',
							"iconsPerPage" 	=> 4000,
						),
						"dependency" 	=> array(
							"element" 	=> "type",
							"value" 	=> "lineicons",
						),
						"description" 	=> __( "Select icon from library.", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),
					),
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Counter Icon", "zozothemes" ),
						"param_name" 	=> "icon_flaticons",
						"value" 		=> "",
						"settings" 		=> array(
							"emptyIcon" 	=> true,
							"type" 			=> 'flaticons',
							"iconsPerPage" 	=> 4000,
						),
						"dependency" 	=> array(
							"element" 	=> "type",
							"value" 	=> "flaticons",
						),
						"description" 	=> __( "Select icon from library.", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Icon Position", "zozothemes" ),
						"param_name"	=> "icon_position",
						"value"			=> array(
							__( "Left", "zozothemes" )		=> "left",
							__( "Top", "zozothemes" )		=> "top",
							__( "Bottom", "zozothemes" )	=> "bottom" ),
						"group"			=> __( "Icon", "zozothemes" ),
					), 
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Icon Font Size", "zozothemes" ),
						"param_name"	=> "icon_font_size",	
						"description" 	=> __( "Enter Custom Icon Font Size. Example: 30px", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),					
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Icon Line Height", "zozothemes" ),
						"param_name"	=> "icon_line_height",	
						"description" 	=> __( "Enter Custom Icon Font Line Height. Example: 30px", "zozothemes" ),
						"group"			=> __( "Icon", "zozothemes" ),					
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Icon Color", "zozothemes" ),
						"param_name"	=> "icon_color",
						"group"			=> __( "Icon", "zozothemes" ),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_counters_shortcode_map' );