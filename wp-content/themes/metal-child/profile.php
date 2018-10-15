<?php
/**
 * Template Name: Profile Template
 *
 * @package Zozothemes
 */
do_action('verifyLogin');
get_header();
?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes();?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes();?>">
					<div id="content" class="site-content">
					<div class="container-content">
    <div class="row profile">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<?php  echo get_avatar( $current_user->user_email);?>
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
					</div>
					<div class="profile-usertitle-job">
						Developer
					</div>
				</div>
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="#">
							<i class="glyphicon glyphicon-home"></i>
							Overview </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-user"></i>
							Account Settings </a>
						</li>
						<li>
							<a href="#" target="_blank">
							<i class="glyphicon glyphicon-ok"></i>
							Tasks </a>
						</li>
						<li>
							<a href="#">
							<i class="glyphicon glyphicon-flag"></i>
							Help </a>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content">
			   Some user related content goes here...<?php echo info()[0]->ID;?>
			   <?php
					if(isset($_POST['edit-profile'])){
						do_action('editProfile');
					}
				?>
			</div>
		</div>
	</div>
</div>

<form action="<?php home_url('profile')?>?user=<?php echo $current_user->user_login;?>&action=edit" method="POST" class="profile-userbuttons">
<input type="hidden" id="user-id" name="user-id" value="<?php echo get_current_user_id();?>">
	<button type="submit" id="edit-profile" name="edit-profile"	class="btn btn-success btn-sm">Edit</button>
</form>
<br>
<br>
						
					</div><!-- #content -->
				</div><!-- #primary -->
				<?php get_sidebar();?>
			</div>
		</div><!-- #single-sidebar-container -->
		<?php get_sidebar('second');?>
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer();?>