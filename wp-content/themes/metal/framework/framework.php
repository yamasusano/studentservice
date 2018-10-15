<?php 
/* ======================================
 * CORE FILES
 * ====================================== */
if( ! function_exists('zozo_include_theme_options') ) {
	function zozo_include_theme_options() {
		// Theme Options Panel Admin
		include_once( ZOZO_FRAMEWORK_PATH . '/admin/theme-options.php' );
		// Welcome Admin Page
		include_once( ZOZO_FRAMEWORK_PATH . '/admin/theme-admin/index.php' );
	}
	add_action( 'init', 'zozo_include_theme_options', 0 );
}

/* ================================================
 * Get Theme Option Values
 * ================================================ */
 
if ( ! function_exists( 'zozo_get_theme_option' ) ) {

	function zozo_get_theme_option( $option_id, $default = '' ) {
	
		global $zozo_options;
		
		/* look for the saved value */
		if( isset( $zozo_options[$option_id] ) && '' != $zozo_options[$option_id] ) {
			return $zozo_options[$option_id];
		}
		
		return $default;
	
	}
  
}

// Core Functions
include_once( ZOZO_FRAMEWORK_PATH . '/core/functions.php' );
// Header Functions
include_once( ZOZO_FRAMEWORK_PATH . '/core/header-functions.php' );