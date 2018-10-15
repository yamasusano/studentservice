<?php
/**
 * Search Form shortcode
 */

if ( ! function_exists( 'zozo_vc_search_form_shortcode' ) ) {
	function zozo_vc_search_form_shortcode( $atts, $content = NULL ) {
		
		$atts = vc_map_get_attributes( 'zozo_vc_search_form', $atts );
		extract( $atts );

		$output = '';
		$button_class = '';
		$button_html = '';
		$form_extra_class = '';
		static $zozo_sform_id = 1;
		
		// Button
		$button_html = $button_text;
		if ( $button_align ) {
			$button_class .= ' btn-'. $button_align;
			$form_extra_class = ' form-btn-'. $button_align;
		}
		
		if ( 'yes' === $add_icon ) {
			if( $button_html == '' ) {
				$button_class .= ' zozo-btn-only-icon';
			}
			$button_class .= ' zozo-btn-icon-' . $icon_align;
			if( isset( ${"icon_" . $type} ) ) {
				$iconClass = ${"icon_" . $type};
			} else {
				$iconClass = 'fa fa-adjust';
			}
				
			$icon_html = '<i class="zozo-btn-icon ' . esc_attr( $iconClass ) . '"></i>';
		
			if ( $icon_align == 'left' ) {
				$button_html = $icon_html . ' ' . $button_html;
			} else {
				$button_html .= ' ' . $icon_html;
			}
		}
				
		$button_styles = $button_hover_styles = '';
		if( isset( $bg_color ) && $bg_color != '' ) {
			$button_styles = 'background-color: '.$bg_color.'; ';
		}
		
		if( isset( $bg_text_color ) && $bg_text_color != '' ) {
			$button_styles .= 'color: '.$bg_text_color.';';
		}
		
		if( isset( $bg_hover_color ) && $bg_hover_color != '' ) {
			$button_hover_styles = 'background-color: '.$bg_hover_color.'; ';
		}
		
		if( isset( $bg_hover_text_color ) && $bg_hover_text_color != '' ) {
			$button_hover_styles .= 'color: '.$bg_hover_text_color.';';
		}
		
		// Classes
		$main_classes = '';
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		if( isset( $form_style ) && $form_style != '' ) {
			$main_classes .= ' form-style-' . $form_style;
		}
		if( isset( $add_domain ) && $add_domain == 'yes' ) {
			$main_classes .= ' form-domain-view';
		}
		$main_classes .= zozo_vc_animation( $css_animation );
		
		if( ( isset( $button_styles ) && $button_styles != '' ) || ( isset( $button_hover_styles ) && $button_hover_styles != '' ) ) {
			$output = '<style type="text/css" scoped>';
			if( isset( $button_styles ) && $button_styles != '' ) {
				$output .= '#zozo-search-form-'.$zozo_sform_id.' .btn.domain-search {' . $button_styles . ' }';
			}
			if( isset( $button_hover_styles ) && $button_hover_styles != '' ) {
				$output .= '#zozo-search-form'.$zozo_sform_id.' .btn.domain-search:hover, #zozo-search-form-'.$zozo_sform_id.' .btn.domain-search:active, #zozo-search-form-'.$zozo_sform_id.' .btn.domain-search:focus {' . $button_hover_styles . ' }';
			}
			$output .= '</style>';
		}

		$output .= '<div id="zozo-search-form-'.$zozo_sform_id.'" class="search-domain-form-wrapper'. esc_attr( $main_classes ) .'">';
			$output .= '<form method="post" action="'.$action_url.'" id="zozo-search-domain'.$zozo_sform_id.'" name="zozo-search-domain'.$zozo_sform_id.'" class="zozo-search-domain-form'.$form_extra_class.'">';
			
				$output .= '<div class="form-group zozo-form-group-addon">';
				$output .= '<div class="input-group">';
					$output .= '<input type="text" placeholder="'.$placeholder_text.'" class="input-text domain-name form-control" name="domain_name">';
					
					if( isset( $add_domain ) && $add_domain == 'yes' ) {
						$domain_extensions = explode( ",", $domain_extension );
						$output .= '<select name="domain_extension" class="input-select">';
						foreach ( $domain_extensions as $extension ) {
							$output .= '<option value="'. $extension .'">'. $extension .'</option>';
						}
						$output .= '</select>';
					}
					$output .= '<div class="input-group-addon"><button type="submit" id="zozo_domain_form_submit" name="zozo_domain_form_submit" class="btn domain-search zozo-submit'. esc_attr( $button_class ) .'">'.$button_html.'</button></div>';
				$output .= '</div>';
				$output .= '</div>';

			$output .= '</form>';
		$output .= '</div>';
		
		$zozo_sform_id++;
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_search_form', 'zozo_vc_search_form_shortcode' );

if ( ! function_exists( 'zozo_vc_search_form_shortcode_map' ) ) {
	function zozo_vc_search_form_shortcode_map() {
	
		vc_map( 
			array(
				"name"					=> __( "Search Form", "zozothemes" ),
				"description"			=> __( "Search form with different options.", 'zozothemes' ),
				"base"					=> "zozo_vc_search_form",
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
						"heading"		=> __( "Form Style", "zozothemes" ),
						"param_name"	=> "form_style",
						'admin_label' 	=> true,
						"value"			=> array(
							__( "Default", "zozothemes" )			=> "default",
							__( "Transparent", "zozothemes" )		=> "transparent" ),
					),
					array(
						'type' 			=> 'checkbox',
						'heading' 		=> __( 'Add Domain?', 'zozothemes' ),
						'param_name' 	=> 'add_domain',
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "yes"
						),						
					),
					array(
						"type"			=> 'exploded_textarea',
						"heading"		=> __( "Domain Extension", "zozothemes" ),
						"param_name"	=> "domain_extension",
						"value" 		=> '.com,.co,.net,.org',
						'admin_label' 	=> true,
						"description" 	=> __( "Enter domain extensions. Divide extensions with linebreaks (Enter).", "zozothemes" ),
						'dependency' 	=> array(
							'element' 	=> 'add_domain',
							'value' 	=> 'yes',
						),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Form Action URL", "zozothemes" ),
						"param_name"	=> "action_url",
						"value"			=> ''
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Placeholder Text", "zozothemes" ),
						"param_name"	=> "placeholder_text",
						'admin_label' 	=> true,
						"value"			=> __( 'Enter your Domain Name here...', 'zozothemes' ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Button Text", "zozothemes" ),
						"param_name"	=> "button_text",
						'admin_label' 	=> true,
						"value"			=> __( 'Search', 'zozothemes' ),
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						'type' 			=> 'dropdown',
						'heading' 		=> __( 'Button Alignment', 'zozothemes' ),
						'param_name' 	=> 'button_align',
						'description' 	=> __( 'Select button alignment.', 'zozothemes' ),
						'value' 		=> array(
							__( 'Inline', 'zozothemes' ) 	=> 'inline',
							__( 'Right', 'zozothemes' ) 	=> 'right',
						),
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						'type' 			=> 'checkbox',
						'heading' 		=> __( 'Add icon?', 'zozothemes' ),
						'param_name' 	=> 'add_icon',
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "yes"
						),
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						'type' 			=> 'dropdown',
						'heading' 		=> __( 'Icon Alignment', 'zozothemes' ),
						'description' 	=> __( 'Select icon alignment.', 'zozothemes' ),
						'param_name' 	=> 'icon_align',
						'value' 		=> array(
							__( 'Left', 'zozothemes' ) 	=> 'left',
							__( 'Right', 'zozothemes' ) => 'right',
						),
						'dependency' 	=> array(
							'element' 	=> 'add_icon',
							'value' 	=> 'yes',
						),
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type" 			=> "dropdown",
						"heading" 		=> __( "Choose from Icon library", "zozothemes" ),
						"value" 		=> array(
							__( "Font Awesome", "zozothemes" ) 		=> "fontawesome",
							__( "Lineicons", "zozothemes" ) 		=> "lineicons",
							__( "Flaticons", "zozothemes" ) 		=> "flaticons",
						),
						"param_name" 	=> "type",
						'dependency' 	=> array(
							'element' 	=> 'add_icon',
							'value' 	=> 'yes',
						),
						"description" 	=> __( "Select icon library.", "zozothemes" ),
						"group"			=> __( "Button", "zozothemes" ),
					),					
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Icon", "zozothemes" ),
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
						"group"			=> __( "Button", "zozothemes" ),
					),				
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Icon", "zozothemes" ),
						"param_name" 	=> "icon_lineicons",
						"value" 		=> "fa fa-minus-circle",
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
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Icon", "zozothemes" ),
						"param_name" 	=> "icon_flaticons",
						"value" 		=> "fa fa-minus-circle",
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
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Button Background Color", "zozothemes" ),
						"param_name"	=> "bg_color",
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Button Text Color", "zozothemes" ),
						"param_name"	=> "bg_text_color",
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Button Hover Background Color", "zozothemes" ),
						"param_name"	=> "bg_hover_color",
						"group"			=> __( "Button", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Button Hover Text Color", "zozothemes" ),
						"param_name"	=> "bg_hover_text_color",
						"group"			=> __( "Button", "zozothemes" ),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_search_form_shortcode_map' );