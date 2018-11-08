<?php
/**
 * Template Name: View User Profile Template.
 */
 get_header();
 include 'includes/core/profile/profile-view.php';
 ?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<div class="container"><b><?php echo getSemester(); ?></b>
                            <div class="row">
								<?php $user_id = $_GET['user-id'];
                                echo viewDetail($user_id); ?>
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