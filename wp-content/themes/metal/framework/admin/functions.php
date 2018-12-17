<?php // Custom Functions

add_action( 'admin_print_scripts-post.php', 'zozo_admin_icon_styles_compatible', 30 );
add_action( 'admin_print_scripts-post-new.php', 'zozo_admin_icon_styles_compatible', 30 );

/**
 * Enqueue Icon Styles for Admin
 *
 * @return	void
 */
function zozo_admin_icon_styles_compatible() {
	// CSS		
	wp_enqueue_style( 'zozo-font-awesome', ZOZOTHEME_URL . '/css/font-awesome.css', false, '4.4.0', 'all' );
	wp_enqueue_style( 'zozo-iconspack', ZOZOTHEME_URL . '/css/iconspack.css', false, '1.0', 'all' );
}

/* ==================================================================
 *	Revolution Slider Disable Notice
 * ================================================================== */

if( is_admin() ) {
	if( function_exists( 'set_revslider_as_theme' )){
		add_action( 'init', 'zozo_set_Rev_Slider_as_theme' );
		function zozo_set_Rev_Slider_as_theme() {
			update_option('revslider-valid-notice', 'false');
			set_revslider_as_theme();
		}
	}
}

/* ==================================================================
 *	Ultimate Addon Disable Notice
 * ================================================================== */

if( class_exists('Ultimate_VC_Addons') ) {
	add_action('admin_init', 'zozo_disable_ultimate_addon_notice');
}
function zozo_disable_ultimate_addon_notice() {
	remove_action('admin_notices','bsf_notices',1000);
	remove_action('network_admin_notices','bsf_notices',1000);
}