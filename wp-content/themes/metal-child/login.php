<?php
/**
 * Template Name: Login Template
 *
 * @package Zozothemes
 */
require_once "config.php";
if(isset($_SESSION['email'])){
	wp_redirect(home_url());
	exit;
}
get_header();

$loginURL = $gClient->createAuthUrl();
?>
<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes();?>">
			<div class="zozo-row row">
				<div id="primary" class="content-area <?php zozo_primary_content_classes();?>">
					<div id="content" class="site-content">
                        <div class="container">
						<div class="login-form">
						<input type="button" onclick="window.location = '<?php echo $loginURL ?>';" value="Log In With Google" class="btn btn-danger">
						</div>
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