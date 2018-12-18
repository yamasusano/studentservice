<?php 
/**
 * Portfolio Grid shortcode
 */

if ( ! function_exists( 'zozo_vc_portfolio_grid_shortcode' ) ) {
	function zozo_vc_portfolio_grid_shortcode( $atts, $content = NULL ) {
	
		$atts = vc_map_get_attributes( 'zozo_vc_portfolio_grid', $atts );
		extract( $atts );

		$output = '';
		static $portfolio_id = 1;
		global $post;
		
		// Include categories
		$include_categories = ( '' != $include_categories ) ? $include_categories : '';
		$include_categories = ( 'all' == $include_categories ) ? '' : $include_categories;
		$include_filter_cats = '';
		if( $include_categories ) {
			$include_categories = explode( ',', $include_categories );
			$include_filter_cats = array();
			foreach( $include_categories as $key ) {
				$key = get_term_by( 'slug', $key, 'portfolio_categories' );
				$include_filter_cats[] = $key->term_id;
			}
		}
		
		if ( ! empty( $include_categories ) && is_array( $include_categories ) ) {
			$include_categories = array(
				'taxonomy'	=> 'portfolio_categories',
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
					$key = get_term_by( 'slug', $key, 'portfolio_categories' );
					$exclude_filter_cats[] = $key->term_id;
				}
				$exclude_categories = array(
						'taxonomy'	=> 'portfolio_categories',
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
						'post_type' 		=> 'zozo_portfolio',
						'posts_per_page'	=> $posts,
						'paged' 			=> $paged,
						'orderby' 		 	=> 'date',
						'order' 		 	=> 'DESC',
					  );
					  		
		$query_args['tax_query'] 	= array(
										'relation'	=> 'AND',
										$include_categories,
										$exclude_categories );
										
		if( isset( $style ) && $style == 'classic' ) {
			switch( $orderby ) {
				case 'rating':
					$query_args['meta_key'] = 'zozo_author_rating';
					$query_args['orderby']  = 'meta_value_num';
				break;
		
				case 'title':
					$query_args['orderby'] = 'title';
				break;
		
				case 'id':
					$query_args['orderby'] = 'ID';
				break;
		
				case 'random':
					$query_args['orderby'] = 'rand';
				break;
		
				default:
					$query_args['orderby'] = 'post_date';
				break;
			}
		}
		
		$portfolio_query = new WP_Query( $query_args );
		
		// Classes
		$main_classes = '';
		
		if( isset( $classes ) && $classes != '' ) {
			$main_classes .= ' ' . $classes;
		}
		$main_classes .= zozo_vc_animation( $css_animation );		
	
		// Icon
		$icon_show = '';
		if( isset( ${'icon_'. $type} ) && ${'icon_'. $type} != '' ) {
			$icon_show .= '<i class="'. esc_attr( ${'icon_'. $type} ) .' portfolio-icon"></i>';
		}
	
		if( $portfolio_query->have_posts() ) {
			$output = '<div class="zozo-portfolio-grid-wrapper'.$main_classes.' '.$style.'">';
			
			if( isset( $style ) && $style == 'masonry' ) {
				$output .= '<div id="zozo_portfolio_'.$portfolio_id.'" class="zozo-portfolio masonry-style portfolio-cols-'.$columns.'" data-columns="'.$columns.'" data-gutter="'.$gutter.'">'. "\n";
			} elseif( isset( $style ) && $style == 'list_style' ) {
				$output .= '<div id="zozo_portfolio_'.$portfolio_id.'" class="zozo-portfolio list-style portfolio-cols-'.$list_columns.'" data-columns="'.$list_columns.'" data-gutter="'.$gutter.'">'. "\n";
			} else {
				$output .= '<div id="zozo_portfolio_'.$portfolio_id.'" class="zozo-portfolio '.$style.'-grid-style portfolio-cols-'.$columns.'" data-columns="'.$columns.'" data-gutter="'.$gutter.'">';
			}
				
			// Display filter links
			if( isset( $filters ) && $filters == 'yes' ) {
			
				$terms = get_terms( 'portfolio_categories', array(
					'include'	=> $include_filter_cats,
					'exclude'	=> $exclude_filter_cats,
				) );
				
				if ( $terms && count( $terms ) > '1') {
					$filter_class = '';
					if( isset( $filter_align ) && $filter_align != '' ) {
						$filter_class = ' text-'. $filter_align .'';
					}
					$output .= '<ul class="portfolio-tabs list-inline '.$filter_type.''.$filter_class.'">'. "\n";
					
						// First Filter Check
						if( isset( $first_filter ) && $first_filter == "all" ) {
							$output .= '<li><a class="active" data-filter="*" href="#">'.$icon_show.'<span>' . esc_html__('Show All', 'zozothemes').'</span></a></li>'. "\n";
						}
						foreach($terms as $term ) {
							$tag_class = '';
							if( isset( $first_filter ) && $first_filter != 'all' ) {
								if( $first_filter == $term->slug ) {
									$tag_class = ' class="active"';
								}
							}
							$output .= '<li><a'.$tag_class.' data-filter=".'.$term->slug.'" href="#">'.$icon_show.'<span>' .$term->name. '</span></a></li>'. "\n";
						}
						
					$output .= '</ul>'. "\n";
				}
			}
				
			$output .= '<div class="portfolio-inner">';
				
			while($portfolio_query->have_posts()) : $portfolio_query->the_post();
				
				if( isset( $style ) && $style == 'masonry' ) {
					$image_size = 'full';
				} else {
					if( isset( $columns ) && $columns == '2' ) {
						$image_size = 'portfolio-large';
					} else {
						$image_size = 'portfolio-mid';
					}
				}
				
				$portfolio_img = '';
				$portfolio_img = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), $image_size);
				
				$item_classes = '';
				$item_tags = get_the_terms($post->ID, 'portfolio_categories');
				if( $item_tags ) {
					foreach( $item_tags as $item_tag ) {
						$item_classes .= ' ' . urldecode($item_tag->slug);
					}
				}
				$portfolio_large = ''; 
				$portfolio_large = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full');
				$author_rating 	 = get_post_meta( $post->ID, 'zozo_author_rating', true );
				$custom_text 	 = get_post_meta( $post->ID, 'zozo_portfolio_custom_text', true );
						
				$output .= '<div id="portfolio-'.get_the_ID().'" class="portfolio-item '.$item_classes.' zozo-img-wrapper style-'.$style.'">';
				$output .= '<div class="portfolio-content">';
				
					// PORTFOLIO - CLASSIC
					if( isset( $style ) && $style == 'classic' ) {
						$output .= '<a href="'.esc_url( $portfolio_large[0] ).'" data-rel="prettyPhoto[gallery'.$portfolio_id.']" class="classic-img-link" title="'.get_the_title().'"><img class="img-responsive" src="'.esc_url($portfolio_img[0]).'" width="'.esc_attr($portfolio_img[1]).'" height="'.esc_attr($portfolio_img[2]).'" alt="'.get_the_title().'" /></a>';
						
						$output .= '<div class="portfolio-inner-wrapper">';
							$output .= '<div class="portfolio-inner-content">';
								if( isset( $custom_text ) && $custom_text != '' ) {
									$output .= '<h5><a href="'. get_permalink() .'" title="'.get_the_title().'">'.get_the_title().'</a><p class="portfolio-custom-text pull-right">'. $custom_text .'</p></h5>';
								} else {
									$output .= '<h5><a href="'. get_permalink() .'" title="'.get_the_title().'">'.get_the_title().'</a></h5>';
								}
								
								if( isset( $author_rating ) && $author_rating != '' ) {
									$output .= '<div class="portfolio-rating">';	
										$output .= '<div class="rateit" data-rateit-value="'.$author_rating.'" data-rateit-ispreset="true" data-rateit-readonly="true"></div>';
									$output .= '</div>';
								}
								if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
									if( isset( $excerpt_length ) && $excerpt_length != '' ) {
										$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), $excerpt_length )  . '</p>';
									} else {
										$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), 15 ) . '</p>';
									}
								}
								if( isset( $button_text ) && $button_text != '' ) {
									$output .= '<a href="'. get_permalink() .'" class="btn btn-more" title="'.get_the_title().'">'. $button_text .'</a>';
								}
								
							$output .= '</div>';
						$output .= '</div>';						
					} 
					// PORTFOLIO - MASONRY
					elseif ( isset( $style ) && $style == 'masonry' ) { 
						$output .= '<img class="img-responsive" src="'.esc_url($portfolio_img[0]).'" width="'.esc_attr($portfolio_img[1]).'" height="'.esc_attr($portfolio_img[2]).'" alt="'.get_the_title().'" />';
						
						$output .= '<div class="portfolio-overlay">';
							$output .= '<div class="portfolio-mask overlay-mask position-'. $overlay_position .'">';
								$output .= '<div class="portfolio-title">';
									$output .= '<h4>'.get_the_title().'</h4>';
									if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
										if( isset( $excerpt_length ) && $excerpt_length != '' ) {
											$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), $excerpt_length )  . '</p>';
										} else {
											$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), 8 ) . '</p>';
										}
									}
								$output .= '</div>';
								
								if( ( isset( $icon_zoom ) && $icon_zoom == 'yes' ) || ( isset( $icon_link ) && $icon_link == 'yes' ) ) {
									$overlay_class = '';
									if( isset( $icon_animations ) && $icon_animations != 'none' ) {
										$overlay_class = ' ' . $icon_animations;
									}
									
									$output .= '<ul class="overlay-buttons'. $overlay_class .'">';
									if( isset( $icon_zoom ) && $icon_zoom == 'yes' ) {
										$output .= '<li><a href="'.esc_url( $portfolio_large[0] ).'" class="pf-icon-zoom" data-rel="prettyPhoto[gallery'.$portfolio_id.']" title="'.get_the_title().'"><i class="fa fa-search"></i></a></li>';
										}
									if( isset( $icon_link ) && $icon_link == 'yes' ) {
										$output .= '<li><a href="'. get_permalink() .'" class="pf-icon-link" title="'.get_the_title().'"><i class="fa fa-link"></i></a></li>';
									}
									$output .= '</ul>';
								}
							$output .= '</div>';
						$output .= '</div>';
						
					} 
					// PORTFOLIO - DEFAULT, STYLE ONE, STYLE TWO (Content with BG Color)
					elseif ( isset( $style ) && $style != 'list_style' ) {
						$output .= '<div class="portfolio-image">';
							$output .= '<img class="img-responsive" src="'.esc_url($portfolio_img[0]).'" width="'.esc_attr($portfolio_img[1]).'" height="'.esc_attr($portfolio_img[2]).'" alt="'.get_the_title().'" />';
						$output .= '</div>';
							
						$output .= '<div class="portfolio-overlay">';
							$output .= '<div class="portfolio-mask overlay-mask position-'. $overlay_position .'">';
								if( isset( $style ) && $style == 'default' ) {
									$output .= '<div class="portfolio-title">';
										$output .= '<h4>'.get_the_title().'</h4>';
										if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
											if( isset( $excerpt_length ) && $excerpt_length != '' ) {
												$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), $excerpt_length ) . '</p>';
											} else {
												$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), 15 ) . '</p>';
											}
										}
									$output .= '</div>';
								}
								if( ( isset( $icon_zoom ) && $icon_zoom == 'yes' ) || ( isset( $icon_link ) && $icon_link == 'yes' ) ) {
									$overlay_class = '';
									if( isset( $icon_animations ) && $icon_animations != 'none' ) {
										$overlay_class = ' ' . $icon_animations;
									}
									
									$output .= '<ul class="overlay-buttons'. $overlay_class .'">';
									if( isset( $icon_zoom ) && $icon_zoom == 'yes' ) {
										$output .= '<li><a href="'.esc_url( $portfolio_large[0] ).'" class="pf-icon-zoom" data-rel="prettyPhoto[gallery'.$portfolio_id.']" title="'.get_the_title().'"><i class="fa fa-search"></i></a></li>';
										}
									if( isset( $icon_link ) && $icon_link == 'yes' ) {
										$output .= '<li><a href="'. get_permalink() .'" class="pf-icon-link" title="'.get_the_title().'"><i class="fa fa-link"></i></a></li>';
									}
									$output .= '</ul>';
								}
							$output .= '</div>';
						$output .= '</div>';
							
						if( isset( $style ) && $style == 'style_two' ) {
							$output .= '</div>';
						}
						if( isset( $style ) && $style != 'default' ) {	
							$output .= '<div class="portfolio-bottom">';
								$output .= '<div class="portfolio-title">';
									$output .= '<h4><a href="'. get_permalink() .'" title="'.get_the_title().'">'.get_the_title().'</a></h4>';
								$output .= '</div>';
								if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
									$output .= '<div class="portfolio-excerpts">';
										if( isset( $excerpt_length ) && $excerpt_length != '' ) {
											$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), $excerpt_length ) . '</p>';
										} else {
											$output .= '<p>' . zozo_content_stripped_excerpt( get_the_content(), 15 ) . '</p>';
										}
									$output .= '</div>';
								}
							$output .= '</div>';
						}
					}
					// PORTFOLIO - LIST STYLE
					if( isset( $style ) && $style == 'list_style' ) {
					$output .= '<div class="portfolio-list-wrapper row">';
						$output .= '<div class="portfolio-list-left col-md-7">';
							$output .= '<h4><a href="'. get_permalink() .'" title="'.get_the_title().'">'.get_the_title().'</a></h4>';
							$output .= '<p class="portfolio-custom-text">'. $custom_text .'</p>';
							
							if( isset( $show_excerpt ) && $show_excerpt == 'yes' ) {
								$output .= '<div class="portfolio-excerpts">';
									if( isset( $excerpt_length ) && $excerpt_length != '' ) {
										$output .= zozo_custom_wp_trim_excerpt( '', $excerpt_length );
									} else {
										$output .= zozo_custom_wp_trim_excerpt( '', 45 );
									}
								$output .= '</div>';
							}
							if( isset( $button_text ) && $button_text != '' ) {
								$output .= '<a href="'. get_permalink() .'" class="btn btn-more" title="'.get_the_title().'">'. $button_text .'</a>';
							}
						$output .= '</div>';
						
						$output .= '<div class="portfolio-list-right col-md-5">';
							$output .= '<a href="'.esc_url( $portfolio_large[0] ).'" class="pf-icon-zoom" data-rel="prettyPhoto[gallery'.$portfolio_id.']" title="'.get_the_title().'"><img class="img-responsive" src="'.esc_url($portfolio_img[0]).'" width="'.esc_attr($portfolio_img[1]).'" height="'.esc_attr($portfolio_img[2]).'" alt="'.get_the_title().'" /></a>';
						$output .= '</div>';
					$output .= '</div>';
					}
					if( isset( $style ) && $style != 'style_two' ) {
						$output .= '</div>';
					}
					
				$output .= '</div>';

			endwhile;
				
			$output .= '</div>';
				
			if( isset( $pagination ) && $pagination == 'yes' ) {
				$output .= zozo_pagination( $portfolio_query->max_num_pages, '' );
			}
			
			$output .= '</div>';
			
			$output .= '</div>';
		}		
		
		$portfolio_id++;
		wp_reset_postdata();
		
		return $output;
	}
}
add_shortcode( 'zozo_vc_portfolio_grid', 'zozo_vc_portfolio_grid_shortcode' );

if ( ! function_exists( 'zozo_vc_portfolio_grid_shortcode_map' ) ) {
	function zozo_vc_portfolio_grid_shortcode_map() {
		
		vc_map( 
			array(
				"name"					=> __( "Portfolio Grid", "zozothemes" ),
				"description"			=> __( "Show your works in grid with different style.", 'zozothemes' ),
				"base"					=> "zozo_vc_portfolio_grid",
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
						"heading"		=> __( "Portfolio Filters", "zozothemes" ),
						"param_name"	=> "filters",	
						"value"			=> array(
							__( "Yes", "zozothemes" )		=> "yes",
							__( "No", "zozothemes" )		=> "no" ),
						"group"			=> __( 'Filters', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Portfolio Filters Type", "zozothemes" ),
						"param_name"	=> "filter_type",
						"dependency" 	=> array(
							"element" 	=> "filters",
							"value" 	=> "yes",
						),
						"value"			=> array(
							__( "Default", "zozothemes" )		=> "default",
							__( "Icon Type", "zozothemes" )		=> "icon_type" ),
						"group"			=> __( 'Filters', 'zozothemes' ),
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
						"group"			=> __( 'Filters', 'zozothemes' ),
						"dependency" 	=> array(
							"element" 	=> "filter_type",
							"value" 	=> "icon_type",
						),
					),					
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Filter Icon", "zozothemes" ),
						"param_name" 	=> "icon_fontawesome",
						"value" 		=> "",
						"settings" 		=> array(
							"emptyIcon" 	=> true,
							"iconsPerPage" 	=> 4000,
						),
						"dependency" 	=> array(
							"element" 	=> "type",
							"value" 	=> "fontawesome",
						),
						"description" 	=> __( "Select icon from library.", "zozothemes" ),
						"group"			=> __( 'Filters', 'zozothemes' ),
					),				
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Filter Icon", "zozothemes" ),
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
						"group"			=> __( 'Filters', 'zozothemes' ),
					),
					array(
						"type" 			=> 'iconpicker',
						"heading" 		=> __( "Filter Icon", "zozothemes" ),
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
						"group"			=> __( 'Filters', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Filters Alignment", "zozothemes" ),
						"param_name"	=> "filter_align",
						"value"			=> array(
							__( "Default", "zozothemes" )	=> "",
							__( "Center", "zozothemes" )	=> "center",
							__( "Left", "zozothemes" )		=> "left",
							__( "Right", "zozothemes" )		=> "right",
						),
						"group"			=> __( 'Filters', 'zozothemes' ),
					),
					array(
						"type"			=> 'textfield',
						"heading"		=> __( "Portfolio First Filter", "zozothemes" ),
						"param_name"	=> "first_filter",
						"description" 	=> __( 'Enter the slug of category (only one) to show elements from that category on page load. Enter "all" to show from all categories.', 'zozothemes' ),
						"group"			=> __( 'Filters', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Portfolio Type", "zozothemes" ),
						"param_name"	=> "style",
						"admin_label" 	=> true,
						"value"			=> array(
							__( "Default", "zozothemes" )		=> "default",
							__( "Classic", "zozothemes" )		=> "classic",
							__( "Masonry", "zozothemes" )		=> "masonry",
							__( "Style One", "zozothemes" )		=> "style_one",
							__( "Style Two", "zozothemes" )		=> "style_two",
							__( "List Style", "zozothemes" )	=> "list_style",
						),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Portfolio Columns", "zozothemes" ),
						"param_name"	=> "columns",
						"value"			=> array(
							__( "Two Columns", "zozothemes" )		=> "2",
							__( "Three Columns", "zozothemes" )		=> "3",
							__( "Four Columns", "zozothemes" )		=> "4" ),
						'dependency'	=> array(
							'element'	=> 'style',
							'value'		=> array( 'default', 'classic', 'masonry', 'style_one', 'style_two' ),
						),
						"description" 	=> __( "Select Columns type for Portfolio", "zozothemes" ),
					),	
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Portfolio List Columns", "zozothemes" ),
						"param_name"	=> "list_columns",
						"value"			=> array(
							__( "One Columns", "zozothemes" )		=> "1",
							__( "Two Columns", "zozothemes" )		=> "2",
							__( "Three Columns", "zozothemes" )		=> "3",
							__( "Four Columns", "zozothemes" )		=> "4" ),
						'dependency'	=> array(
							'element'	=> 'style',
							"value" 	=> 'list_style',
						),
						"description" 	=> __( "Select Columns type for List Style Portfolio", "zozothemes" ),
					),		
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Items Spacing", "zozothemes" ),
						"param_name"	=> "gutter",
						"description" 	=> __( "Enter gap size between portfolio items. Only enter number Ex: 10", "zozothemes" ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Zoom Icons", "zozothemes" ),
						"param_name"	=> "icon_zoom",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "yes",
							__( "No", "zozothemes" )	=> "no",
						),
						"description" 	=> __( "Enable/Disable for Overlay Zoom Icon", "zozothemes" ),
						"group"			=> __( 'Overlay', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Show Link Icons", "zozothemes" ),
						"param_name"	=> "icon_link",
						"value"			=> array(
							__( "Yes", "zozothemes" )	=> "yes",
							__( "No", "zozothemes" )	=> "no",
						),
						"description" 	=> __( "Enable/Disable for Overlay Link Icon", "zozothemes" ),
						"group"			=> __( 'Overlay', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Icons Animation", "zozothemes" ),
						"param_name"	=> "icon_animations",
						"value"			=> array(
							__( "None", "zozothemes" )			=> "none",
							__( "Fade Up", "zozothemes" )		=> "fade-up",
							__( "Fade Down", "zozothemes" )		=> "fade-down",
							__( "Fade Right", "zozothemes" )	=> "fade-right",
							__( "Fade Left", "zozothemes" )		=> "fade-left",
							__( "Zoom In", "zozothemes" )		=> "zoom-in",
							__( "Flip X", "zozothemes" )		=> "flip-x",
							__( "Flip Y", "zozothemes" )		=> "flip-y",
						),
						"description" 	=> __( "Enable/Disable for Overlay Icon Animations", "zozothemes" ),
						"group"			=> __( 'Overlay', 'zozothemes' ),
					),
					array(
						"type"			=> 'dropdown',
						"heading"		=> __( "Overlay Position", "zozothemes" ),
						"param_name"	=> "overlay_position",
						"value"			=> array(
							__( "Default", "zozothemes" )		=> "center",
							__( "Top", "zozothemes" )			=> "top",
							__( "Bottom", "zozothemes" )		=> "bottom",
							__( "Right", "zozothemes" )			=> "right",
							__( "Left", "zozothemes" )			=> "left",
							__( "Top Right", "zozothemes" )		=> "top-right",
							__( "Top Left", "zozothemes" )		=> "top-left",
							__( "Bottom Right", "zozothemes" )	=> "bottom-right",
							__( "Bottom Left", "zozothemes" )	=> "bottom-left",
						),
						"description" 	=> __( "Choose Overlay Content Positions", "zozothemes" ),
						"group"			=> __( 'Overlay', 'zozothemes' ),
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
						"type"			=> 'dropdown',
						"heading"		=> __( "Order By", "zozothemes" ),
						"param_name"	=> "orderby",
						"value"			=> array(
							__( "Title", "zozothemes" )		=> "title",
							__( "ID", "zozothemes" )		=> "id",
							__( "Random", "zozothemes" )	=> "random",
							__( "Post Date", "zozothemes" )	=> "post_date",
							__( "Rating", "zozothemes" )	=> "rating",
						),
						'dependency'	=> array(
							'element'	=> 'style',
							"value" 	=> array( "classic" ),
						),
					),			
					array(
						"type"			=> "textfield",
						"heading"		=> __( "Button Text", "zozothemes" ),
						"param_name"	=> "button_text",
						"description" 	=> __( "Enter button text.", "zozothemes" ),
						'dependency'	=> array(
							'element'	=> 'style',
							"value" 	=> array( "classic", "list_style" ),
						),
					),
				)
			) 
		);
	}
}
add_action( 'vc_before_init', 'zozo_vc_portfolio_grid_shortcode_map' );