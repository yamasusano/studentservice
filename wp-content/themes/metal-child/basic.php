<?php
/**
 * Template Name: Export Order TO PDF Template
 *
 * @package Zozothemes
 */

get_header(); ?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
						<?php 
							if(is_user_logged_in() ){
                            $current_user = wp_get_current_user();
                            $user_id = $_POST['user-id'];
							if (user_can( $current_user, 'administrator' )) {?>
								<div class="col-lg-12 notice">
								<?php 
								if (isset($_POST['submit'])) {
									do_action('admin_submit');
								}
								?>	
								</div>
								<div class="col-lg-12">
							
								<!-- TODO somthing.... -->
								</div>
								<?php }else{ ?> 
									<div class="col-lg-12 notice">
									<p class="mess-error">Bạn không có quyền truy cập vào trang này.<br> Mọi thắc mắc xin vui lòng liên hệ ban quản trị.</p> 
									</div>
								<?php }}else{ ?>
									<div class="col-lg-12 notice">
									<p class="mess-error">Bạn cần đăng nhập để sử dụng tính năng.</br>Đăng nhập <a href="<?php  echo home_url('/login');?>">tại đây</a.>.</p>
									</div>
								<?php } ?>	
					</div><!-- #content -->
				</div><!-- #primary -->
			
				<?php get_sidebar(); ?>
				
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar( 'second' ); ?>
		
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>