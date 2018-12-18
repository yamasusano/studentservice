<?php
/**
 * The Header for our theme.
 *
 * Displays all of the header section
 *
 * @package Zozothemes
 */
?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	
	<!-- Latest IE rendering engine & Chrome Frame Meta Tags -->
	<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
	
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<link rel="stylesheet" type="text/css" media="screen" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
	<link rel="stylesheet" type="text/css" media="screen, print" href="<?php bloginfo( 'stylesheet_url' ); ?>" />
	<link rel="stylesheet" type="text/css" media="print" href="<?php bloginfo('stylesheet_directory'); ?>/print.css" />
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
	<?php
		/**
		 * @hooked - zozo_page_loader - 5
		 * @hooked - zozo_secondary_menu - 10
		 * @hooked - zozo_mobile_menu_wrapper - 20
		 * @hooked - zozo_mobile_cart_wrapper - 30
		 * @hooked - zozo_mobile_search_wrapper - 40
		**/
		do_action('zozo_before_page_wrapper');
	?>

<div id="zozo_wrapper" class="wrapper-class">
	<?php if( zozo_get_theme_option( 'zozo_footer_style' ) == 'hidden' ) { ?>
		<div class="wrapper-inner">	
	<?php } ?>
	
	<?php
		/**
		 * @hooked - zozo_sliding_bar - 5
		 * @hooked - zozo_mobile_header_wrapper - 15
		 * @hooked - zozo_header_wrapper - 20
		 * @hooked - zozo_header_top_anchor - 30
		 * @hooked - zozo_page_slider_wrapper - 40
		 * @hooked - zozo_featured_post_slider - 50
		**/
		do_action('zozo_header_wrapper_start');
	?>
	
	<div id="main" class="main-section">
		<!-- ============ Page Header ============ -->
		<?php get_template_part('partials/page', 'header' ); ?>