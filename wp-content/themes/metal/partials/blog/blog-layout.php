<?php
/**
 * Fullwidth Post Template
 *
 * It is used to display the content for Large Layout
 *
 * @package Zozothemes
 */

global $post;

if( has_post_format('link') ) {
	$external_url = '';
	$external_url = get_post_meta( $post->ID, 'zozo_external_link_url', true );
	if( isset( $external_url ) && $external_url == '' ) {
		$external_url = get_permalink( $post->ID );
	}
} 

if( ! isset( $post_class ) || isset( $post_class ) && $post_class == '' ) {
	$post_class = '';
} ?>

<article id="post-<?php the_ID(); ?>" <?php post_class($post_class); ?>>
	<div class="post-inner-wrapper">
		
		<?php include( locate_template( 'partials/blog/post-slider.php' ) ); ?>
		
		<div class="posts-content-container">
		<?php if( has_post_format('quote') ) { ?>			
			<!-- ========== Entry Content ========== -->			
			<div class="entry-summary clearfix">
				<div class="entry-quotes quote-format">
					<blockquote>
						<?php echo zozo_custom_wp_trim_excerpt('', $excerpt_limit); ?>
						<!-- ========== Title ========== -->
						<footer>
							<h2 class="entry-title">
								<a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a>
							</h2>
						</footer>
					</blockquote>
					<?php wp_link_pages( array(
							'before'      => '<div class="page-links"><span class="page-links-title">' . esc_html__( 'Pages:', 'zozothemes' ) . '</span>',
							'after'       => '</div>',
							'link_before' => '<span>',
							'link_after'  => '</span>',
						) );
					?>
				</div>
			</div><!-- .entry-summary -->
		<?php } else { ?>
			<!-- ========== Title ========== -->
			<div class="entry-header">
				<h2 class="entry-title">
					<?php if( has_post_format('link') ) { ?>
						<a href="<?php echo esc_url($external_url); ?>" rel="bookmark" title="<?php the_title(); ?>" target="_blank"><?php the_title(); ?></a>
					<?php } else { ?>
						<a href="<?php the_permalink(); ?>" rel="bookmark" title="<?php the_title(); ?>"><?php the_title(); ?></a>
					<?php } ?>
				</h2>
			</div><!-- .entry-header -->
			
			<!-- ========== Entry Content ========== -->
			<div class="entry-summary clearfix">
				<?php echo zozo_custom_wp_trim_excerpt('', $excerpt_limit); ?>
				<?php wp_link_pages( array(
						'before'      => '<div class="page-links"><span class="page-links-title">' . esc_html__( 'Pages:', 'zozothemes' ) . '</span>',
						'after'       => '</div>',
						'link_before' => '<span>',
						'link_after'  => '</span>',
					) );
				?>
			</div><!-- .entry-summary -->
			
			<!-- ========== Entry Meta ========== -->
			<div class="entry-meta-wrapper">
				<!-- ========== Read More Link ========== -->				
				<?php if( ! zozo_get_theme_option( 'zozo_blog_read_more' ) ) { ?>
					<div class="read-more">
						<?php if( has_post_format('link') ) { ?>
							<a href="<?php echo esc_url($external_url); ?>" class="btn-more read-more-link" target="_blank">
						<?php } else { ?>
							<a href="<?php the_permalink(); ?>" class="btn-more read-more-link">
						<?php } ?>
						
						<?php if( ! zozo_get_theme_option( 'zozo_blog_read_more_text' ) ) { 
							esc_html_e('Read more', 'zozothemes'); 
						} else { 
							echo esc_attr( zozo_get_theme_option( 'zozo_blog_read_more_text' ) ); 
						} ?>
						
						</a>
					</div>
				<?php } ?>
				
				<div class="entry-meta">
					<!-- Sticky Post -->
					<?php if ( is_sticky() && is_home() && ! is_paged() ) { ?>
						<div class="sticky-post"><i class="simple-icon icon-pin"></i> <span class="meta-name"><?php esc_html_e('Featured', 'zozothemes'); ?></span></div>						
					<?php } ?>
					<!-- Comments -->
					<?php if( ! zozo_get_theme_option( 'zozo_blog_post_meta_comments' ) ): ?>
						<?php if ( comments_open() ) { ?>
							<div class="comments-link"><i class="simple-icon icon-bubbles"></i><?php comments_popup_link( '<span class="leave-reply">' . esc_html__( '0', 'zozothemes' ) . '</span>', esc_html__( '1', 'zozothemes' ), esc_html__( '%', 'zozothemes' ) ); ?>
						</div>
						<?php }
					endif; ?>
				</div>
			</div>
		<?php } ?>
		</div><!-- .posts-content-container -->	
		
	</div><!-- .post-inner-wrapper -->
</article><!-- #post -->