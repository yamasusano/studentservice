<?php 
/**
 * Circle Counters shortcode
 */

if ( ! function_exists( 'zozo_vc_circle_counter_shortcode' ) ) {
	function zozo_vc_circle_counter_shortcode( $atts, $content = NULL ) {
		
		extract( 
			shortcode_atts( 
				array(
					'columns'					=> '3',
					'circle_size'				=> '152',
					'circle_line'				=> '6',
					'classes'					=> '',
					'css_animation'				=> '',
					'counter_value' 			=> '90|Development,80|Design,70|Marketing',
					'title_color' 				=> '',
					'desc_color' 				=> '',
					'slider' 					=> '',
					'items'						=> '4',
					'items_scroll' 				=> '1',
					'auto_play' 				=> 'true',					
					'timeout_duration' 			=> '5000',
					'margin' 					=> '0',
					'items_tablet'				=> '3',
					'items_mobile_landscape'	=> '2',
					'items_mobile_portrait'		=> '1',
					'navigation' 				=> 'true',
					'pagination' 				=> 'false',
				), $atts 
			) 
		);

		$output = '';
		static $counter_id = 1;
		
		// Style
		$title_style = '';		
		if( isset( $title_color ) && $title_color != '' ) {
			$title_style .= 'color:'. $title_color .';';
		}
		if( $title_style ) {
			$title_style = ' style="'. $title_style .'"';
		}
		
		$desc_style = '';		
		if( isset( $desc_color ) && $desc_color != '' ) {
			$desc_style .= 'color:'. $desc_color .';';
		}
		if( $desc_style ) {
			$desc_style = ' style="'. $desc_style .'"';
		}
		
		$span_style = '';		
		if( isset( $circle_size ) && $circle_size != '' ) {
			$span_style .= 'line-height:'. $circle_size .'px;';
		}
		if( $span_style ) {
			$span_style = ' style="'. $span_style .'"';
		}
		
		// Slider Configuration
		$data_attr = '';
	
		if( isset( $items ) && $items != '' ) {
			$data_attr .= ' data-items="' . $items . '" ';
		}
		
		if( isset( $items_scroll ) && $items_scroll != '' ) {
			$data_attr .= ' data-slideby="' . $items_scroll . '" ';
		}
				
		if( isset( $items_tablet ) && $items_tablet != '' ) {
			$data_attr .= ' data-items-tablet="' . $items_tablet . '" ';
		}
		
		if( isset( $items_mobile_landscape ) && $items_mobile_landscape != '' ) {
			$data_attr .= ' data-items-mobile-landscape="' . $items_mobile_landscape . '" ';
		}
		
		if( isset( $items_mobile_portrait ) && $items_mobile_portrait != '' ) {
			$data_attr .= ' data-items-mobile-portrait="' . $items_mobile_portrait . '" ';
		}
		
		if( isset( $auto_play ) && $auto_play != '' ) {
			$data_attr .= ' data-autoplay="' . $auto_play . '" ';
		}
		if( isset( $timeout_duration ) && $timeout_duration != '' ) {
			$data_attr .= ' data-autoplay-timeout="' . $timeout_duration . '" ';
		}
		
		if( isset( $margin ) && $margin != '' ) {
			$data_attr .= ' data-margin="' . $margin . '" ';
		}
		
		if( isset( $pagination ) && $pagination != '' ) {
			$data_attr .= ' data-pagination="' . $pagination . '" ';
		}
		if( isset( $navigation ) && $navigation != '' ) {
			$data_attr .= ' data-navigation="' . $navigation . '" ';
		}
		
		$data_attr .= ' data-loop="false"';	
		
		// Classes
		$main_classes = '';
		$main_classes .= zozo_vc_animation( $css_animation );
		
		// Counter Values
		$counter_lines = explode( ",", $counter_value );
		$counter_lines_data = array();
		
		foreach( $counter_lines as $line ) {
			$new_line = array();
			$color_index = 3;
			$track_index = 4;
			$data = explode( "|", $line );
			
			$new_line['value'] 			= isset( $data[0] ) ? $data[0] : 0;
			$new_line['title'] 			= isset( $data[1] ) ? $data[1] : '';
			$new_line['description'] 	= isset( $data[2] ) ? $data[2] : '';			
			$new_line['barcolor'] 		= ! empty( $data[$color_index] ) ? $data[$color_index] : '#FFC400';
			$new_line['trackcolor'] 	= ! empty( $data[$track_index] ) ? $data[$track_index] : '';
		
			$counter_lines_data[] = $new_line;
		}
		
		// Main Wrapper
		$output = '<div class="zozo-circle-counter-wrapper'.$main_classes.' clearfix">';
		
		// Check Slider is Enabled ?
		if( isset( $slider ) && $slider == 'yes' ) {
			$output .= '<div id="zozo-owl-carousel-' . $counter_id. '" class="zozo-owl-carousel zozo-circle-counter owl-carousel circle-counter' . $counter_id. ' columns-'.$columns.' clearfix" ' . $data_attr . ' data-circle="'.$circle_size.'" data-linewidth="'.$circle_line.'">';
		} else {
			$output .= '<div id="zozo-circle-counter-' . $counter_id. '" class="zozo-circle-counter circle-no-slider circle-counter' . $counter_id. ' columns-'.$columns.' clearfix" data-circle="'.$circle_size.'" data-linewidth="'.$circle_line.'">';
		}
		
		// Chart
		foreach( $counter_lines_data as $line ) {
			$output .= '<div class="circle-counter-item">';
				$output .= '<div class="zozo-piechart" data-barcolor="'. $line['barcolor'] .'" data-trackcolor="'. $line['trackcolor'] .'" data-percent="'. $line['value'] .'">';
				$output .= '<span'. $span_style .'></span>';
				$output .= '</div>';
				
				$output .= '<div class="zozo-piechart-content">';
				if( isset( $line['title'] ) && $line['title'] != '' ) {
					$output .= '<h4 class="circle-counter-title"'.$title_style.'>'.$line['title'].'</h4>';
				}
				if( isset( $line['description'] ) && $line['description'] != '' ) {
					$output .= '<p class="circle-counter-desc"'.$desc_style.'>'.$line['description'].'</p>';
				}
				$output .= '</div>';
			$output .= '</div>'; // .circle-counter-item
		}
			
		$output .= '</div>'; // .circle-counter
		$output .= '</div>'; // .zozo-circle-counter-wrapper
		
		$counter_id++;
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_circle_counter', 'zozo_vc_circle_counter_shortcode' );

if ( ! function_exists( 'zozo_vc_circle_counters_shortcode_map' ) ) {
	function zozo_vc_circle_counters_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Pie Chart", "zozothemes" ),
				"description"			=> __( "Animated Circle Pie Chart with Counters.", 'zozothemes' ),
				"base"					=> "zozo_vc_circle_counter",
				"category"				=> __( "Theme Addons", "zozothemes" ),
				"icon"					=> "zozo-vc-icon",
				"params"				=> array(
					array(
						"type"			=> 'dropdown',
						'admin_label' 	=> true,
						"heading"		=> __( "Columns", "zozothemes" ),
						"param_name"	=> "columns",
						"value"			=> array(
							__( "3 Columns", "zozothemes" )	=> "3",
							__( "4 Columns", "zozothemes" )	=> "4",
							__( "5 Columns", "zozothemes" )	=> "5" ),
					),
					array(
						'type'			=> 'textfield',
						'heading'		=> __( 'Circle Size', "zozothemes" ),
						'param_name'	=> 'circle_size',
						'value' 		=> '',
					),
					array(
						'type'			=> 'textfield',
						'heading'		=> __( 'Circle Line Width', "zozothemes" ),
						'param_name'	=> 'circle_line',
						'value' 		=> '',
					),
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
					// Pie Chart
					array(
						"type"			=> 'exploded_textarea',
						"heading"		=> __( "Graphic Values", "zozothemes" ),
						"param_name"	=> "counter_value",
						"value" 		=> '90|Development,80|Design,70|Marketing',
						"description" 	=> __( "Input graph values, titles, description and bar color, track color here. Divide values with linebreaks (Enter). Example: 90|Development|Your Description|#FFC400|#ffffff", "zozothemes" ),
						"group"			=> __( "Pie Chart", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Heading Color", "zozothemes" ),
						"param_name"	=> "title_color",
						"group"			=> __( "Pie Chart", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Description Color", "zozothemes" ),
						"param_name"	=> "desc_color",
						"group"			=> __( "Pie Chart", "zozothemes" ),
					),					
					// Slider
					array(
						"type"			=> 'dropdown',
						'admin_label' 	=> true,
						"heading"		=> __( "Show as Slider ?", "zozothemes" ),
						"param_name"	=> "slider",
						"value"			=> array(
							__( "No", "zozothemes" )	=> "no",
							__( "Yes", "zozothemes" )	=> "yes",
						),
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items to Display", "zozothemes" ),
						"param_name"	=> "items",
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items to Scrollby", "zozothemes" ),
						"param_name"	=> "items_scroll",
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						'type'			=> 'dropdown',
						'heading'		=> __( "Auto Play", 'zozothemes' ),
						'param_name'	=> "auto_play",
						'value'			=> array(
							__( 'True', 'zozothemes' )	=> 'true',
							__( 'False', 'zozothemes' )	=> 'false',
						),
						"group"			=> __( "Slider", "zozothemes" ),
					),					
					array(
						'type'			=> 'textfield',
						'heading'		=> __( 'Timeout Duration (in milliseconds)', 'zozothemes' ),
						'param_name'	=> "timeout_duration",
						'value'			=> "5000",
						'dependency'	=> array(
							'element'	=> "auto_play",
							'value'		=> 'true'
						),
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Margin ( Items Spacing )", "zozothemes" ),
						"param_name"	=> "margin",
						'admin_label'	=> true,
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items To Display in Tablet", "zozothemes" ),
						"param_name"	=> "items_tablet",
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items To Display In Mobile Landscape", "zozothemes" ),
						"param_name"	=> "items_mobile_landscape",
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items To Display In Mobile Portrait", "zozothemes" ),
						"param_name"	=> "items_mobile_portrait",
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Navigation", "zozothemes" ),
						"param_name"	=> "navigation",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "true",
							__( "No", "zozothemes" )	=> "false" ),
						"group"			=> __( "Slider", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Pagination", "zozothemes" ),
						"param_name"	=> "pagination",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "true",
							__( "No", "zozothemes" )	=> "false" ),
						"group"			=> __( "Slider", "zozothemes" ),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_circle_counters_shortcode_map' );