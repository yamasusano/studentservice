<?php
/**
 * Template Name: Form Detail Template.
 */
require 'includes/core/group/form-view.php';
get_header();
$form_id = $_GET['form-id'];
$check = form_exception($form_id);
?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<?php if ($check) {
    ?>
						<div class="my-container">
                            <div class="row">
								<form id="send-request" action="#" method="POST">
									<?php echo formView($form_id); ?>
									<?php handle_request_form($form_id); ?>
									<div class="submit-request">
									<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
									<div class="postion-apply-request">
										<span>Apply for a postion</span><?php echo member_select_position($form_id); ?>	
									</div>
									<textarea name="message" id="request-message" maxlength="200" cols="58" rows="4" placeholder="Send something here for leader ..."></textarea>
									<div style="float:right"><span id="chars">200 </span>characters remaining.</div>
									<div class="button-box"><?php echo get_btn_case('join'); ?></div>
									</div>
								</form>
							</div>							
						</div>
						<div class="other-form">
							<div class="my-container">
								<div class="col-lg-6 related-topic">
										<h6>Related Topic</h6>
										<?php echo related_topic($form_id); ?>
								</div>		
								<div class="col-lg-6 related-semester">
								<h6>Related Semester</h6>
										<?php echo related_semester($form_id); ?>
								</div>
							</div>
						</div>
						<?php
} else {
        form_not_found();
    } ?>
					</div><!-- #content -->
				</div><!-- #primary -->
				<?php get_sidebar(); ?>
				
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second'); ?>
		
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>