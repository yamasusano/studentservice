<?php
/**
 * Theme Options
 */

require_once( ZOZOADMIN . '/functions.php' );

// include redux framework core functions
require_once( ZOZOADMIN . '/ReduxCore/framework.php' );

// Theme options
require_once( ZOZOADMIN . '/theme-config/config.php' );

// Save Theme Options
add_action('redux/options/zozo_options/saved', 'zozo_save_theme_options', 10, 2);
add_action('redux/options/zozo_options/import', 'zozo_save_theme_options', 10, 2);
add_action('redux/options/zozo_options/reset', 'zozo_save_theme_options');
add_action('redux/options/zozo_options/section/reset', 'zozo_save_theme_options');

function zozo_save_theme_options() {
	global $reduxZozoOptions;
	
	$url = wp_nonce_url( 'admin.php?page=zozo_options', 'zozo_custom_css_save_action' );
	
	if( false === ( $creds = request_filesystem_credentials( esc_url_raw( $url ), '', false, false, array() ) ) ) {
		return true;
		//_e( 'This is required to enable file writing', 'zozothemes' );
		//exit(); // stop processing here
	}
	
	$upload_dir = wp_upload_dir();
	if( ! WP_Filesystem( $creds, $upload_dir['basedir'] ) ) {
		request_filesystem_credentials( esc_url_raw( $url ), '', true, false, array() );
		return true;
		//_e( 'This is required to enable file writing', 'zozothemes' );
		//exit();
	}
	
	global $wp_filesystem;
	
	$zozo_theme_upload_dir = $wp_filesystem->find_folder( $upload_dir['basedir'] ) . 'metal';
	if( ! $wp_filesystem->is_dir( $zozo_theme_upload_dir ) ) {
		if ( ! $wp_filesystem->mkdir( $zozo_theme_upload_dir, 0777 ) ) {
			return false;
		}
	}
	
    $reduxFramework = $reduxZozoOptions->ReduxFramework;
	
	// Custom Styles File
    ob_start();
    include ZOZOINCLUDES . 'custom-skins.php';
    $custom_css = ob_get_clean();

    $filename = $zozo_theme_upload_dir . '/theme_'.get_current_blog_id().'.css';

    if( is_writable(dirname($filename)) == false ){
        @chmod(dirname($filename), 0755);
    }

    if( file_exists($filename) ) {
        if (is_writable($filename) == false){
            @chmod($filename, 0755);
        }
        @unlink($filename);
    }
	
	if( ! $wp_filesystem->put_contents( $filename, $custom_css, FS_CHMOD_FILE ) ) {
		_e( 'Error ! File not saved.', 'zozothemes' );
	}
    //$reduxFramework->filesystem->execute( 'put_contents', $filename, array('content' => $custom_css) );

}