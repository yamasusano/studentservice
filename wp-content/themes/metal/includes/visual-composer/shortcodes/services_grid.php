<?php 
/**
 * Services Grid shortcode
 */

if ( ! function_exists( 'zozo_vc_services_grid_shortcode' ) ) {
	function zozo_vc_services_grid_shortcode( $atts, $content = NULL ) {
	
		$atts = vc_map_get_attributes( 'zozo_vc_services_grid', $atts );
		extract( $atts );

		$output = '';
		static $services_id = 1;
		global $post;
		
		// Include categories
		$include_categories = ( '' != $include_categories ) ? $include_categories : '';
		$include_categories = ( 'all' == $include_categories ) ? '' : $include_categories;
		$include_filter_cats = '';
		if( $include_categories ) {
			$include_categories = explode( ',', $include_categories );
			$include_filter_cats = array();
			foreach( $include_categories as $key ) {
				$key = get_term_by( 'slug', $key, 'service_categories' );
				$include_filter_cats[] = $key->term_id;
			}
		}
		
		if ( ! empty( $include_categories ) && is_array( $include_categories ) ) {
			$include_categories = array(
				'taxonomy'	=> 'service_categories',
				'field'		=> 'slug',
				'terms'		=> $include_categories,
				'operator'	=> 'IN',
			);
		} else {
			$include_categories = '';
		}
		
		// Exclude categories
		$exclude_filter_cats = '';
		if( $exclude_categories ) {
			$exclude_categories = explode( ',', $exclude_categories );
			if ( ! empty( $exclude_categories ) && is_array( $exclude_categories ) ) {
				$exclude_filter_cats = array();
				foreach ( $exclude_categories as $key ) {
					$key = get_term_by( 'slug', $key, 'service_categories' );
					$exclude_filter_cats[] = $key->term_id;
				}
				$exclude_categories = array(
						'taxonomy'	=> 'service_categories',
						'field'		=> 'slug',
						'terms'		=> $exclude_categories,
						'operator'	=> 'NOT IN',
					);
			} else {
				$exclude_categories = '';
			}
		}
				
		$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
		
		$query_args = array(
						'post_type' 		=> 'zozo_services',
						'posts_per_page'	=> $posts,
						'paged' 			=> $paged,
						'orderby' 		 	=> 'date',
						'order' 		 	=> 'DESC',
					  );
					  		
		$query_args['tax_query'] 	= array(
										'relation'	=> 'AND',
										$include_categories,
										$exclude_categories );
		
		$services_query = new WP_Query( $query_args );
		
		// Classes
		$main_classes = '';
		
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		$main_classes .= zozo_vc_animation( $css_animation );
		$main_classes .= ' services-columns-'.$columns;
		$main_classes .= ' services-style-'.$style_type;
		
		$column_class = '';
		
		if( isset( $columns ) && $columns != '' ) {
			if( isset( $columns ) && $columns == '2' ) {
				$column_class = 'col-sm-6 col-xs-12';
			} else if( isset( $columns ) && $columns == '3' ) {
				$column_class = 'col-sm-4 col-xs-12';
			} else if( isset( $columns ) && $columns == '4' ) {
				$column_class = 'col-md-3 col-sm-6 col-xs-12';
			}
		} else {
			$column_class = 'col-sm-6 col-xs-12';
		}
		
		if( $services_query->have_posts() ) {
		
			$output = '<div class="zozo-services-grid-wrapper'.$main_classes.'">';
			$output .= '<div class="row services-grid-inner">';
			
			$count = 1;
				
			while($services_query->have_posts()) : $services_query->the_post();
				
				if( isset( $columns ) && $columns == '2' ) {
					$image_size = 'portfolio-large';
				} else {
					$image_size = 'portfolio-mid';
				}
				
				$services_img = '';
				$services_img = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), $image_size);				
				
				$services_img_large = ''; 
				$services_img_large = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full');
				
				if( ( isset( $columns ) && $columns == '2' && $count == '3' ) || ( isset( $columns ) && $columns == '3' && $count == '4' ) || ( isset( $columns ) && $columns == '4' && $count == '5' ) ) {
					$count = 1;
					$output .= '<div class="services-clearfix clearfix"></div>';
				}
						
				$output .= '<div class="services-item '.$column_class.'">';
				
					if( isset( $services_img ) && $services_img != '' ) {
						$output .= '<div class="services-item-img">';
							$output .= '<a href="'.esc_url( $services_img_large[0] ).'" data-rel="prettyPhoto[gallery'.$services_id.']" class="services-img-link" title="'.get_the_title().'"><img class="img-responsive" src="'.esc_url($services_img[0]).'" width="'.esc_attr($services_img[1]).'" height="'.esc_attr($services_img[2]).'" alt="'.get_the_title().'" /></a>';
						$output .= '</div>';
					}
									
					$output .= '<div class="services-content-wrapper">';
						$output .= '<h4><a href="'. get_permalink() .'" title="'. get_the_title() .'">'.get_the_title().'</a></h4>';
												
						if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
							$output .= '<div class="services-excerpts">';
								if( isset( $excerpt_length ) && $excerpt_length != '' ) {
									$output .= zozo_custom_wp_trim_excerpt( '', $excerpt_length );
								} else {
									$output .= zozo_custom_wp_trim_excerpt( '', 10 );
								}
							$output .= '</div>';
						}
						if( isset( $button_text ) && $button_text != '' ) {
							$output .= '<a href="'. get_permalink() .'" class="btn btn-more" title="'.get_the_title().'">'. $button_text .'</a>';
						}
					$output .= '</div>';
					
				$output .= '</div>';

			endwhile;
				
			$output .= '</div>';
				
			if( isset( $pagination ) && $pagination == 'yes' ) {
				$output .= zozo_pagination( $services_query->max_num_pages, '' );
			}
			
			$output .= '</div>';
		}		
		
		$services_id++;
		wp_reset_postdata();
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_services_grid', 'zozo_vc_services_grid_shortcode' );

if ( ! function_exists( 'zozo_vc_services_grid_shortcode_map' ) ) {
	function zozo_vc_services_grid_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Services Grid", "zozothemes" ),
				"description"			=> __( "Show your services in grid.", 'zozothemes' ),
				"base"					=> "zozo_vc_services_grid",
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
						"type"			=> "textfield",
						"heading"		=> __( "Posts per Page", "zozothemes" ),
						"admin_label" 	=> true,
						"param_name"	=> "posts",						
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Pagination ?", "zozothemes" ),
						"param_name"	=> "pagination",	
						"value"			=> array(
							__( "Yes", "zozothemes" )		=> "yes",
							__( "No", "zozothemes" )		=> "no" ),
					),
					array(
						'type'			=> 'textfield',
						'heading'		=> __( 'Include Categories', 'zozothemes' ),
						'param_name'	=> 'include_categories',
						'admin_label'	=> true,
						'description'	=> __('Enter the slugs of a categories (comma seperated) to pull posts from or enter "all" to pull recent posts from all categories. Example: category-1, category-2.','zozothemes'),
					),
					array(
						'type'			=> 'textfield',
						'heading'		=> __( 'Exclude Categories', 'zozothemes' ),
						'param_name'	=> 'exclude_categories',
						'admin_label'	=> true,
						'description'	=> __('Enter the slugs of a categories (comma seperated) to exclude. Example: category-1, category-2.','zozothemes'),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Services Columns", "zozothemes" ),
						"param_name"	=> "columns",
						"admin_label" 	=> true,
						"value"			=> array(
							__( "Two Columns", "zozothemes" )		=> "2",
							__( "Three Columns", "zozothemes" )		=> "3",
							__( "Four Columns", "zozothemes" )		=> "4" ),
						"description" 	=> __( "Select Columns type for Services", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Services Style", "zozothemes" ),
						"param_name"	=> "style_type",
						"value"			=> array(
							__( "With Background", "zozothemes" )		=> "with-bg",
							__( "Without Background", "zozothemes" )	=> "no-bg",
						),
						"description" 	=> __( "Select Style type for Services", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Excerpt Content", "zozothemes" ),
						"param_name"	=> "show_excerpt",
						"description" 	=> __( "Enable/Disable Excerpts", "zozothemes" ),
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "yes",
							__( "No", "zozothemes" )	=> "no",
						),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Excerpt Length", "zozothemes" ),
						"param_name"	=> "excerpt_length",
						"description" 	=> __( "Enter excerpt length", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'show_excerpt',
							"value" 	=> 'yes',
						),
					),
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Button Text", "zozothemes" ),
						"param_name"	=> "button_text",
						"description" 	=> __( "Enter button text.", "zozothemes" ),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_services_grid_shortcode_map' );