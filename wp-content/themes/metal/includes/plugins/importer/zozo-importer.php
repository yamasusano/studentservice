<?php
defined( 'ABSPATH' ) or die( 'You cannot access this script directly' );

/* ================================================
 * Importer
 * ================================================ */
 
// Don't resize images
function zozo_import_filter_image_sizes( $sizes ) {
	return array();
}
 
class Zozo_Import {
	
	public $message = "";
	public function __construct(){
	
	}
	
	public function zozo_import_content( $file ) {
			
        if ( ! class_exists( 'WP_Importer' ) ) { // if main importer class doesn't exist
            ob_start();
			$wp_importer = ABSPATH . 'wp-admin/includes/class-wp-importer.php';
            require_once( $wp_importer );
			$wp_import = ZOZOTHEME_DIR . '/includes/plugins/importer/wordpress-importer.php';
            require_once( $wp_import );
			
			add_filter('intermediate_image_sizes_advanced', 'zozo_import_filter_image_sizes');
			
            $zozo_importer = new WP_Import();
            set_time_limit(0);
            $path = ZOZOINCLUDES . 'plugins/importer/data/' . $file;
			
			$zozo_importer->fetch_attachments = true;
			$returned_value = $zozo_importer->import( $file );
          
            if( is_wp_error($returned_value) ){
                $this->message = __("An Error Occurred During Import", "zozothemes");
            }
            else {
                $this->message = __("Content imported successfully", "zozothemes");
            }
            ob_get_clean();
        } else {
            $this->message = __("Error loading files", "zozothemes");
        }
		
    }
	
	public function zozo_import_widgets($widgets, $sidebars) {
		if( $sidebars ) {
        	$this->zozo_import_custom_sidebars($sidebars);
		}
		
        $this->zozo_import_sidebars_widgets( $widgets );
        $this->message = __("Widgets imported successfully", "zozothemes");
    }
	
	public function zozo_import_custom_sidebars( $file ){
        $sidebars = $this->zozo_import_get_file( $file );
		if( isset( $sidebars ) && $sidebars ) {
			update_option( 'sbg_sidebars', $sidebars );
	
			foreach( $sidebars as $sidebar ) {
				$sidebar_class = zozo_name_to_class( $sidebar );
				
				register_sidebar(array(
					'name'			=>	$sidebar,
					'id'			=> 'zozo-custom-'.strtolower($sidebar_class),
					'before_widget' => '<div id="%1$s" class="widget %2$s">',
					'after_widget' 	=> '</div>',
					'before_title' 	=> '<h3 class="widget-title">',
					'after_title'	=> '</h3>',
				));
			}
        	$this->message = __("Custom sidebars imported successfully", "zozothemes");
		}
    }
	
	public function zozo_import_sidebars_widgets( $file ){
		$widgets_file = $this->zozo_import_get_file( $file );
        // Add Widgets
		if( isset( $widgets_file ) && $widgets_file ) {
			zozo_import_widget_data( $widgets_file );
		}        
    }
	
	public function zozo_import_theme_options( $file ){
		$file_contents = $this->zozo_import_get_file( $file );
		$theme_options = json_decode($file_contents, true);
		$redux = ReduxFrameworkInstances::get_instance('zozo_options');
		$redux->set_options($theme_options);
		zozo_save_theme_options();
        $this->message = __("Options imported successfully", "zozothemes");
    }
	
	public function zozo_import_menus(){
		/* Set imported menus to Registered Menu locations in Theme */
				
		// Registered Menu Locations in Theme
		$locations = get_theme_mod( 'nav_menu_locations' );
		// Get Registered menus
		$menus = wp_get_nav_menus();
		
		// Assign menus to theme locations 
		if( is_array($menus) ) {
			foreach( $menus as $menu ) {
				if( $menu->name == 'Main Menu' ) {
					$locations['primary-menu'] = $menu->term_id;
				} else if( $menu->name == 'Main Menu Right' ) {
					$locations['primary-right'] = $menu->term_id;
				} else if( $menu->name == 'Top Menu' ) {
					$locations['top-menu'] = $menu->term_id;
				} else if( $menu->name == 'Footer Menu' ) {
					$locations['footer-menu'] = $menu->term_id;
				}
			}
		}

		set_theme_mod( 'nav_menu_locations', $locations );
    }
	
	public function zozo_import_settings_pages(){
		// Set Woocommerce Pages
		$woo_pages = array(
			'woocommerce_shop_page_id' => 'Shop',
			'woocommerce_cart_page_id' => 'Cart',
			'woocommerce_checkout_page_id' => 'Checkout',
			'woocommerce_myaccount_page_id' => 'My Account'
		);
			
		foreach( $woo_pages as $woo_page_name => $woo_page_title ) {
			$woo_page = get_page_by_title( $woo_page_title );
			if( isset( $woo_page ) && $woo_page->ID ) {
				update_option($woo_page_name, $woo_page->ID);
			}
		}
    }
	
	public function zozo_import_revslider( $demo_type, $file ){
		// Import Revolution Slider
		if( class_exists( 'RevSlider' ) && $file ) {
			
			$old_filepath = "http://themes.zozothemes.com/extras/importer/metal/" . $file;
			$filepath = ZOZOINCLUDES . 'plugins/importer/data/slider-'.$demo_type.'.zip';
			
			copy($old_filepath, $filepath);
			
			$is_template = false;
			$updateAnim = true;
			$updateStatic = true;
			$sliderExists = false;
			
			global $wpdb;
			
			$importZip = false;
			
			WP_Filesystem();
			
			global $wp_filesystem;
			
			$upload_dir = wp_upload_dir();
			$d_path = $upload_dir['basedir'].'/rstemp/';
			$unzipfile = unzip_file( $filepath, $d_path);
			if ( $unzipfile ) {
				$importZip = true; //raus damit..
				
				//read all files needed
				$content = ( $wp_filesystem->exists( $d_path.'slider_export.txt' ) ) ? $wp_filesystem->get_contents( $d_path.'slider_export.txt' ) : '';
				if($content == ''){
					RevSliderFunctions::throwError(__('slider_export.txt does not exist!', 'zozothemes'));
				}
				$animations = ( $wp_filesystem->exists( $d_path.'custom_animations.txt' ) ) ? $wp_filesystem->get_contents( $d_path.'custom_animations.txt' ) : '';
				$dynamic = ( $wp_filesystem->exists( $d_path.'dynamic-captions.css' ) ) ? $wp_filesystem->get_contents( $d_path.'dynamic-captions.css' ) : '';
				$static = ( $wp_filesystem->exists( $d_path.'static-captions.css' ) ) ? $wp_filesystem->get_contents( $d_path.'static-captions.css' ) : '';
				
				$uid_check = ( $wp_filesystem->exists( $d_path.'info.cfg' ) ) ? $wp_filesystem->get_contents( $d_path.'info.cfg' ) : '';

				if($is_template !== false){
					if($uid_check != $is_template){}
				}else{ //someone imported a template base Slider, check if it is existing in Base Sliders, if yes, check if it was imported
					if($uid_check !== ''){
						$tmpl = new RevSliderTemplate();
						$tmpl_slider = $tmpl->getThemePunchTemplateSliders();
						
						foreach($tmpl_slider as $tp_slider){
							if(!isset($tp_slider['installed'])) continue;
							
							if($tp_slider['uid'] == $uid_check){
								$is_template = $uid_check;
								break;
							}
						}
					}
				}
				
				$db = new RevSliderDB();
				
				//update/insert custom animations
				$animations = @unserialize($animations);						
				if(!empty($animations)){
					foreach($animations as $key => $animation){ //$animation['id'], $animation['handle'], $animation['params']
						$exist = $db->fetch(RevSliderGlobals::$table_layer_anims, "handle = '".$animation['handle']."'");
						if(!empty($exist)){ //update the animation, get the ID
							if($updateAnim == "true"){ //overwrite animation if exists
								$arrUpdate = array();
								$arrUpdate['params'] = stripslashes(json_encode(str_replace("'", '"', $animation['params'])));
								$db->update(RevSliderGlobals::$table_layer_anims, $arrUpdate, array('handle' => $animation['handle']));
								
								$anim_id = $exist['0']['id'];
							}else{ //insert with new handle
								$arrInsert = array();
								$arrInsert["handle"] = 'copy_'.$animation['handle'];
								$arrInsert["params"] = stripslashes(json_encode(str_replace("'", '"', $animation['params'])));
								
								$anim_id = $db->insert(RevSliderGlobals::$table_layer_anims, $arrInsert);
							}
						}else{ //insert the animation, get the ID
							$arrInsert = array();
							$arrInsert["handle"] = $animation['handle'];
							$arrInsert["params"] = stripslashes(json_encode(str_replace("'", '"', $animation['params'])));
							
							$anim_id = $db->insert(RevSliderGlobals::$table_layer_anims, $arrInsert);
						}
						
						//and set the current customin-oldID and customout-oldID in slider params to new ID from $id
						$content = str_replace(array('customin-'.$animation['id'].'"', 'customout-'.$animation['id'].'"'), array('customin-'.$anim_id.'"', 'customout-'.$anim_id.'"'), $content);	
					} 
				} else {
					
				}
				
				//overwrite/append static-captions.css
				if(!empty($static)){
					if($updateStatic == "true"){ //overwrite file
						RevSliderOperations::updateStaticCss($static);
					}elseif($updateStatic == 'none'){
						//do nothing
					}else{//append
						$static_cur = RevSliderOperations::getStaticCss();
						$static = $static_cur."\n".$static;
						RevSliderOperations::updateStaticCss($static);
					}
				}
				
				//overwrite/create dynamic-captions.css
				//parse css to classes
				$dynamicCss = RevSliderCssParser::parseCssToArray($dynamic);
				
				if(is_array($dynamicCss) && $dynamicCss !== false && count($dynamicCss) > 0){
					foreach($dynamicCss as $class => $styles){
						//check if static style or dynamic style
						$class = trim($class);
						
						if(strpos($class, ',') !== false && strpos($class, '.tp-caption') !== false){ //we have something like .tp-caption.redclass, .redclass
							$class_t = explode(',', $class);
							foreach($class_t as $k => $cl){
								if(strpos($cl, '.tp-caption') !== false) $class = $cl;
							}
						}
						
						if((strpos($class, ':hover') === false && strpos($class, ':') !== false) || //before, after
							strpos($class," ") !== false || // .tp-caption.imageclass img or .tp-caption .imageclass or .tp-caption.imageclass .img
							strpos($class,".tp-caption") === false || // everything that is not tp-caption
							(strpos($class,".") === false || strpos($class,"#") !== false) || // no class -> #ID or img
							strpos($class,">") !== false){ //.tp-caption>.imageclass or .tp-caption.imageclass>img or .tp-caption.imageclass .img
							continue;
						}
						
						//is a dynamic style
						if(strpos($class, ':hover') !== false){
							$class = trim(str_replace(':hover', '', $class));
							$arrInsert = array();
							$arrInsert["hover"] = json_encode($styles);
							$arrInsert["settings"] = json_encode(array('hover' => 'true'));
						}else{
							$arrInsert = array();
							$arrInsert["params"] = json_encode($styles);
							$arrInsert["settings"] = '';
						}
						//check if class exists
						$result = $db->fetch(RevSliderGlobals::$table_css, "handle = '".$class."'");
						
						if(!empty($result)){ //update
							$db->update(RevSliderGlobals::$table_css, $arrInsert, array('handle' => $class));
						}else{ //insert
							$arrInsert["handle"] = $class;
							$db->insert(RevSliderGlobals::$table_css, $arrInsert);
						}
					}							
				} else {
					
				}						
			}
			
			//$content = preg_replace('!s:(\d+):"(.*?)";!e', "'s:'.strlen('$2').':\"$2\";'", $content); //clear errors in string //deprecated in newest php version
			$content = preg_replace_callback('!s:(\d+):"(.*?)";!', array('RevSlider', 'clear_error_in_string') , $content); //clear errors in string
			
			$arrSlider = @unserialize($content);
			//update slider params
			$sliderParams = $arrSlider["params"];
			
			if(isset($sliderParams["background_image"]))
				$sliderParams["background_image"] = RevSliderFunctionsWP::getImageUrlFromPath($sliderParams["background_image"]);
			
			
			$import_statics = true;
			if(isset($sliderParams['enable_static_layers'])){
				if($sliderParams['enable_static_layers'] == 'off') $import_statics = false;
				unset($sliderParams['enable_static_layers']);
			}
			
			$json_params = json_encode($sliderParams);
			
			$c_slider = new RevSliderSlider();
			
			//new slider
			$arrInsert = array();
			$arrInsert['params'] = $json_params;
			//check if Slider with title and/or alias exists, if yes change both to stay unique	
			$arrInsert['title'] = RevSliderFunctions::getVal($sliderParams, 'title', 'Slider1');
			$arrInsert['alias'] = RevSliderFunctions::getVal($sliderParams, 'alias', 'slider1');
			
			if($is_template === false){ //we want to stay at the given alias if we are a template
				$talias = $arrInsert['alias'];
				$ti = 1;
				while($c_slider->isAliasExistsInDB($talias)){ //set a new alias and title if its existing in database
					$talias = $arrInsert['alias'] . $ti;
					$ti++;
				}
				if($talias !== $arrInsert['alias']){
					$arrInsert['title'] = $talias;
					$arrInsert['alias'] = $talias;
				}
			}
								
			$sliderID = $wpdb->insert(RevSliderGlobals::$table_sliders,$arrInsert);
			
			//-------- Slides Handle -----------
			
			//create all slides
			$arrSlides = $arrSlider["slides"];
			
			$alreadyImported = array();
			
			//wpml compatibility
			$slider_map = array();
			
			foreach($arrSlides as $sl_key => $slide){
				$params = $slide["params"];
				$layers = $slide["layers"];
				$settings = (isset($slide["settings"])) ? $slide["settings"] : '';
				
				//convert params images:
				if($importZip === true){ //we have a zip, check if exists
					if(isset($params["image"])){
						$params["image"] = RevSliderBase::check_file_in_zip($d_path, $params["image"], $sliderParams["alias"], $alreadyImported);
						$params["image"] = RevSliderFunctionsWP::getImageUrlFromPath($params["image"]);
					}
					
					if(isset($params["background_image"])){
						$params["background_image"] = RevSliderBase::check_file_in_zip($d_path, $params["background_image"], $sliderParams["alias"], $alreadyImported);
						$params["background_image"] = RevSliderFunctionsWP::getImageUrlFromPath($params["background_image"]);
					}
					
					if(isset($params["slide_thumb"])){
						$params["slide_thumb"] = RevSliderBase::check_file_in_zip($d_path, $params["slide_thumb"], $sliderParams["alias"], $alreadyImported);
						$params["slide_thumb"] = RevSliderFunctionsWP::getImageUrlFromPath($params["slide_thumb"]);
					}
					
					if(isset($params["show_alternate_image"])){
						$params["show_alternate_image"] = RevSliderBase::check_file_in_zip($d_path, $params["show_alternate_image"], $sliderParams["alias"], $alreadyImported);
						$params["show_alternate_image"] = RevSliderFunctionsWP::getImageUrlFromPath($params["show_alternate_image"]);
					}
					if(isset($params['background_type']) && $params['background_type'] == 'html5'){
						if(isset($params['slide_bg_html_mpeg']) && $params['slide_bg_html_mpeg'] != ''){
							$params['slide_bg_html_mpeg'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $params["slide_bg_html_mpeg"], $sliderParams["alias"], $alreadyImported, true));
						}
						if(isset($params['slide_bg_html_webm']) && $params['slide_bg_html_webm'] != ''){
							$params['slide_bg_html_webm'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $params["slide_bg_html_webm"], $sliderParams["alias"], $alreadyImported, true));
						}
						if(isset($params['slide_bg_html_ogv'])  && $params['slide_bg_html_ogv'] != ''){
							$params['slide_bg_html_ogv'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $params["slide_bg_html_ogv"], $sliderParams["alias"], $alreadyImported, true));
						}
					}
				}
				
				//convert layers images:
				foreach($layers as $key=>$layer){					
					//import if exists in zip folder
					if($importZip === true){ //we have a zip, check if exists
						if(isset($layer["image_url"])){
							$layer["image_url"] = RevSliderBase::check_file_in_zip($d_path, $layer["image_url"], $sliderParams["alias"], $alreadyImported);
							$layer["image_url"] = RevSliderFunctionsWP::getImageUrlFromPath($layer["image_url"]);
						}
						if(isset($layer['type']) && $layer['type'] == 'video'){
							
							$video_data = (isset($layer['video_data'])) ? (array) $layer['video_data'] : array();
							
							if(!empty($video_data) && isset($video_data['video_type']) && $video_data['video_type'] == 'html5'){

								if(isset($video_data['urlPoster']) && $video_data['urlPoster'] != ''){
									$video_data['urlPoster'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $video_data["urlPoster"], $sliderParams["alias"], $alreadyImported));
								}
								
								if(isset($video_data['urlMp4']) && $video_data['urlMp4'] != ''){
									$video_data['urlMp4'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $video_data["urlMp4"], $sliderParams["alias"], $alreadyImported, true));
								}
								if(isset($video_data['urlWebm']) && $video_data['urlWebm'] != ''){
									$video_data['urlWebm'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $video_data["urlWebm"], $sliderParams["alias"], $alreadyImported, true));
								}
								if(isset($video_data['urlOgv']) && $video_data['urlOgv'] != ''){
									$video_data['urlOgv'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $video_data["urlOgv"], $sliderParams["alias"], $alreadyImported, true));
								}
								
							}elseif(!empty($video_data) && isset($video_data['video_type']) && $video_data['video_type'] != 'html5'){ //video cover image
								if(isset($video_data['previewimage']) && $video_data['previewimage'] != ''){
									$video_data['previewimage'] = RevSliderFunctionsWP::getImageUrlFromPath(RevSliderBase::check_file_in_zip($d_path, $video_data["previewimage"], $sliderParams["alias"], $alreadyImported));
								}
							}
							
							$layer['video_data'] = $video_data;
							
						}
						
					}
					
					$layer['text'] = stripslashes($layer['text']);
					$layers[$key] = $layer;
				}
				$arrSlides[$sl_key]['layers'] = $layers;
				
				//create new slide
				$arrCreate = array();
				$arrCreate["slider_id"] = $sliderID;
				$arrCreate["slide_order"] = $slide["slide_order"];
				
				$my_layers = json_encode($layers);
				if(empty($my_layers))
					$my_layers = stripslashes(json_encode($layers));
				$my_params = json_encode($params);
				if(empty($my_params))
					$my_params = stripslashes(json_encode($params));
				$my_settings = json_encode($settings);
				if(empty($my_settings))
					$my_settings = stripslashes(json_encode($settings));						
					
				$arrCreate["layers"] = $my_layers;
				$arrCreate["params"] = $my_params;
				$arrCreate["settings"] = $my_settings;
				
				$last_id = $wpdb->insert(RevSliderGlobals::$table_slides,$arrCreate);
				
				if(isset($slide['id'])){
					$slider_map[$slide['id']] = $last_id;
				}
			}
			
			//change for WPML the parent IDs if necessary
			if(!empty($slider_map)){
				foreach($arrSlides as $sl_key => $slide){
					if(isset($slide['params']['parentid']) && isset($slider_map[$slide['params']['parentid']])){
						$update_id = $slider_map[$slide['id']];
						$parent_id = $slider_map[$slide['params']['parentid']];
						
						$arrCreate = array();
						
						$arrCreate["params"] = $slide['params'];
						$arrCreate["params"]['parentid'] = $parent_id;
						$my_params = json_encode($arrCreate["params"]);
						if(empty($my_params))
							$my_params = stripslashes(json_encode($arrCreate["params"]));
						
						$arrCreate["params"] = $my_params;
						
						$wpdb->update(RevSliderGlobals::$table_slides,$arrCreate,array("id"=>$update_id));
					}
					
					$did_change = false;
					foreach($slide['layers'] as $key => $value){
						if(isset($value['layer_action'])){
							if(isset($value['layer_action']->jump_to_slide) && !empty($value['layer_action']->jump_to_slide)){
								$value['layer_action']->jump_to_slide = (array)$value['layer_action']->jump_to_slide;
								foreach($value['layer_action']->jump_to_slide as $jtsk => $jtsval){
									if(isset($slider_map[$jtsval])){
										$slide['layers'][$key]['layer_action']->jump_to_slide[$jtsk] = $slider_map[$jtsval];
										$did_change = true;
									}
								}
							}
						}
						
						$link_slide = RevSliderFunctions::getVal($value, 'link_slide', false);
						if($link_slide != false && $link_slide !== 'nothing'){ //link to slide/scrollunder is set, move it to actions
							if(!isset($slide['layers'][$key]['layer_action'])) $slide['layers'][$key]['layer_action'] = new stdClass();
							switch($link_slide){
								case 'link':
									$link = RevSliderFunctions::getVal($value, 'link');
									$link_open_in = RevSliderFunctions::getVal($value, 'link_open_in');
									$slide['layers'][$key]['layer_action']->action = array('a' => 'link');
									$slide['layers'][$key]['layer_action']->link_type = array('a' => 'a');
									$slide['layers'][$key]['layer_action']->image_link = array('a' => $link);
									$slide['layers'][$key]['layer_action']->link_open_in = array('a' => $link_open_in);
									
									unset($slide['layers'][$key]['link']);
									unset($slide['layers'][$key]['link_open_in']);
								case 'next':
									$slide['layers'][$key]['layer_action']->action = array('a' => 'next');
								break;
								case 'prev':
									$slide['layers'][$key]['layer_action']->action = array('a' => 'prev');
								break;
								case 'scroll_under':
									$scrollunder_offset = RevSliderFunctions::getVal($value, 'scrollunder_offset');
									$slide['layers'][$key]['layer_action']->action = array('a' => 'scroll_under');
									$slide['layers'][$key]['layer_action']->scrollunder_offset = array('a' => $scrollunder_offset);
									
									unset($slide['layers'][$key]['scrollunder_offset']);
								break;
								default: //its an ID, so its a slide ID
									$slide['layers'][$key]['layer_action']->action = array('a' => 'jumpto');
									$slide['layers'][$key]['layer_action']->jump_to_slide = array('a' => $slider_map[$link_slide]);
								break;
								
							}
							$slide['layers'][$key]['layer_action']->tooltip_event = array('a' => 'click');
							
							unset($slide['layers'][$key]['link_slide']);
							
							$did_change = true;
						}
						
						
						if($did_change === true){
							
							$arrCreate = array();
							$my_layers = json_encode($slide['layers']);
							if(empty($my_layers))
								$my_layers = stripslashes(json_encode($layers));
							
							$arrCreate['layers'] = $my_layers;
							
							$wpdb->update(RevSliderGlobals::$table_slides,$arrCreate,array("id"=>$slider_map[$slide['id']]));
						}
					}
				}
			}
			
			//check if static slide exists and import
			if(isset($arrSlider['static_slides']) && !empty($arrSlider['static_slides']) && $import_statics){
				$static_slide = $arrSlider['static_slides'];
				foreach($static_slide as $slide){
					
					$params = $slide["params"];
					$layers = $slide["layers"];
					$settings = (isset($slide["settings"])) ? $slide["settings"] : '';
					
					
					//convert params images:
					if(isset($params["image"])){
						//import if exists in zip folder
						if(strpos($params["image"], 'http') !== false){
						}else{
							if(trim($params["image"]) !== ''){
								if($importZip === true){ //we have a zip, check if exists
									$image = $wp_filesystem->exists( $d_path.'images/'.$params["image"] );
									if(!$image){
									
									}else{
										if(!isset($alreadyImported['images/'.$params["image"]])){
											$importImage = RevSliderFunctionsWP::import_media($d_path.'images/'.$params["image"], $sliderParams["alias"].'/');

											if($importImage !== false){
												$alreadyImported['images/'.$params["image"]] = $importImage['path'];
												
												$params["image"] = $importImage['path'];
											}
										}else{
											$params["image"] = $alreadyImported['images/'.$params["image"]];
										}


									}
								}
							}
							$params["image"] = RevSliderFunctionsWP::getImageUrlFromPath($params["image"]);
						}
					}
					
					//convert layers images:
					foreach($layers as $key=>$layer){
						if(isset($layer["image_url"])){
							//import if exists in zip folder
							if(trim($layer["image_url"]) !== ''){
								if(strpos($layer["image_url"], 'http') !== false){
								}else{
									if($importZip === true){ //we have a zip, check if exists
										$image_url = $wp_filesystem->exists( $d_path.'images/'.$layer["image_url"] );
										if(!$image_url){
											
										}else{
											if(!isset($alreadyImported['images/'.$layer["image_url"]])){
												$importImage = RevSliderFunctionsWP::import_media($d_path.'images/'.$layer["image_url"], $sliderParams["alias"].'/');
												
												if($importImage !== false){
													$alreadyImported['images/'.$layer["image_url"]] = $importImage['path'];
													
													$layer["image_url"] = $importImage['path'];
												}
											}else{
												$layer["image_url"] = $alreadyImported['images/'.$layer["image_url"]];
											}
										}
									}
								}
							}
							$layer["image_url"] = RevSliderFunctionsWP::getImageUrlFromPath($layer["image_url"]);
							$layer['text'] = stripslashes($layer['text']);
							
						}
						
						if(isset($layer['layer_action'])){
							if(isset($layer['layer_action']->jump_to_slide) && !empty($layer['layer_action']->jump_to_slide)){
								foreach($layer['layer_action']->jump_to_slide as $jtsk => $jtsval){
									if(isset($slider_map[$jtsval])){
										$layer['layer_action']->jump_to_slide[$jtsk] = $slider_map[$jtsval];
									}
								}
							}
						}
						
						$link_slide = RevSliderFunctions::getVal($value, 'link_slide', false);
						if($link_slide != false && $link_slide !== 'nothing'){ //link to slide/scrollunder is set, move it to actions
							if(!isset($layer['layer_action'])) $layer['layer_action'] = new stdClass();
							
							switch($link_slide){
								case 'link':
									$link = RevSliderFunctions::getVal($value, 'link');
									$link_open_in = RevSliderFunctions::getVal($value, 'link_open_in');
									$layer['layer_action']->action = array('a' => 'link');
									$layer['layer_action']->link_type = array('a' => 'a');
									$layer['layer_action']->image_link = array('a' => $link);
									$layer['layer_action']->link_open_in = array('a' => $link_open_in);
									
									unset($layer['link']);
									unset($layer['link_open_in']);
								case 'next':
									$layer['layer_action']->action = array('a' => 'next');
								break;
								case 'prev':
									$layer['layer_action']->action = array('a' => 'prev');
								break;
								case 'scroll_under':
									$scrollunder_offset = RevSliderFunctions::getVal($value, 'scrollunder_offset');
									$layer['layer_action']->action = array('a' => 'scroll_under');
									$layer['layer_action']->scrollunder_offset = array('a' => $scrollunder_offset);
									
									unset($layer['scrollunder_offset']);
								break;
								default: //its an ID, so its a slide ID
									$layer['layer_action']->action = array('a' => 'jumpto');
									$layer['layer_action']->jump_to_slide = array('a' => $slider_map[$link_slide]);
								break;
								
							}
							$layer['layer_action']->tooltip_event = array('a' => 'click');
							
							unset($layer['link_slide']);
							
							$did_change = true;
						}
						
						$layers[$key] = $layer;
					}
					
					//create new slide
					$arrCreate = array();
					$arrCreate["slider_id"] = $sliderID;
					
					$my_layers = json_encode($layers);
					if(empty($my_layers))
						$my_layers = stripslashes(json_encode($layers));
					$my_params = json_encode($params);
					if(empty($my_params))
						$my_params = stripslashes(json_encode($params));
					$my_settings = json_encode($settings);
					if(empty($my_settings))
						$my_settings = stripslashes(json_encode($settings));
						
						
					$arrCreate["layers"] = $my_layers;
					$arrCreate["params"] = $my_params;
					$arrCreate["settings"] = $my_settings;
					
					if($sliderExists){
						unset($arrCreate["slider_id"]);
						$wpdb->update(RevSliderGlobals::$table_static_slides,$arrCreate,array("slider_id"=>$sliderID));
					} else {
						$wpdb->insert(RevSliderGlobals::$table_static_slides,$arrCreate);
					}
				}
			}
						
			$c_slider->initByID($sliderID);
			
			//check to convert styles to latest versions
			RevSliderPluginUpdate::update_css_styles(); //set to version 5
			RevSliderPluginUpdate::add_animation_settings_to_layer($c_slider); //set to version 5
			RevSliderPluginUpdate::add_style_settings_to_layer($c_slider); //set to version 5
			RevSliderPluginUpdate::change_settings_on_layers($c_slider); //set to version 5
			RevSliderPluginUpdate::add_general_settings($c_slider); //set to version 5
			RevSliderPluginUpdate::change_general_settings_5_0_7($c_slider); //set to version 5.0.7
			
			$cus_js = $c_slider->getParam('custom_javascript', '');
	
			if(strpos($cus_js, 'revapi') !== false){
				if(preg_match_all('/revapi[0-9]*/', $cus_js, $results)){
					
					if(isset($results[0]) && !empty($results[0])){
						foreach($results[0] as $replace){
							$cus_js = str_replace($replace, 'revapi'.$sliderID, $cus_js);
						}
					}
					
					$c_slider->updateParam(array('custom_javascript' => $cus_js));
					
				}
			}
		}
    }

	public function zozo_import_get_file( $file ){
        $file_content = "";
        $file_for_import = ZOZOINCLUDES . 'plugins/importer/data/' . $file;
        $file_content = $this->zozo_get_file_contents( $file );
        if( $file_content ) {
            //$unserialized_content = unserialize(base64_decode($file_content));
			$type = 'base64_';
			$unserialized_content = unserialize( call_user_func( $type . 'decode', $file_content ) );
            if( $unserialized_content ) {
                return $unserialized_content;
            }
        }
        return false;
    }
	
	function zozo_get_file_contents( $path ) {
		$url      = "http://themes.zozothemes.com/extras/importer/metal/" . $path;
		$response = wp_remote_get($url);
		$body     = wp_remote_retrieve_body($response);
		return $body;
    }

}

global $zozo_import;
$zozo_import = new Zozo_Import();
 
/* ================================================
 * Ajax Hook for Importer
 * ================================================ */
 
if( ! function_exists('zozo_demo_content_importer') ) {
    function zozo_demo_content_importer() {
	
        global $zozo_import;
		
		if( ! isset( $_POST['demo_type'] ) || trim( $_POST['demo_type'] ) == '' ) {
			$demo_type = 'demo-multi-classic';
		} else {
			$demo_type = $_POST['demo_type'];
		}
		
		if( ! empty($_POST['demo_type'] )) {
			if( class_exists('Woocommerce') && $_POST['woo_demo'] == 'yes' ) {
				$folder = $_POST['demo_type'] . "/themewithwoo.xml";
			} else {
           		$folder = $_POST['demo_type'] . "/theme.xml";
			}
		}
		
        $zozo_import->zozo_import_content($folder);
		if( class_exists('Woocommerce') && $_POST['woo_demo'] == 'yes' ) {
			$zozo_import->zozo_import_settings_pages();
		}
		
		// Reading settings
		$home_page_title = 'Home 1';
		$post_page_title = 'Blog';
		
		// Set reading options
		$home_page = get_page_by_title( $home_page_title );
		$post_page = get_page_by_title( $post_page_title );
		if( isset( $home_page ) && $home_page->ID ) {
			update_option( 'show_on_front', 'page' );
			update_option( 'page_on_front', $home_page->ID ); // Front Page
		}
		if( isset( $post_page ) && $post_page->ID ) {
			update_option( 'page_for_posts ', $post_page->ID ); // Posts Page
		}

        echo "imported";
		die();
    }

    add_action('wp_ajax_zozo_import_demo_data', 'zozo_demo_content_importer');
}

if( ! function_exists('zozo_demo_import_other_data') ) {
    function zozo_demo_import_other_data() {
	
        global $zozo_import;
		
		if( ! isset( $_POST['demo_type'] ) || trim( $_POST['demo_type'] ) == '' ) {
			$demo_type = 'demo-multi-classic';
		} else {
			$demo_type = $_POST['demo_type'];
		}
        $folder = $demo_type . "/";
		
		$zozo_import->zozo_import_theme_options( $folder.'theme-options.txt' );
		$zozo_import->zozo_import_menus();
        $zozo_import->zozo_import_widgets( $folder.'widgets.txt', $folder.'custom_sidebars.txt' );
		if( isset( $_POST['rev_slider'] ) && $_POST['rev_slider'] == 'yes' ) {
			$zozo_import->zozo_import_revslider( $demo_type, $folder.'rev_slider.zip' );
		}

        echo "imported";
		die();
    }

    add_action('wp_ajax_zozo_import_demo_other_data', 'zozo_demo_import_other_data');
}

// Get Class
function zozo_name_to_class( $name ){
	$class = str_replace(array(' ',',','.','"',"'",'/',"\\",'+','=',')','(','*','&','^','%','$','#','@','!','~','`','<','>','?','[',']','{','}','|',':',),'',$name);
	$class = sanitize_html_class($class);
	return $class;
}

/* ================================================
 * Parsing Widgets Function
 * ================================================ */
// Thanks to http://wordpress.org/plugins/widget-settings-importexport/
function zozo_import_widget_data( $widget_data ) {
	$json_data = $widget_data;
	$json_data = json_decode( $json_data, true );
	$sidebar_data = $json_data[0];
	$widget_data = $json_data[1];
	
	foreach ( $widget_data as $widget_data_title => $widget_data_value ) {
		$widgets[ $widget_data_title ] = '';
		foreach( $widget_data_value as $widget_data_key => $widget_data_array ) {
			if( is_int( $widget_data_key ) ) {
				$widgets[$widget_data_title][$widget_data_key] = 'on';
			}
		}
	}
	unset($widgets[""]);

	foreach ( $sidebar_data as $title => $sidebar ) {
		$count = count( $sidebar );
		for ( $i = 0; $i < $count; $i++ ) {
			$widget = array( );
			$widget['type'] = trim( substr( $sidebar[$i], 0, strrpos( $sidebar[$i], '-' ) ) );
			$widget['type-index'] = trim( substr( $sidebar[$i], strrpos( $sidebar[$i], '-' ) + 1 ) );
			if ( !isset( $widgets[$widget['type']][$widget['type-index']] ) ) {
				unset( $sidebar_data[$title][$i] );
			}
		}
		$sidebar_data[$title] = array_values( $sidebar_data[$title] );
	}

	foreach ( $widgets as $widget_title => $widget_value ) {
		foreach ( $widget_value as $widget_key => $widget_value ) {
			$widgets[$widget_title][$widget_key] = $widget_data[$widget_title][$widget_key];
		}
	}

	$sidebar_data = array( array_filter( $sidebar_data ), $widgets );

	zozo_parse_import_data( $sidebar_data );
}

/**
 * Import widgets
 * @param array $import_array
 */
function zozo_parse_import_data( $import_array ) {
	global $wp_registered_sidebars;
	
	$sidebars_data = $import_array[0];
	$widget_data = $import_array[1];
	$current_sidebars = get_option( 'sidebars_widgets' );
	$new_widgets = array( );

	foreach ( $sidebars_data as $import_sidebar => $import_widgets ) :

		foreach ( $import_widgets as $import_widget ) :
			//if the sidebar exists
			if ( isset( $wp_registered_sidebars[$import_sidebar] ) ) :
				$title = trim( substr( $import_widget, 0, strrpos( $import_widget, '-' ) ) );
				$index = trim( substr( $import_widget, strrpos( $import_widget, '-' ) + 1 ) );
				$current_widget_data = get_option( 'widget_' . $title );
				$new_widget_name = zozo_get_new_widget_name( $title, $index );
				$new_index = trim( substr( $new_widget_name, strrpos( $new_widget_name, '-' ) + 1 ) );

				if ( !empty( $new_widgets[ $title ] ) && is_array( $new_widgets[$title] ) ) {
					while ( array_key_exists( $new_index, $new_widgets[$title] ) ) {
						$new_index++;
					}
				}
				$current_sidebars[$import_sidebar][] = $title . '-' . $new_index;
				if ( array_key_exists( $title, $new_widgets ) ) {
					$new_widgets[$title][$new_index] = $widget_data[$title][$index];
					$multiwidget = $new_widgets[$title]['_multiwidget'];
					unset( $new_widgets[$title]['_multiwidget'] );
					$new_widgets[$title]['_multiwidget'] = $multiwidget;
				} else {
					$current_widget_data[$new_index] = $widget_data[$title][$index];
					$current_multiwidget = isset($current_widget_data['_multiwidget']) ? $current_widget_data['_multiwidget'] : false;
					$new_multiwidget = isset($widget_data[$title]['_multiwidget']) ? $widget_data[$title]['_multiwidget'] : false;
					$multiwidget = ($current_multiwidget != $new_multiwidget) ? $current_multiwidget : 1;
					unset( $current_widget_data['_multiwidget'] );
					$current_widget_data['_multiwidget'] = $multiwidget;
					$new_widgets[$title] = $current_widget_data;
				}

			endif;
		endforeach;
	endforeach;

	if ( isset( $new_widgets ) && isset( $current_sidebars ) ) {
		update_option( 'sidebars_widgets', $current_sidebars );

		foreach ( $new_widgets as $title => $content )
			update_option( 'widget_' . $title, $content );

		return true;
	}

	return false;
}

function zozo_get_new_widget_name( $widget_name, $widget_index ) {
	$current_sidebars = get_option( 'sidebars_widgets' );
	$all_widget_array = array( );
	foreach ( $current_sidebars as $sidebar => $widgets ) {
		if ( !empty( $widgets ) && is_array( $widgets ) && $sidebar != 'wp_inactive_widgets' ) {
			foreach ( $widgets as $widget ) {
				$all_widget_array[] = $widget;
			}
		}
	}
	while ( in_array( $widget_name . '-' . $widget_index, $all_widget_array ) ) {
		$widget_index++;
	}
	$new_widget_name = $widget_name . '-' . $widget_index;
	return $new_widget_name;
}