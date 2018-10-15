<?php 
/**
 * Day Counter shortcode
 */

if ( ! function_exists( 'zozo_vc_day_counter_shortcode' ) ) {
	function zozo_vc_day_counter_shortcode( $atts, $content = NULL ) {
	
		$atts = vc_map_get_attributes( 'zozo_vc_day_counter', $atts );
		extract( $atts );

		$output = '';
		static $counter_id = 1;
		
		$data_attr = '';		
		$data_attr .= ' data-counter="'.$counter_type.'" ';
		$data_attr .= ' data-year="'.$year.'" ';
		$data_attr .= ' data-month="'.$month.'" ';
		$data_attr .= ' data-date="'.$date.'" ';
		
		// Classes
		$main_classes = 'zozo-daycounter-container';
		
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		$main_classes .= zozo_vc_animation( $css_animation );
		
		wp_enqueue_script( 'zozo-countdown-plugin-js' );
		wp_enqueue_script( 'zozo-countdown-js' );
	
		$output .= '<div class="'. esc_attr( $main_classes ) .'">';
			$output .= '<div id="zozo-daycounter-'.$counter_id.'" class="zozo-daycounter zozo-daycounter-wrapper clearfix"'.$data_attr.'>';
			$output .= '</div>';
			
			if( ( isset( $show_button ) && $show_button == 'yes' ) ) {
				// Button URL
				$btn_link = $btn_title = $btn_target = '';
				if( $button_link && $button_link != '' ) {
					$link = vc_build_link( $button_link );
					$btn_link = isset( $link['url'] ) ? $link['url'] : '';
					$btn_title = isset( $link['title'] ) ? $link['title'] : '';
					$btn_target = isset( $link['target'] ) ? $link['target'] : '';
				}
				$output .= '<div class="daycounter-button">';
					$output .= '<a class="btn btn-discount" href="'.esc_url($btn_link).'" title="'. esc_attr( $btn_title ) .'" target="'. esc_attr( $btn_target ) .'">'. $button_text .'</a>';
				$output .= '</div>';
			}
			
		$output .= '</div>';
		
		$counter_id++;
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_day_counter', 'zozo_vc_day_counter_shortcode' );

if ( ! function_exists( 'zozo_vc_day_counter_shortcode_map' ) ) {
	function zozo_vc_day_counter_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Day Counter", "zozothemes" ),
				"description"			=> __( "Animated Day Up/Down Counter.", 'zozothemes' ),
				"base"					=> "zozo_vc_day_counter",
				"category"				=> __( "Theme Addons", "zozothemes" ),
				"icon"					=> "zozo-vc-icon",
				"params"				=> array(					
					array(
						'type'			=> 'textfield',
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
						"heading"		=> __( "Counter Type", "zozothemes" ),
						"param_name"	=> "counter_type",
						"admin_label" 	=> true,
						"value"			=> array(
							__( "Counter Down", "zozothemes" )		=> "down",
							__( "Counter Up", "zozothemes" )		=> "up" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Year", "zozothemes" ),
						"admin_label" 	=> true,
						"param_name"	=> "year",						
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Month", "zozothemes" ),
						"admin_label" 	=> true,
						"param_name"	=> "month",						
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Date", "zozothemes" ),
						"admin_label" 	=> true,
						"param_name"	=> "date",
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Button", "zozothemes" ),
						"param_name"	=> "show_button",
						"value"			=> array(
							__( "No", "zozothemes" )		=> "no",
							__( "Yes", "zozothemes" )		=> "yes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Button Text", "zozothemes" ),
						"param_name"	=> "button_text",						
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Button Link", "zozothemes" ),
						"param_name"	=> "button_link",
						"value"			=> "",
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_day_counter_shortcode_map' );