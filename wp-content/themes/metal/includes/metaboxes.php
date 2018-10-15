<?php
/**
 * Custom Meta Boxes and Fields for Post, Pages and other custom post types
 *
 * @package Zozothemes
 */ 
 
class ZozoThemeMetaboxes {
	
	public function __construct() 
	{
		add_action('add_meta_boxes', array($this, 'add_meta_boxes'));
		add_action('save_post', array($this, 'save_meta_boxes'));
		add_action('admin_enqueue_scripts', array($this, 'load_admin_script'));
	}

	// Load Admin Scripts
	function load_admin_script() {
		global $pagenow;
		
		if (is_admin() && ($pagenow == 'post-new.php' || $pagenow == 'post.php')) {
		
			wp_enqueue_style('admin-style', ZOZO_ADMIN_ASSETS .'css/admin-custom.css');
			
			wp_register_style('select2-style', ZOZO_ADMIN_ASSETS . 'css/select2.css');
	    	wp_enqueue_style('select2-style');
						
			wp_register_script('admin-media', ZOZO_ADMIN_ASSETS .'js/metabox.js');
	    	wp_enqueue_script('admin-media');
			
			wp_register_script('select2', ZOZO_ADMIN_ASSETS . 'js/select2.js');
	    	wp_enqueue_script('select2');
			
	    	wp_enqueue_media();
			
			wp_enqueue_script('jquery-ui-core');
			wp_enqueue_script('jquery-ui-tabs');
			wp_enqueue_script('jquery-ui-slider');
			
			wp_enqueue_script( 'wp-color-picker' );
			wp_enqueue_style( 'wp-color-picker' );
		}
		
		if( is_admin() ) {
			wp_enqueue_style('zozo-admin-css', ZOZO_ADMIN_ASSETS .'css/admin.css');
		}
	}
	
	// Add Meta Boxes for different Post types
	public function add_meta_boxes()
	{
		$this->add_meta_box('post_options', 'Post Options', 'post_metabox', 'post');
		$this->add_meta_box('page_options', 'Page Options', 'page_metabox', 'page');
		if( ZOZO_WOOCOMMERCE_ACTIVE ) {
			$this->add_meta_box('product_options', 'Product Options', 'product_metabox', 'product');
		}
		$this->add_meta_box('testimonial_options', 'Testimonial Options', 'testimonial_metabox', 'zozo_testimonial');
		$this->add_meta_box('portfolio_options', 'Portfolio Options', 'portfolio_metabox', 'zozo_portfolio');
		$this->add_meta_box('service_options', 'Services Options', 'service_metabox', 'zozo_services');
		$this->add_meta_box('team_options', 'Team Member Options', 'team_metabox', 'zozo_team_member');
	}
	
	// Add Meta Box for each types
	public function add_meta_box($id, $title, $callback, $post_type)
	{
	    add_meta_box( 'zozo_' . $id, $title, array($this, 'zozo_' . $callback), $post_type, 'normal', 'high' );		 
	}
	
	// Save meta box fields
	public function save_meta_boxes($post_id)
	{
		if(defined( 'DOING_AUTOSAVE') && DOING_AUTOSAVE) {
			return;
		}
				
		// check permissions
		if( isset( $_POST['post_type'] ) && 'page' == $_POST['post_type'] ) {
			if( !current_user_can('edit_page', $post_id) )
			return $post_id;
		} elseif( !current_user_can('edit_post', $post_id) ) {
			return $post_id;
		}
		
		$portfolio = array();
		
		if( isset( $_POST['zozoportfolio_options'] ) && is_array( $_POST['zozoportfolio_options'] ) ) {

			foreach( $_POST['zozoportfolio_options'] as $i => $fields ) {
				// skip the hidden "repeatable" div
				if( $i != '%r' ) {
					$portfolio[$i] = $fields;
				}
			}
			
			if( ! empty( $portfolio ) ) {
				update_post_meta($post_id, 'zozoportfolio_options', $portfolio);
			}
		
		}
		
		foreach($_POST as $key => $value) {
			if(strstr($key, 'zozo_')) {
				update_post_meta($post_id, $key, $value);
			}
		}
	}

	public function zozo_post_metabox()
	{
		$zozopostfields = new ZozoMetaboxFields();
		$zozopostfields->render_fields( $zozopostfields->render_post_fields() );
	}

	public function zozo_page_metabox()
	{
		$zozopagefields = new ZozoMetaboxFields();
		$zozopagefields->render_fields( $zozopagefields->render_page_fields() );
	}
		
	public function zozo_testimonial_metabox()
	{
		$zozotestimonialfields = new ZozoMetaboxFields();
		$zozotestimonialfields->render_fields( $zozotestimonialfields->render_testimonial_fields() );
	}
	
	public function zozo_portfolio_metabox()
	{
		$zozoportfoliofields = new ZozoMetaboxFields();		
		$zozoportfoliofields->render_portfolio_fields();
	}
		
	public function zozo_team_metabox()
	{
		$zozoteamfields = new ZozoMetaboxFields();
		$zozoteamfields->render_fields( $zozoteamfields->render_team_fields() );
	}
	
	public function zozo_service_metabox()
	{
		$service_fields = new ZozoMetaboxFields();		
		$service_fields->render_fields( $service_fields->render_service_fields() );
	}
	
	public function zozo_product_metabox()
	{
		$product_fields = new ZozoMetaboxFields();
		$product_fields->render_fields( $product_fields->render_product_fields() );
	}

}

$metaboxes = new ZozoThemeMetaboxes;