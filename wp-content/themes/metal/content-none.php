<?php
/**
 * No Posts found Template
 *
 * It is used to display not found posts
 *
 * @package Zozothemes
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<div class="post-inner-wrapper">
		<div class="posts-content-container">
			<div class="entry-header">			   
				<h1 class="entry-title"><?php _e('Nothing Found', 'zozothemes'); ?></h1>			
			</div><!-- .entry-header -->
			<div class="entry-content">
				<p><?php _e('Sorry, but no posts matched your search terms.', 'zozothemes'); ?></p>
			</div><!-- .entry-content -->
		</div><!-- .posts-content-container -->		
	</div><!-- .post-inner-wrapper -->
</article><!-- #post -->