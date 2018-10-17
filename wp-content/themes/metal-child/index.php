<?php
/**
 * Template Name: Home Template
 *
 * @package Zozothemes
 */
get_header();
?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes();?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes();?>">
					<div id="content" class="site-content">
						<div class="container" style="margin-top: 100px">
							<div class="row">
								<div class="col-md-3">
									<img style="width: 80%;" src="<?php echo $_SESSION['picture'] ?>">
								</div>
								<div class="col-md-9">
									<table class="table table-hover table-bordered">
										<tbody>
											<tr>
												<td>ID</td>
												<td><?php echo $_SESSION['id'] ?></td>
											</tr>
											<tr>
												<td>First Name</td>
												<td><?php echo $_SESSION['givenName'] ?></td>
											</tr>
											<tr>
												<td>Last Name</td>
												<td><?php echo $_SESSION['familyName'] ?></td>
											</tr>
											<tr>
												<td>Email</td>
												<td><?php echo $_SESSION['email'] ?></td>
											</tr>
											<tr>
												<td>Gender</td>
												<td><?php echo $_SESSION['gender'] ?></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>





							<?php
if (is_user_logged_in()) {?>
								<a href="<?php echo wp_logout_url($_SERVER['REQUEST_URI']); ?>" class="btn btn-danger" >Log Out</a>
							<?php } else {?>
								<a href="<?php echo home_url('login'); ?>" class="btn btn-info" >Log In</a>
							<?php }?>

						</div>
					</div><!-- #content -->
				</div><!-- #primary -->

				<?php get_sidebar();?>

			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second');?>

	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer();?>