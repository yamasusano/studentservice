<?php
/**
 * Single Services Page
 *
 * @package Zozothemes
 */
 
get_header();
?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<?php if ( have_posts() ):
						while ( have_posts() ): the_post();
							$zozo_services_gallery = '';
							$zozo_services_gallery = get_post_meta( $post->ID, 'zozo_gallery_images', true ); ?>

							<div id="services-content-wrap" class="services-single clearfix">										
								<div <?php post_class(); ?> id="services-<?php the_ID(); ?>">
									<?php if( $zozo_services_gallery != '' ) {
									
										$services_images = explode(',', $zozo_services_gallery);
										
										$gallery_attr = '';
										if( zozo_get_theme_option( 'zozo_service_citems' ) != '' ) {
											$gallery_attr .= ' data-items=' . zozo_get_theme_option( 'zozo_service_citems' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_citems_scroll' ) != '' ) {
											$gallery_attr .= ' data-slideby=' . zozo_get_theme_option( 'zozo_service_citems_scroll' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_ctablet' ) != '' ) {
											$gallery_attr .= ' data-items-tablet=' . zozo_get_theme_option( 'zozo_service_ctablet' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cmobile_land' ) != '' ) {
											$gallery_attr .= ' data-items-mobile-landscape=' . zozo_get_theme_option( 'zozo_service_cmobile_land' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cmobile' ) != '' ) {
											$gallery_attr .= ' data-items-mobile-portrait=' . zozo_get_theme_option( 'zozo_service_cmobile' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cautoplay' ) == 1 ) {
											$gallery_attr .= ' data-autoplay=true ';
										} else {
											$gallery_attr .= ' data-autoplay=false ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_ctimeout' ) != '' ) {
											$gallery_attr .= ' data-autoplay-timeout=' . zozo_get_theme_option( 'zozo_service_ctimeout' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cloop' ) == 1 ) {
											$gallery_attr .= ' data-loop=true ';
										} else {
											$gallery_attr .= ' data-loop=false ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cmargin' ) != '' ) {
											$gallery_attr .= ' data-margin=' . zozo_get_theme_option( 'zozo_service_cmargin' ) . ' ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cpagination' ) == 1 ) {
											$gallery_attr .= ' data-pagination=true ';
										} else {
											$gallery_attr .= ' data-pagination=false ';
										}
										
										if( zozo_get_theme_option( 'zozo_service_cnavigation' ) == 1 ) {
											$gallery_attr .= ' data-navigation=true ';
										} else {
											$gallery_attr .= ' data-navigation=false ';
										} ?>										
																			
										<div id="single-services-slider" class="zozo-owl-carousel owl-carousel services-gallery single-services-slider"<?php echo esc_attr( $gallery_attr ); ?>>
										<?php foreach( $services_images as $image ) {
												$src  = wp_get_attachment_image_src( $image, 'full' );
												$src  = $src[0]; ?>
												<div class="single-services-item">
													<img src="<?php echo esc_url( $src ); ?>" alt="<?php the_title(); ?>" title="<?php the_title(); ?>">
												</div>
										<?php } ?>
										</div>
									<?php } else {
										$services_full_img = wp_get_attachment_image_src(get_post_thumbnail_id($post->ID), 'full'); ?>
										<div class="services-gallery services-image">
											<img class="img-responsive" src="<?php echo esc_url( $services_full_img[0] ); ?>" alt="<?php the_title(); ?>" />
										</div>
									<?php } ?>
									
									<div class="services-single-content-wrapper">
										<div class="entry-content">
											<?php the_content(); ?>
										</div>
									</div>
								</div>
							</div><!-- #services-content-wrap -->
								
						<?php endwhile;
						
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