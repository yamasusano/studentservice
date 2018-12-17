<?php
/**
 * Template Name: Result Search Form Template.
 */
get_header();
require_once 'includes/core/filter-view.php';
?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>" style="background:#f5f5f5">
					<div id="content" class="site-content"style="padding-top: 30px;">
						<div class="my-container">
							<div class="filter-box">
								<div class="filter-box-search">
									<?php do_action('filter_section'); ?>
								</div>
							</div>
							<div class="message-search-box">
							<?php  do_action('result_searchs', 'count'); ?>
							</div>	
							<div style="overflow:hidden">
								<div class="content-result-search col-lg-9">
									<?php  do_action('result_searchs', 'result'); ?>
									<div class="pagination">	
										<?php  do_action('result_searchs', 'pagination'); ?>
									</div>
								</div>
								<div class="col-lg-3" style="padding-right: 0;">
									<h6>New Feed</h6>
									<div class="support-student-ideas">
										<?php do_action('new-feed'); ?>
									</div>
								</div>
							</div>	
						</div>
					</div>
					</div><!-- #content -->
				</div><!-- #primary -->
			
				<?php get_sidebar(); ?>
				
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second'); ?>
		
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>