<?php
/**
 * Template Name: Export Order TO PDF Template.
 */
get_header(); ?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						
					</div><!-- #content -->
				</div><!-- #primary -->
			
				<?php get_sidebar(); ?>
				
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second'); ?>
		
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>