<?php
/**
 * Template Name: Form Detail Template.
 */
require 'includes/core/group/form-view.php';
get_header();
$form_id = $_GET['form-id'];
?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<div class="my-container">
                            <div class="row">
								<?php echo formView($form_id); ?>
								<div class="message">
									<?php if (isset($_POST['btn-join-form'])) {
    do_action('join_action');
}
                                    ?>
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