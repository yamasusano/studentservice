<?php
/**
 * Template Name: Home Template.
 */
include 'includes/core/group/finder-form-list-view.php';
require_once 'includes/core/filter-view.php';
get_header();
?>
<div class="container">
	<input type="hidden" name="current-user-id" id ="current-user-id" value="<?php echo get_current_user_id(); ?>">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content" style="padding-top:0px;">
						<div class="row">
							<div class="container">
								<div class="row">
									<div class="col-lg-12">
										<div class="row">
											<div class="home-filter" style='background-image:url("<?php echo backgroundImage(); ?>")'>
												<div class="collapse in search-box col-md-11 col-sm-10 col-xs-10">
													<?php echo displayFilter(); ?>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-12">								
										<div class="list-view-items">
											<div class="row">
											<?php echo form_by_major(); ?>
												<div class="my-container">
													<?php echo get_post_fanpage(); ?>
													<?php echo current_semster_form(); ?>
												</div>
											</div>		
										</div>
									</div>
								</div>
							</div>
						</div><!-- #content -->
					</div>
				</div><!-- #primary -->

				<?php get_sidebar(); ?>

			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second'); ?>

	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>