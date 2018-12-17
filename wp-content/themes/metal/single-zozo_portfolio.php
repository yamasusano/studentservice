<?php
/**
 * Single Portfolio Page
 *
 * @package Zozothemes
 */

get_header();

$zozo_portfolio = $zozo_options_count = '';
$zozo_portfolio 	= get_post_meta( $post->ID, 'zozoportfolio_options', true );
$zozo_options_count = get_post_meta( $post->ID, 'zozo_portfolio_section_count', true );

if( $zozo_options_count != '' || $zozo_options_count != 0 ) {
	// Slider Configuration
	$data_attr = '';
	$data_attr .= ' data-items=1 ';
	$data_attr .= ' data-slideby=1 ';
	$data_attr .= ' data-items-tablet=1 ';
	$data_attr .= ' data-items-mobile-landscape=1 ';
	$data_attr .= ' data-items-mobile-portrait=1 ';
	$data_attr .= ' data-autoplay=false ';
	$data_attr .= ' data-video=true ';
	$data_attr .= ' data-lazyload=false ';
	$data_attr .= ' data-margin=0 ';
	
	if( $zozo_options_count > 1 ) {
		$data_attr .= ' data-loop=true ';
		$data_attr .= ' data-pagination=false ';
		$data_attr .= ' data-navigation=true ';
	} else {
		$data_attr .= ' data-loop=false ';
		$data_attr .= ' data-pagination=false ';
		$data_attr .= ' data-navigation=false ';
	} ?>
	
	<div id="single-portfolio-slider" class="zozo-owl-carousel owl-carousel portfolio-gallery single-portfolio-slider"<?php echo esc_attr( $data_attr ); ?>>
											
		<?php for( $opt=1; $opt<=$zozo_options_count; $opt++ ) {
			if( $zozo_portfolio['portfolio_image'][$opt] != '' || $zozo_portfolio['portfolio_video'][$opt] != '' ) {
				if( $zozo_portfolio['portfolio_image'][$opt] != '' ) { 
					$portfolio_sized_image = wp_get_attachment_image_src( $zozo_portfolio['portfolio_image_attach_id'][$opt], 'portfolio-single'); ?>
					<div class="single-portfolio-item">
						<img src="<?php echo esc_url( $portfolio_sized_image[0] ); ?>" alt="<?php echo esc_attr( $zozo_portfolio['portfolio_item_title'][$opt] ); ?>" title="<?php echo esc_attr( $zozo_portfolio['portfolio_item_title'][$opt] ); ?>">
					</div>
				<?php } elseif ( $zozo_portfolio['portfolio_video'][$opt] != '' ) {

					$portfolio_videotype = "";
					if( isset($zozo_portfolio['portfolio_video_type'][$opt]) ) {
						$portfolio_videotype = $zozo_portfolio['portfolio_video_type'][$opt];
					}
					
					switch( $portfolio_videotype ) {
						case 'youtube': ?>
							<div class="single-portfolio-item item-video item-youtube">
								<a class="owl-video" href="https://www.youtube.com/watch?v=<?php echo esc_attr( $zozo_portfolio['portfolio_video'][$opt] );?>"></a>
							</div>
						<?php break;
						
						case "vimeo": ?>
							<div class="single-portfolio-item item-video item-vimeo">
								<a class="owl-video" href="http://vimeo.com/<?php echo esc_attr( $zozo_portfolio['portfolio_video'][$opt] ); ?>"></a>
							</div>
						<?php break;					
					}
				}
			}
		} ?>
		
	</div>
<?php } else {
	$portfolio_full_img = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'portfolio-single'); ?>
	<div class="portfolio-gallery portfolio-image">
		<img class="img-responsive" src="<?php echo esc_url( $portfolio_full_img[0] ); ?>" alt="<?php the_title(); ?>" />
	</div>
<?php } ?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<?php if ( have_posts() ):
						while ( have_posts() ): the_post();
							$portfolio_date = $portfolio_client = $portfolio_share = '';
							
							$portfolio_date = get_post_meta( $post->ID, 'zozo_portfolio_date', true );
							$portfolio_client = get_post_meta( $post->ID, 'zozo_portfolio_client', true );
							// Estimation
							$portfolio_estimation = get_post_meta( $post->ID, 'zozo_portfolio_estimation', true );
							// Duration
							$portfolio_duration = get_post_meta( $post->ID, 'zozo_portfolio_duration', true );
							$author_rating 	 = get_post_meta( $post->ID, 'zozo_author_rating', true );
							$portfolio_custom_text = get_post_meta( $post->ID, 'zozo_portfolio_custom_text', true );
							$portfolio_btn_text = get_post_meta( $post->ID, 'zozo_portfolio_button_text', true );
							$portfolio_btn_url = get_post_meta( $post->ID, 'zozo_portfolio_button_url', true );
							$portfolio_share = get_post_meta( $post->ID, 'zozo_portfolio_share', true ); 
							
							if( isset( $portfolio_btn_text ) && $portfolio_btn_text == '' ) {
								$portfolio_btn_text = __( 'View Project', 'zozothemes' );
							} ?>

							<div id="portfolio-content-wrap" class="portfolio-single clearfix">										
								<div <?php post_class(); ?> id="portfolio-<?php the_ID(); ?>">
									<div class="row">
										<div class="col-md-4 col-xs-12">
											<!-- ============ Portfolio Details ============ -->
											<div class="portfolio-details">
												<?php if( isset( $portfolio_custom_text ) && $portfolio_custom_text != '' ) { ?>
													<div class="portfolio-box">
														<h5 class="portfolio-custom-text"><?php echo force_balance_tags( $portfolio_custom_text ); ?></h5>
													</div>
												<?php } ?>
												<?php if( isset( $author_rating ) && $author_rating != '' ) { ?>
													<div class="portfolio-box">
														<div class="portfolio-rating">
															<div class="rateit" data-rateit-value="<?php echo esc_attr( $author_rating ); ?>" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
														</div>
													</div>
												<?php } ?>
												<?php if(get_the_term_list($post->ID, 'portfolio_categories', '', ',', '')) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Category:', 'zozothemes') ?></strong>
														<span class="portfolio-terms">
															<?php echo get_the_term_list($post->ID, 'portfolio_categories', '', ', ', ''); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if( isset( $portfolio_client ) && $portfolio_client != '' ) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Client:', 'zozothemes') ?></strong>
														<span class="portfolio-client">
															<?php echo esc_attr( $portfolio_client ); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if( isset( $portfolio_date ) && $portfolio_date != '' ) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Date:', 'zozothemes') ?></strong>
														<span class="portfolio-date">
															<?php echo esc_attr( $portfolio_date ); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if( isset( $portfolio_estimation ) && $portfolio_estimation != '' ) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Estimation:', 'zozothemes') ?></strong>
														<span class="portfolio-estimation">
															<?php echo esc_attr( $portfolio_estimation ); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if( isset( $portfolio_duration ) && $portfolio_duration != '' ) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Duration:', 'zozothemes') ?></strong>
														<span class="portfolio-duration">
															<?php echo esc_attr( $portfolio_duration ); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if(get_the_term_list($post->ID, 'portfolio_tags', '', ',', '')) { ?>
													<div class="portfolio-box">
														<p><strong><?php esc_html_e('Tags:', 'zozothemes') ?></strong>
														<span class="portfolio-terms">
															<?php echo get_the_term_list($post->ID, 'portfolio_tags', '', ', ', ''); ?>
														</span></p>
													</div>
												<?php } ?>
												<?php if( isset( $portfolio_btn_url ) && $portfolio_btn_url != '' ) { ?>
													<div class="portfolio-box">
														<div class="portfolio-custom-link">
															<a href="<?php echo esc_url( $portfolio_btn_url ); ?>" target="_blank" class="btn btn-default"><?php echo esc_attr( $portfolio_btn_text ); ?></a>
														</div>
													</div>
												<?php } ?>
										
											<!-- ============ Portfolio Sharing ============ -->
											<?php if( isset( $portfolio_share ) && $portfolio_share == 1 ) { ?>
												<div class="zozo-social-share-wrapper portfolio-sharing">
													<?php zozo_display_social_sharing_icons(); ?>
												</div>
											<?php } ?>
										</div>										
									</div>
									
									<div class="col-md-8 col-xs-12">
										<div class="portfolio-content-area">
											<div class="portfolio-content">
												<?php the_content(); ?>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
								
						<?php if( zozo_get_theme_option( 'zozo_portfolio_prev_next' ) == 1 ) {
							zozo_postnavigation();
						}
						
						if( zozo_get_theme_option( 'zozo_portfolio_related_slider' ) == 1 ) { ?>
							<?php zozo_related_portfolio_slider(); ?>
						<?php }
						
						endwhile;
						
						else : ?>
							<?php get_template_part( 'content', 'none' ); ?>
						<?php endif; ?>
					</div><!-- #content -->
				</div><!-- #primary -->
		
				<?php get_sidebar(); ?>	
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar( 'second' ); ?>

	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>