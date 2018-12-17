<?php 
/**
 * Contact Info shortcode
 */

if ( ! function_exists( 'zozo_vc_contact_info_shortcode' ) ) {
	function zozo_vc_contact_info_shortcode( $atts, $content = NULL ) {
		
		$atts = vc_map_get_attributes( 'zozo_vc_contact_info', $atts );
		extract( $atts );

		$output = '';
		$extra_class = '';
		static $zozo_contact_info_id = 1;
		
		// Stylings
		$widget_title_styles = $widget_desc_styles = $address_label_styles = '';
		
		$widget_title_styles 	= !empty( $title_color ) ? ' style="color: '. $title_color .';"' : '';
		$widget_desc_styles 	= !empty( $desc_color ) ? ' style="color: '. $desc_color .';"' : '';
		$address_label_styles 	= !empty( $address_label_color ) ? ' style="color: '. $address_label_color .';"' : '';
		$phone_label_styles 	= !empty( $phone_label_color ) ? ' style="color: '. $phone_label_color .';"' : '';
		$phone_styles 			= !empty( $phone_color ) ? ' style="color: '. $phone_color .';"' : '';
		$email_label_styles 	= !empty( $email_label_color ) ? ' style="color: '. $email_label_color .';"' : '';
		$email_styles 			= !empty( $email_color ) ? ' style="color: '. $email_color .';"' : '';
		$social_label_styles 	= !empty( $social_label_color ) ? ' style="color: '. $social_label_color .';"' : '';
		$icon_styles 			= !empty( $icon_color ) ? 'color: '. $icon_color .';' : '';
		if( isset( $social_icons_type ) && $social_icons_type != 'transparent' ) {
			if( isset( $social_icons_style ) && $social_icons_style == 'background' ) {
				$icon_styles 		   .= !empty( $icon_bg_color ) ? 'background-color: '. $icon_bg_color .';' : '';
			}
			if( isset( $social_icons_style ) && $social_icons_style == 'bordered' ) {
				$icon_styles 		   .= !empty( $icon_border_color ) ? 'border-color: '. $icon_border_color .';' : '';
			}
		}
		$icon_hv_styles			= !empty( $icon_hover_color ) ? 'color: '. $icon_hover_color .';' : '';
		if( isset( $social_icons_type ) && $social_icons_type != 'transparent' ) {
			if( isset( $social_icons_style ) && $social_icons_style == 'background' ) {
				$icon_hv_styles		   .= !empty( $icon_bg_hover_color ) ? 'background-color: '. $icon_bg_hover_color .';' : '';
			}
			if( isset( $social_icons_style ) && $social_icons_style == 'bordered' ) {
				$icon_hv_styles		   .= !empty( $icon_border_hover_color ) ? 'border-color: '. $icon_border_hover_color .';' : '';
			}
		}		
		
		// Classes
		$main_classes = '';
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		
		if( isset( $style ) && $style != '' ) {
			$main_classes .= ' contact-info-'.$style;
		}
		
		if( isset( $separator ) && $separator == 'yes' ) {
			$main_classes .= ' show-separator';
		} else {
			$main_classes .= ' no-separator';
		}
		
		$main_classes .= zozo_vc_animation( $css_animation );
		
		if( ( isset( $icon_styles ) && $icon_styles != '' ) || ( isset( $icon_hv_styles ) && $icon_hv_styles != '' ) || ( isset( $sep_color ) && $sep_color != '' ) || ( isset( $address_color ) && $address_color != '' ) ) {
			$output = '<style type="text/css">';
			if( isset( $sep_color ) && $sep_color != '' ) {
				$output .= '#contact-info-'.$zozo_contact_info_id.'.show-separator .contact-widget-desc { border-color: ' . $sep_color . '; }';
			}
			if( isset( $address_color ) && $address_color != '' ) {
				$output .= '#contact-info-'.$zozo_contact_info_id.' .contact-address p { color: ' . $address_color . '; }';
			}
			if( isset( $icon_styles ) && $icon_styles != '' ) {
				$output .= '#contact-info-'.$zozo_contact_info_id.' .zozo-social-icons li a {' . $icon_styles . ' }';
			}
			if( isset( $icon_hv_styles ) && $icon_hv_styles != '' ) {
				$output .= '#contact-info-'.$zozo_contact_info_id.' .zozo-social-icons li a:hover {' . $icon_hv_styles . ' }';
			}
			$output .= '</style>';
		}
		
		$output .= '<div id="contact-info-'.$zozo_contact_info_id.'" class="contact-info-container'. esc_attr( $main_classes ) .'">';
			$output .= '<div class="contact-info-inner text-'. $alignment .'">';
				$output .= '<div class="contact-top-header">';
					if( isset( $widget_title ) && $widget_title != '' ) {
						$output .= '<h4 class="contact-widget-title"'.$widget_title_styles.'>' . $widget_title . '</h4>';
					}
					if( isset( $widget_desc ) && $widget_desc != '' ) {
						$output .= '<div class="contact-widget-desc"'.$widget_desc_styles.'>' . $widget_desc . '</div>';
					}
				$output .= '</div>';
				
				if( isset( $content ) && $content != '' ) {
					$output .= '<div class="contact-address-box">';
						if( isset( $address_label ) && $address_label != '' ) {
							$output .= '<div class="contact-address-label">';
							$output .= '<h6'.$address_label_styles.'>'. $address_label .'</h6>';
							$output .= '</div>';
						}
						$output .= '<div class="contact-address">';
							$output .= wpb_js_remove_wpautop( $content, true );
						$output .= '</div>';
					$output .= '</div>';
				}
				
				if( isset( $phone_number ) && $phone_number != '' ) {
					$output .= '<div class="contact-phone-box">';
						if( isset( $phone_label ) && $phone_label != '' ) {
							$output .= '<div class="contact-phone-label">';
							$output .= '<h6'.$phone_label_styles.'>'. $phone_label .'</h6>';
							$output .= '</div>';
						}
						$output .= '<div class="contact-phone">';
							if( isset( $phone_number ) && $phone_number != '' ) {
								$output .= '<h5'.$phone_styles.'>'. $phone_number .'</h5>';
							}
							if( isset( $phone_number2 ) && $phone_number2 != '' ) {
								$output .= '<h5'.$phone_styles.'>'. $phone_number2 .'</h5>';
							}
							if( isset( $phone_number3 ) && $phone_number3 != '' ) {
								$output .= '<h5'.$phone_styles.'>'. $phone_number3 .'</h5>';
							}
						$output .= '</div>';
					$output .= '</div>';
				}
				
				if( isset( $email_address ) && $email_address != '' ) {
					$output .= '<div class="contact-email-box">';
						if( isset( $email_label ) && $email_label != '' ) {
							$output .= '<div class="contact-email-label">';
							$output .= '<h6'.$email_label_styles.'>'. $email_label .'</h6>';
							$output .= '</div>';
						}
						$output .= '<div class="contact-email">';
							if( isset( $email_address ) && $email_address != '' ) {
								$output .= '<h5><a href="mailto:'.$email_address.'"'.$email_styles.'>'. $email_address .'</a></h5>';
							}
							if( isset( $email_address2 ) && $email_address2 != '' ) {
								$output .= '<h5><a href="mailto:'.$email_address2.'"'.$email_styles.'>'. $email_address2 .'</a></h5>';
							}
							if( isset( $email_address3 ) && $email_address3 != '' ) {
								$output .= '<h5><a href="mailto:'.$email_address3.'"'.$email_styles.'>'. $email_address3 .'</a></h5>';
							}
						$output .= '</div>';
					$output .= '</div>';
				}
			
				$social_medias = array( 
								'facebook' 		=> $facebook, 
								'twitter' 		=> $twitter, 
								'google-plus' 	=> $googleplus, 
								'pinterest' 	=> $pinterest, 
								'linkedin' 		=> $linkedin, 
								'youtube' 		=> $youtube, 
								'rss' 			=> $rss, 
								'tumblr' 		=> $tumblr, 
								'reddit' 		=> $reddit, 
								'dribbble' 		=> $dribbble, 
								'flickr' 		=> $flickr, 
								'instagram' 	=> $instagram, 
								'vimeo' 		=> $vimeo, 
								'skype' 		=> $skype, 
								'blogger' 		=> $blogger, 
								'yahoo' 		=> $yahoo );
								
				$social_links = array();
								
				foreach( $social_medias as $icon => $link ) {
					if( $link && $link != '' ) {
						$social_link = vc_build_link( $link );
						$social_links[$icon]['icon'] = $icon;
						$social_links[$icon]['url'] = isset( $social_link['url'] ) ? $social_link['url'] : '';
						$social_links[$icon]['title'] = isset( $social_link['title'] ) ? $social_link['title'] : '';
						$social_links[$icon]['target'] = !empty( $social_link['target'] ) ? $social_link['target'] : '_blank';
					}
				}
				
				$li_html = '';
				if( isset( $social_links ) && is_array( $social_links ) ) {
					foreach( $social_links as $social ) {
						$icon_class = $social['icon'];
						
						if( $social['icon'] == 'googleplus' ) {
							$icon = 'fa fa-google-plus';
						} elseif( $social['icon'] == 'vimeo' ) {
							$icon = 'flaticon flaticon-social140';
						} elseif( $social['icon'] == 'blogger' ) {
							$icon = 'flaticon flaticon-blogger8';
						} else {
							$icon = 'fa fa-' . $social['icon'];
						}
						
						if( $social['url'] != '' ) {
							$li_html .= '<li class="'.esc_attr( $icon_class ).'"><a target="'.esc_attr( $social['target'] ).'" href="'.esc_url( $social['url'] ).'" title="'.esc_attr( $social['title'] ).'"><i class="'.esc_attr( $icon ).'"></i></a></li>';
						}
					}
				}
				
				if( isset( $li_html ) && $li_html != '' ) {
					if( isset( $social_label ) && $social_label != '' ) {
						$output .= '<div class="contact-social-label">';
						$output .= '<h6'.$social_label_styles.'>'. $social_label .'</h6>';
						$output .= '</div>';
					}
						
					$output .= '<ul class="zozo-social-icons soc-icon-'.$social_icons_type.' social-style-'.$social_icons_style.'">';
					$output .= $li_html;
					$output .= '</ul>';
				}
								
			$output .= '</div>';
		$output .= '</div>';
		
		$zozo_contact_info_id++;
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_contact_info', 'zozo_vc_contact_info_shortcode' );

if ( ! function_exists( 'zozo_vc_contact_info_shortcode_map' ) ) {
	function zozo_vc_contact_info_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Contact Info", "zozothemes" ),
				"description"			=> __( "Contact info with more options.", 'zozothemes' ),
				"base"					=> "zozo_vc_contact_info",
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
						"heading"		=> __( "Alignment", "zozothemes" ),
						"param_name"	=> "alignment",
						"value"			=> array(
							__( "Default", "zozothemes" )	=> "default",
							__( "Center", "zozothemes" )	=> "center",
							__( "Left", "zozothemes" )		=> "left",
							__( "Right", "zozothemes" )		=> "right",
						),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Style", "zozothemes" ),
						"param_name"	=> "style",
						"value"			=> array(
							__( "Default", "zozothemes" )	=> "default",
							__( "Style 2", "zozothemes" )	=> "style2",
						),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Widget Title", "zozothemes" ),
						"param_name"	=> "widget_title",
						"value"			=> "",
					),
					array(
						"type"			=> "textarea",
						"heading"		=> __( "Description", "zozothemes" ),
						"param_name"	=> "widget_desc",
						"value"			=> '',
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Separator", "zozothemes" ),
						"param_name"	=> "separator",
						"value"			=> array(
							__( "No", "zozothemes" )		=> "no",
							__( "Yes", "zozothemes" )		=> "yes",
						),
						"description" 	=> __( "Choose this option to show border separator between widget description and contact info.", "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Address Label", "zozothemes" ),
						"param_name"	=> "address_label",
						"value"			=> "",
					),
					array(
						"type"			=> "textarea_html",
						"holder"		=> "div",
						"heading"		=> __( "Address", "zozothemes" ),
						"param_name"	=> "content",
						"value"			=> __( 'I am text block. Please change this dummy text in your page editor for this box.', "zozothemes" ),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Phone Label", "zozothemes" ),
						"param_name"	=> "phone_label",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Phone Number", "zozothemes" ),
						"param_name"	=> "phone_number",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Phone Number 2", "zozothemes" ),
						"param_name"	=> "phone_number2",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Phone Number 3", "zozothemes" ),
						"param_name"	=> "phone_number3",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Email Label", "zozothemes" ),
						"param_name"	=> "email_label",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Email Address", "zozothemes" ),
						"param_name"	=> "email_address",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Email Address 2", "zozothemes" ),
						"param_name"	=> "email_address2",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Email Address 3", "zozothemes" ),
						"param_name"	=> "email_address3",
						"value"			=> "",
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Social Label", "zozothemes" ),
						"param_name"	=> "social_label",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						'admin_label' 	=> true,
						"heading"		=> __( "Type", "zozothemes" ),
						"param_name"	=> "social_icons_type",
						"value"			=> array(
							__( "Circle", "zozothemes" )		=> "circle",
							__( "Square", "zozothemes" )		=> "square",
							__( "Rounded", "zozothemes" )		=> "rounded",
							__( "Transparent", "zozothemes" )	=> "transparent",
						),
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Style", "zozothemes" ),
						"param_name"	=> "social_icons_style",
						"value"			=> array(
							__( "None", "zozothemes" )			=> "none",
							__( "Bordered", "zozothemes" )		=> "bordered",
							__( "Background", "zozothemes" )	=> "background",
						),
						'dependency'	=> array(
							'element'	=> 'social_icons_type',
							'value'		=> array( 'circle', 'square', 'rounded' ),
						),
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Facebook Link", 'zozothemes' ),
						"param_name"	=> "facebook",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Twitter Link", 'zozothemes' ),
						"param_name"	=> "twitter",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Google+ Link", 'zozothemes' ),
						"param_name"	=> "googleplus",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Pinterest Link", 'zozothemes' ),
						"param_name"	=> "pinterest",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Linkedin Link", 'zozothemes' ),
						"param_name"	=> "linkedin",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Youtube Link", 'zozothemes' ),
						"param_name"	=> "youtube",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "RSS Link", 'zozothemes' ),
						"param_name"	=> "rss",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Tumblr Link", 'zozothemes' ),
						"param_name"	=> "tumblr",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Reddit Link", 'zozothemes' ),
						"param_name"	=> "reddit",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Dribbble Link", 'zozothemes' ),
						"param_name"	=> "dribbble",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Flickr Link", 'zozothemes' ),
						"param_name"	=> "flickr",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Instagram Link", 'zozothemes' ),
						"param_name"	=> "instagram",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Vimeo Link", 'zozothemes' ),
						"param_name"	=> "vimeo",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Skype Link", 'zozothemes' ),
						"param_name"	=> "skype",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Blogger Link", 'zozothemes' ),
						"param_name"	=> "blogger",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					array(
						"type"			=> "vc_link",
						"heading"		=> __( "Yahoo Link", 'zozothemes' ),
						"param_name"	=> "yahoo",
						"value"			=> "",
						"group"			=> __( "Social Icons", "zozothemes" ),
					),
					// Stylings
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Widget Title Color", "zozothemes" ),
						"param_name"	=> "title_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Widget Description Color", "zozothemes" ),
						"param_name"	=> "desc_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Separator Color", "zozothemes" ),
						"param_name"	=> "sep_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Address Label Color", "zozothemes" ),
						"param_name"	=> "address_label_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Address Text Color", "zozothemes" ),
						"param_name"	=> "address_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Phone Label Color", "zozothemes" ),
						"param_name"	=> "phone_label_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Phone Text Color", "zozothemes" ),
						"param_name"	=> "phone_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Email Label Color", "zozothemes" ),
						"param_name"	=> "email_label_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Email Text Color", "zozothemes" ),
						"param_name"	=> "email_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Social Label Color", "zozothemes" ),
						"param_name"	=> "social_label_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Icon Color", "zozothemes" ),
						"param_name"	=> "icon_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Icon Background Color", "zozothemes" ),
						"param_name"	=> "icon_bg_color",
						"group"			=> __( "Stylings", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'social_icons_style',
							'value'		=> array( 'background' ),
						),
					),
					array(
						"type"			=> 'colorpicker',
						"heading"		=> __( "Icon Border Color", "zozothemes" ),
						"param_name"	=> "icon_border_color",
						"group"			=> __( "Stylings", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'social_icons_style',
							'value'		=> array( 'bordered' ),
						),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Icon Hover Color", "zozothemes" ),
						"param_name"	=> "icon_hover_color",
						"group"			=> __( "Stylings", "zozothemes" ),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Icon Background Hover Color", "zozothemes" ),
						"param_name"	=> "icon_bg_hover_color",
						"group"			=> __( "Stylings", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'social_icons_style',
							'value'		=> array( 'background' ),
						),
					),
					array(
						"type"			=> "colorpicker",
						"heading"		=> __( "Icon Border Hover Color", "zozothemes" ),
						"param_name"	=> "icon_border_hover_color",
						"group"			=> __( "Stylings", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'social_icons_style',
							'value'		=> array( 'bordered' ),
						),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_contact_info_shortcode_map' );