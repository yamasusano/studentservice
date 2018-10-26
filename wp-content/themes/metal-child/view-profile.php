<?php
/**
 * Template Name: View User Profile Template.
 */
 get_header();
 require 'includes/core/profile/profile-view.php';
 $user_id = $_GET['user-id'];
 ?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<div class="container"><h3><?php echo userInfo('role', $user_id); ?> Profile</h3><b><?php echo getSemester(); ?></b>
                            <div class="row profile">
                                <div class="col-md-3">
                                    <div class="profile-sidebar">
                                        <!-- SIDEBAR USERPIC -->
                                        <div class="profile-userpic">
                                            <?php echo get_avatar($current_user->user_email); ?>
                                        </div>
                                        <!-- END SIDEBAR USERPIC -->
                                        <!-- SIDEBAR USER TITLE -->
                                        <div class="profile-usertitle">
                                            <div class="profile-usertitle-name">
                                                <?php echo userInfo('username', $user_id); ?>
                                            </div>
                                            <div class="profile-usertitle-job">
                                                <?php if (empty(userInfo('major', $user_id))) {
     echo 'major';
 } else {
     echo userInfo('major', $user_id);
 }

                                                ?>
                                            </div>
                                        </div>
                                        <!-- END MENU -->
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div id="profile-contents" class="profile-content">
                                        <?php echo viewDetail($user_id); ?>
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