<?php
/**
 * Post Slider or Featured Image
 */

global $post; 

if( ! isset( $image_size ) || isset( $image_size ) && $image_size == '' ) {
	$image_size = 'blog-large';
} 

// Slider Configuration
$data_attr = '';

if( zozo_get_theme_option( 'zozo_blog_slideshow_autoplay' ) == 1 ) {
	$data_attr .= ' data-autoplay=true ';
} else {
	$data_attr .= ' data-autoplay=false ';
}

if( zozo_get_theme_option( 'zozo_blog_slideshow_timeout' ) != '' ) {
	$data_attr .= ' data-autoplay-timeout=' . zozo_get_theme_option( 'zozo_blog_slideshow_timeout' ) . ' ';
}

// Gallery Slider
if( is_single() ) {
	if( isset( $gallery_images_type ) && $gallery_images_type == 'carousel' ) {
		$gallery_attr = '';
	
		if( zozo_get_theme_option( 'zozo_single_blog_citems' ) != '' ) {
			$gallery_attr .= ' data-items=' . zozo_get_theme_option( 'zozo_single_blog_citems' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_citems_scroll' ) != '' ) {
			$gallery_attr .= ' data-slideby=' . zozo_get_theme_option( 'zozo_single_blog_citems_scroll' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_ctablet' ) != '' ) {
			$gallery_attr .= ' data-items-tablet=' . zozo_get_theme_option( 'zozo_single_blog_ctablet' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cmlandscape' ) != '' ) {
			$gallery_attr .= ' data-items-mobile-landscape=' . zozo_get_theme_option( 'zozo_single_blog_cmlandscape' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cmportrait' ) != '' ) {
			$gallery_attr .= ' data-items-mobile-portrait=' . zozo_get_theme_option( 'zozo_single_blog_cmportrait' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cautoplay' ) == 1 ) {
			$gallery_attr .= ' data-autoplay=true ';
		} else {
			$gallery_attr .= ' data-autoplay=false ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_ctimeout' ) != '' ) {
			$gallery_attr .= ' data-autoplay-timeout=' . zozo_get_theme_option( 'zozo_single_blog_ctimeout' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cloop' ) == 1 ) {
			$gallery_attr .= ' data-loop=true ';
		} else {
			$gallery_attr .= ' data-loop=false ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cmargin' ) != '' ) {
			$gallery_attr .= ' data-margin=' . zozo_get_theme_option( 'zozo_single_blog_cmargin' ) . ' ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cdots' ) == 1 ) {
			$gallery_attr .= ' data-pagination=true ';
		} else {
			$gallery_attr .= ' data-pagination=false ';
		}
		
		if( zozo_get_theme_option( 'zozo_single_blog_cnav' ) == 1 ) {
			$gallery_attr .= ' data-navigation=true ';
		} else {
			$gallery_attr .= ' data-navigation=false ';
		}
	}
}

$audio_code = $video_code = '';
$audio_code = get_post_meta( $post->ID, 'zozo_single_audio_code', true );
$video_code = get_post_meta( $post->ID, 'zozo_single_video_code', true );
?>

<?php if ( has_post_thumbnail() && ! post_password_required() ) {

	if( has_post_format('gallery') ) { ?>
	
		<div class="post-featured-image featured-gallery-slider">
			<div class="entry-thumbnail-wrapper">
				<?php if( is_single() && isset( $gallery_images_type ) && $gallery_images_type == 'carousel' ) { ?>
					<div class="entry-thumbnail zozo-owl-carousel blog-single-carousel-slider"<?php echo esc_attr( $gallery_attr ); ?>>
						<?php get_gallery_post_images( 'blog-medium', $post->ID ); ?>
					</div>
				<?php } else { ?>
					<div class="entry-thumbnail blog-carousel-slider"<?php echo esc_attr( $data_attr ); ?>>
						<?php get_gallery_post_images( $image_size, $post->ID ); ?>
					</div>
				<?php } ?>
			</div>
		</div>
		
	<?php } else { 
	
		if( is_single() && ( has_post_format('audio') || has_post_format('video') ) ) { 
			if( has_post_format('audio') && $audio_code != '' ) { ?>
				<!-- ========== Audio Player ========== -->
				<div class="audio-player blog-audio-player">
					<?php echo do_shortcode( $audio_code ); ?>
				</div>			
			<?php } else if( has_post_format('video') && $video_code != '' ) { ?>
				<div class="video-player blog-video-player">
					<?php echo do_shortcode( $video_code ); ?>
				</div>
			<?php } 
		} else { ?>

		<div class="post-featured-image only-image">
			<div class="entry-thumbnail-wrapper">
				<div class="entry-thumbnail">
					<?php if( ! is_single() ) {
						if( has_post_format('link') ) { ?>
						<a href="<?php echo esc_url($external_url); ?>" title="<?php the_title(); ?>" target="_blank" class="post-img">
					<?php } else { ?>
						<a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>" class="post-img">
					<?php } 
					} ?>
					
					<?php the_post_thumbnail( $image_size ); ?>
					
					<?php if( ! is_single() ) { ?>
						</a>
					<?php } ?>
				</div>
			</div>
		</div>
		
		<?php } ?>
		
	<?php } ?>
	
<?php } else if ( ! has_post_thumbnail() ) { 

	if( has_post_format('audio') ) { ?>
		<!-- ========== Audio Player ========== -->
		<div class="audio-player blog-audio-player">
			<?php echo do_shortcode( get_post_meta( $post->ID, 'zozo_single_audio_code', true ) ); ?>
		</div>
	<?php } 
	
	else if( has_post_format('video') ) { ?>
		<div class="video-player blog-video-player">
			<?php echo do_shortcode( get_post_meta( $post->ID, 'zozo_single_video_code', true ) ); ?>
		</div>
	<?php } ?>
	
<?php } ?>