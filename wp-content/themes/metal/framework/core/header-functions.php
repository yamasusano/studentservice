<?php
/* ======================================
 * Header Functions
 *
 *	zozo_page_loader()
 *	zozo_secondary_menu()
 *	zozo_sliding_bar()
 *  zozo_display_sliding_bar()
 *	zozo_header_wrapper()
 *  zozo_header_top_bar()
 *  zozo_header_layout()
 *  zozo_header_elements_wrapper()
 *  zozo_header_elements()
 *  zozo_header_toggle_elements()
 *  zozo_header_contact_info()
 *  zozo_woo_get_cart()
 *  zozo_top_bar_menu()
 *  zozo_main_menu()
 *  zozo_main_right_menu()
 *  zozo_main_mobile_menu()
 *  zozo_logo()
 *	zozo_header_top_anchor()
 *  zozo_mobile_header_wrapper()
 *  zozo_mobile_header_layout()
 *  zozo_mobile_menu_wrapper()
 *	zozo_page_slider_wrapper()
 *	zozo_featured_post_slider()
 *
 * ====================================== */

/* ======================================
 * Page Loader
 * ====================================== */

if (!function_exists('zozo_page_loader')) {
    function zozo_page_loader()
    {
        if (zozo_get_theme_option('zozo_disable_page_loader') != 1) {
            $custom_loader_img = zozo_get_theme_option('zozo_page_loader_img');

            echo '<div class="pageloader">';
            if (isset($custom_loader_img) && (isset($custom_loader_img['url']) && $custom_loader_img['url'] != '')) {
                echo '<div class="zozo-custom-loader"><img class="img-responsive custom-loader-img" src="'.esc_url($custom_loader_img['url']).'" alt="'.__('Pageloader', 'zozothemes').'" width="'.esc_attr($custom_loader_img['width']).'" height="'.esc_attr($custom_loader_img['height']).'" /></div>'."\n";
            } else {
                echo '<div class="zozo-custom-loader"><img class="img-responsive page-loader-img" src="'.ZOZOTHEME_URL.'/images/page-loader.GIF'.'" alt="'.__('Pageloader', 'zozothemes').'" width="64" height="79" /></div>';
            }
            echo '</div>';
        }
    }

    add_action('zozo_before_page_wrapper', 'zozo_page_loader', 5);
}

/* ======================================
 * Secondary Menu
 * ====================================== */

if (!function_exists('zozo_secondary_menu')) {
    function zozo_secondary_menu()
    {
        if (zozo_get_theme_option('zozo_enable_secondary_menu') == 1) {
            echo '<div class="secondary_menu '.esc_attr(zozo_get_theme_option('zozo_secondary_menu_position')).'">';
            echo '<a href="#" target="_self" class="secondary_menu_close"><i class="fa fa-times"></i></a>';
            ob_start();
            dynamic_sidebar('secondary-menu');
            echo ob_get_clean();
            echo '</div>';
        }
    }

    add_action('zozo_before_page_wrapper', 'zozo_secondary_menu', 10);
}

/* ======================================
 * Sliding Bar
 * ====================================== */

if (!function_exists('zozo_sliding_bar')) {
    function zozo_sliding_bar()
    {
        $post_id = zozo_get_post_id();
        $sliding_bar = '';
        $sliding_bar = get_post_meta($post_id, 'zozo_show_header_sliding_bar', true);
        if (isset($sliding_bar) && $sliding_bar == '' || $sliding_bar == 'default') {
            $sliding_bar = zozo_get_theme_option('zozo_enable_sliding_bar');
            if ($sliding_bar == 1) {
                $sliding_bar = 'yes';
            } else {
                $sliding_bar = 'no';
            }
        }

        if (isset($sliding_bar) && $sliding_bar == 'yes') {
            echo zozo_display_sliding_bar();
        }
    }

    add_action('zozo_header_wrapper_start', 'zozo_sliding_bar', 5);
}

if (!function_exists('zozo_display_sliding_bar')) {
    function zozo_display_sliding_bar()
    {
        global $post;

        $sliding_bar_columns = zozo_get_theme_option('zozo_sliding_bar_columns');
        $sliding_bar_output = '';

        $sliding_bar_output .= '<div id="slidingbar-section" class="zozo-sliding-bar-wrapper sliding-bar-section">';
        $sliding_bar_output .= '<div class="slidingbar-inner">';
        $sliding_bar_output .= '<div class="container">';
        $sliding_bar_output .= '<div class="row">';
        $sliding_bar_output .= '<div class="sliding-bar-columns slidingbar-columns-'.esc_attr($sliding_bar_columns).'">';

        $column_width = 12 / $sliding_bar_columns;

        for ($i = 1; $i < 5; ++$i) {
            if ($sliding_bar_columns >= $i) {
                $sliding_bar_output .= sprintf('<div id="sliding-widget-%s" class="sliding-bar-widgets col-md-%s col-sm-6 col-xs-12">', $i, $column_width, $column_width);

                ob_start();
                dynamic_sidebar('sliding-bar-'.esc_attr($i));
                $sliding_bar_output .= ob_get_clean();

                $sliding_bar_output .= '</div>';
            }
        }

        $sliding_bar_output .= '</div>';
        $sliding_bar_output .= '</div>';
        $sliding_bar_output .= '</div>';
        $sliding_bar_output .= '</div>';
        $sliding_bar_output .= '<div class="slidingbar-toggle-wrapper">';
        $sliding_bar_output .= '<a href="#" class="slidingbar-nav"></a>';
        $sliding_bar_output .= '</div>';
        $sliding_bar_output .= '</div>';

        return $sliding_bar_output;
    }
}

/* ======================================
 * Header Wrapper
 * ====================================== */

if (!function_exists('zozo_header_wrapper')) {
    function zozo_header_wrapper()
    {
        $post_id = zozo_get_post_id();
        $show_header = '';
        $show_header = get_post_meta($post_id, 'zozo_show_header', true);
        if (!$show_header) {
            $show_header = 'yes';
        }

        // Header Layout
        $header_layout = '';
        $header_layout = get_post_meta($post_id, 'zozo_header_layout', true);
        if (isset($header_layout) && $header_layout == '' || $header_layout == 'default') {
            $header_layout = zozo_get_theme_option('zozo_header_layout');
        }

        if (!$header_layout) {
            $header_layout = 'fullwidth';
        }

        // Header Transparency
        $header_transparency = '';
        $header_transparency = get_post_meta($post_id, 'zozo_header_transparency', true);
        if (isset($header_transparency) && $header_transparency == '' || $header_transparency == 'default') {
            $header_transparency = zozo_get_theme_option('zozo_header_transparency');
        }

        if (!$header_transparency) {
            $header_transparency = 'no-transparent';
        }

        // Header Skin
        $header_skin = '';
        $header_skin = get_post_meta($post_id, 'zozo_header_skin', true);
        if (isset($header_skin) && $header_skin == '' || $header_skin == 'default') {
            $header_skin = zozo_get_theme_option('zozo_header_skin');
        }

        // Header Menu Skin
        $header_menu_skin = '';
        $header_menu_skin = get_post_meta($post_id, 'zozo_header_menu_skin', true);
        if (isset($header_menu_skin) && $header_menu_skin == '' || $header_menu_skin == 'default') {
            $header_menu_skin = zozo_get_theme_option('zozo_header_menu_skin');
        }

        // Header Type
        $header_type = '';
        $header_toggle_position = '';

        $header_type = get_post_meta($post_id, 'zozo_header_type', true);
        $header_toggle_position = get_post_meta($post_id, 'zozo_header_toggle_position', true);

        if (isset($header_type) && $header_type == '' || $header_type == 'default') {
            $header_type = zozo_get_theme_option('zozo_header_type');
        }

        if (isset($header_toggle_position) && $header_toggle_position == '' || $header_toggle_position == 'default') {
            $header_toggle_position = zozo_get_theme_option('zozo_header_toggle_position');
        }

        $header_extra_class = '';
        if ($header_type == 'header-4' || $header_type == 'header-5' || $header_type == 'header-6' || $header_type == 'header-11') {
            $header_extra_class = ' header-fullwidth-menu';
            $header_extra_class .= ' header-menu-skin-'.$header_menu_skin;
        }

        if ($header_type == 'header-9') {
            $header_extra_class .= ' header-toggle-position-'.$header_toggle_position.'';
        }

        if (isset($show_header) && $show_header == 'yes') {
            ?>
			<div id="header" class="header-section type-<?php echo esc_attr($header_type); ?><?php echo esc_attr($header_extra_class); ?> header-skin-<?php echo esc_attr($header_skin); ?> header-<?php echo esc_attr($header_transparency); ?>">
				<?php if (isset($header_layout) && $header_layout == 'boxed') {
                ?>
					<div class="container boxed-header">
						<div class="row">
				<?php
            }
            /*
             * @hooked - zozo_header_top_bar - 5
            **/
            do_action('zozo_header_section_start');
            echo zozo_header_layout($header_type);
            do_action('zozo_header_section_end');

            if (isset($header_layout) && $header_layout == 'boxed') {
                ?>
						</div>
					</div>
				<?php
            } ?>
			</div><!-- #header -->
		<?php
        }
    }

    add_action('zozo_header_wrapper_start', 'zozo_header_wrapper', 20);
}

if (!function_exists('zozo_header_top_bar')) {
    function zozo_header_top_bar()
    {
        $post_id = zozo_get_post_id();
        $header_top_bar = '';
        $header_top_bar = get_post_meta($post_id, 'zozo_show_header_top_bar', true);
        if (isset($header_top_bar) && $header_top_bar == '' || $header_top_bar == 'default') {
            $header_top_bar = zozo_get_theme_option('zozo_enable_header_top_bar');
            if ($header_top_bar == 1) {
                $header_top_bar = 'yes';
            } else {
                $header_top_bar = 'no';
            }
        }

        // Header Type
        $header_type = '';
        $header_type = get_post_meta($post_id, 'zozo_header_type', true);

        if (isset($header_type) && $header_type == '' || $header_type == 'default') {
            $header_type = zozo_get_theme_option('zozo_header_type');
        }

        if (isset($header_type) && $header_type != 'header-10') {
            if (isset($header_top_bar) && $header_top_bar == 'yes') {
                $topbar_left_output = $topbar_right_output = '';
                $topbar_left_output = zozo_header_elements_wrapper('top-bar', 'left');
                $topbar_right_output = zozo_header_elements_wrapper('top-bar', 'right');

                echo '<div id="header-top-bar" class="header-top-section" style="display:none">';
                echo '<div class="container">';
                echo '<div class="row">';
                if (isset($topbar_left_output) && $topbar_left_output != '') {
                    echo '<div class="col-sm-6 zozo-top-left">'.$topbar_left_output.'</div>';
                }
                if (isset($topbar_right_output) && $topbar_right_output != '') {
                    echo '<div class="col-sm-6 zozo-top-right">'.$topbar_right_output.'</div>';
                }
                echo '</div>';
                echo '</div>';
                echo '</div>';
            }
        }
    }

    add_action('zozo_header_section_start', 'zozo_header_top_bar', 15);
}

if (!function_exists('zozo_header_layout')) {
    function zozo_header_layout($header_type = '')
    {
        $post_id = zozo_get_post_id();

        $header_top_bar = '';
        $header_top_bar = get_post_meta($post_id, 'zozo_show_header_top_bar', true);
        if (isset($header_top_bar) && $header_top_bar == '' || $header_top_bar == 'default') {
            $header_top_bar = zozo_get_theme_option('zozo_enable_header_top_bar');
            if ($header_top_bar == 1) {
                $header_top_bar = 'yes';
            } else {
                $header_top_bar = 'no';
            }
        }

        $header_toggle_position = '';
        $header_toggle_position = get_post_meta($post_id, 'zozo_header_toggle_position', true);
        if (isset($header_toggle_position) && $header_toggle_position == '' || $header_toggle_position == 'default') {
            $header_toggle_position = zozo_get_theme_option('zozo_header_toggle_position');
        }

        $header_output = '';
        // Header Type 1
        if ($header_type == 'header-1') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-left', 'logo');
            $header_output .= '<div class="zozo-header-main-bar" style="overflow:hidden">';
            $header_output .= '<ul class="nav navbar-nav zozo-main-bar" style="width:100%;"> ';
            $header_output .= '<li style="width:100%;">'.zozo_header_elements_wrapper('main-bar', '', 'header-1').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-1', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 2
        elseif ($header_type == 'header-2') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('navbar-right', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', '', 'header-2').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-2', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 3
        elseif ($header_type == 'header-3') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', '', 'header-3').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-3', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 4
        elseif ($header_type == 'header-4') {
            $header_output .= '<div id="header-logo-bar" class="header-logo-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-left', 'logo');
            $header_output .= '<div class="zozo-header-logo-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-logo-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('logo-bar', '', 'header-4').'</li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-logo-section -->';

            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'left', 'header-4').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'right', 'header-4').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-4', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 5
        elseif ($header_type == 'header-5') {
            $header_output .= '<div id="header-logo-bar" class="header-logo-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-logo-section -->';

            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'left', 'header-5').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'right', 'header-5').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-5', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 6
        elseif ($header_type == 'header-6') {
            $header_output .= '<div id="header-logo-bar" class="header-logo-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-left', 'logo');
            $header_output .= '<div class="zozo-header-logo-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-logo-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('logo-bar', '', 'header-6').'</li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-logo-section -->';

            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'left', 'header-6').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'right', 'header-6').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-6', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 7
        elseif ($header_type == 'header-7') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements('primary-menu', 'main-bar', '').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements('primary-right-menu', 'main-bar', '').'</li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 8
        elseif ($header_type == 'header-8') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements('primary-menu', 'main-bar', '').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements('primary-right-menu', 'main-bar', '').'</li>';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'right', 'header-8').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-8', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 9
        elseif ($header_type == 'header-9') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-left', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li class="header-side-wrapper"><a id="nav-side-menu" class="menu-bars-link" href="#"><span></span></a></li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';

            $header_output .= '<div id="header-toggle" class="header-toggle-section header-position-'.esc_attr($header_toggle_position).'">';
            $header_output .= '<div class="header-toggle-inner">';
            $header_output .= '<a id="nav-close-menu" href="#" class="close-menu flaticon-cross31"></a>';
            $header_output .= '<div id="header-side-main" class="header-side-main-section clearfix">';
            $header_output .= '<div class="zozo-header-side-main-bar">';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-9');
            $header_output .= '</div>';
            $header_output .= '</div>';
            $header_output .= '</div>';
            $header_output .= '</div>';
        }
        // Header Type 10
        elseif ($header_type == 'header-10') {
            $header_output .= '<div id="header-side-nav" class="header-sidenav-section header-position-'.esc_attr($header_toggle_position).'">';
            $header_output .= '<div class="header-side-wrapper">';
            if (isset($header_top_bar) && $header_top_bar == 'yes') {
                $topbar_left_output = $topbar_right_output = '';
                $topbar_left_output = zozo_header_elements_wrapper('top-bar', 'left');
                $topbar_right_output = zozo_header_elements_wrapper('top-bar', 'right');

                $header_output .= '<div id="header-side-top-bar" class="header-top-section header-side-top-section">';
                $header_output .= '<div class="container">';
                $header_output .= '<div class="row">';
                if (isset($topbar_left_output) && $topbar_left_output != '') {
                    $header_output .= '<div class="col-sm-6 zozo-top-left">'.$topbar_left_output.'</div>';
                }
                if (isset($topbar_right_output) && $topbar_right_output != '') {
                    $header_output .= '<div class="col-sm-6 zozo-top-right">'.$topbar_right_output.'</div>';
                }
                $header_output .= '</div>';
                $header_output .= '</div>';
                $header_output .= '</div>';
            }

            $header_output .= '<div id="header-side-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav zozo-main-bar zozo-vertical-side-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', '', 'header-10').'</li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .header-sidenav-section -->';
        }
        // Header Type 11
        elseif ($header_type == 'header-11') {
            $header_output .= '<div id="header-logo-bar" class="header-logo-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-left', 'logo');
            $header_output .= '<div class="zozo-header-logo-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-logo-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('logo-bar', '', 'header-11').'</li>';
            $header_output .= '</ul>';
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-logo-section -->';

            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= '<div class="zozo-header-main-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-left zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'left', 'header-11').'</li>';
            $header_output .= '</ul>';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('main-bar', 'right', 'header-11').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('main-bar', '', 'header-11', '', 'yes');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }
        // Header Type 12
        elseif ($header_type == 'header-12') {
            $header_output .= '<div id="header-main" class="header-main-section navbar">';
            $header_output .= '<div class="container">';
            $header_output .= zozo_logo('logo-center', 'logo');
            $header_output .= '<div class="zozo-header-main-bar zozo-header-toggle-bar">';
            $header_output .= '<ul class="nav navbar-nav navbar-right zozo-main-bar">';
            $header_output .= '<li>'.zozo_header_elements_wrapper('toggle-bar', '', 'header-12', 'icon').'</li>';
            $header_output .= '</ul>';
            $header_output .= zozo_header_elements_wrapper('toggle-bar', '', 'header-12', 'content');
            $header_output .= '</div>';
            $header_output .= '</div><!-- .container -->';
            $header_output .= '</div><!-- .header-main-section -->';
        }

        return $header_output;
    }
}

if (!function_exists('zozo_header_elements_wrapper')) {
    function zozo_header_elements_wrapper($type = '', $position = '', $header_type = '', $toggle_type = '', $only_search = '')
    {
        $topbar_config = array();
        $mainbar_config = array();
        $logobar_config = array();
        $togglebar_config = array();
        $topbar_output = $topbar_text = '';
        $mainbar_output = $mainbar_text = '';
        $logobar_output = $logobar_text = '';
        $togglebar_output = $togglebar_text = '';

        // Top Bar
        if ($type == 'top-bar' && $position == 'left') {
            $topbar_config = zozo_get_theme_option('zozo_header_top_bar_left');
            $topbar_text = zozo_get_theme_option('zozo_header_top_bar_left_text');
        } elseif ($type == 'top-bar' && $position == 'right') {
            $topbar_config = zozo_get_theme_option('zozo_header_top_bar_right');
            $topbar_text = zozo_get_theme_option('zozo_header_top_bar_right_text');
        }

        // Main Bar
        if ($type == 'main-bar' && ($header_type == 'header-1' || $header_type == 'header-2' || $header_type == 'header-3' || $header_type == 'header-9' || $header_type == 'header-10' || $header_type == 'header-12')) {
            $mainbar_config = zozo_get_theme_option('zozo_header_elements_config');
            $mainbar_text = zozo_get_theme_option('zozo_header_elements_text');
        } elseif ($type == 'main-bar' && ($header_type == 'header-4' || $header_type == 'header-5' || $header_type == 'header-6' || $header_type == 'header-11')) {
            if ($position == 'left') {
                $mainbar_config = zozo_get_theme_option('zozo_header_left_config');
                $mainbar_text = zozo_get_theme_option('zozo_header_left_text');
            } elseif ($position == 'right') {
                $mainbar_config = zozo_get_theme_option('zozo_header_right_config');
                $mainbar_text = zozo_get_theme_option('zozo_header_right_text');
            }
        } elseif ($type == 'main-bar' && $header_type == 'header-8') {
            $mainbar_config = zozo_get_theme_option('zozo_header_right_alt_config');
            $mainbar_text = zozo_get_theme_option('zozo_header_right_alt_text');
        }

        // Logo Bar
        if ($type == 'logo-bar' && ($header_type == 'header-4' || $header_type == 'header-6' || $header_type == 'header-11')) {
            $logobar_config = zozo_get_theme_option('zozo_header_logo_bar_config');
            $logobar_text = zozo_get_theme_option('zozo_header_logo_bar_text');
        }

        // Toggle Bar
        if ($type == 'toggle-bar' && $header_type == 'header-12') {
            $togglebar_config = zozo_get_theme_option('zozo_header_elements_config');
            $togglebar_text = zozo_get_theme_option('zozo_header_elements_text');
        }

        if ($type == 'top-bar') {
            if (!empty($topbar_config) && isset($topbar_config['enabled'])) {
                foreach ($topbar_config['enabled'] as $item_id => $item) {
                    $topbar_output .= zozo_header_elements($item_id, 'top-bar-item', $topbar_text);
                }
            }

            return $topbar_output;
        } elseif ($type == 'main-bar') {
            if ($header_type == 'header-4' || $header_type == 'header-5' || $header_type == 'header-6' || $header_type == 'header-11') {
                $mainbar_config_common = '';
                $mainbar_left_config = zozo_get_theme_option('zozo_header_left_config');
                $mainbar_right_config = zozo_get_theme_option('zozo_header_right_config');

                $mainbar_config_common = array_intersect_key($mainbar_left_config['enabled'], $mainbar_right_config['enabled']);

                if (zozo_get_theme_option('zozo_header_search_type') == 1) {
                    if (array_key_exists('search-icon', $mainbar_config_common) || array_key_exists('search-icon', $mainbar_left_config['enabled']) || array_key_exists('search-icon', $mainbar_right_config['enabled'])) {
                        if (isset($only_search) && $only_search == 'yes') {
                            if ($header_type != 'header-9' && $header_type != 'header-10') {
                                $mainbar_output .= zozo_header_elements('toggle-search', 'main-bar-item', '', 'content');
                            }
                        }
                    }
                }
            }

            if (!empty($mainbar_config) && isset($mainbar_config['enabled'])) {
                foreach ($mainbar_config['enabled'] as $item_id => $item) {
                    if (isset($only_search) && $only_search == 'yes') {
                        if ($item_id == 'search-icon' && ($header_type != 'header-9' && $header_type != 'header-10')) {
                            if (zozo_get_theme_option('zozo_header_search_type') == 1) {
                                $mainbar_output .= zozo_header_elements('toggle-search', 'main-bar-item', '', 'content');
                            }
                        }
                    } else {
                        if ($item_id == 'search-icon' && ($header_type != 'header-9' && $header_type != 'header-10')) {
                            if (zozo_get_theme_option('zozo_header_search_type') == 1) {
                                $mainbar_output .= zozo_header_elements('toggle-search', 'main-bar-item', '', 'icon');
                            } else {
                                $mainbar_output .= zozo_header_elements('main-search', 'main-bar-item');
                            }
                        } elseif ($item_id == 'primary-menu' && $header_type == 'header-9') {
                            $mainbar_output .= zozo_header_elements('mobile-menu', 'main-bar-item');
                        } else {
                            $mainbar_output .= zozo_header_elements($item_id, 'main-bar-item', $mainbar_text);
                        }
                    }
                }
            }

            return $mainbar_output;
        } elseif ($type == 'logo-bar') {
            if (!empty($logobar_config) && isset($logobar_config['enabled'])) {
                foreach ($logobar_config['enabled'] as $item_id => $item) {
                    $logobar_output .= zozo_header_elements($item_id, 'logo-bar-item', $logobar_text);
                }
            }

            return $logobar_output;
        } elseif ($type == 'toggle-bar') {
            if (!empty($togglebar_config) && isset($togglebar_config['enabled'])) {
                foreach ($togglebar_config['enabled'] as $item_id => $item) {
                    $togglebar_output .= zozo_header_toggle_elements($item_id, 'toggle-bar-item', $toggle_type, $togglebar_text);
                }
            }

            return $togglebar_output;
        }
    }
}

if (!function_exists('zozo_header_elements')) {
    function zozo_header_elements($element = '', $item_class = '', $shortcode_text = '', $search_type = '')
    {
        $element_output = '';

        if ($element == 'contact-info') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-contact-info">'.zozo_header_contact_info().'</div>'."\n";
        } elseif ($element == 'social-icons') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-social"><div id="header-social-links" class="header-social">'.zozo_display_social_icons().'</div></div>'."\n";
        } elseif ($element == 'search-icon') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-search"><div id="header-search-form" class="header-search-form">'.get_search_form(false).'</div></div>'."\n";
        }
        // else if( $element == "main-search" ) {
        // 	$element_output .= '<div class="'. esc_attr( $item_class ) .' item-main-search"><div id="header-main-search" class="header-main-right-search"><i class="fa fa-search btn-trigger"></i>'. get_search_form(false) .'</div></div>' . "\n";
        // }
        elseif ($element == 'toggle-search') {
            if ($search_type == 'icon') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-search-toggle"><i class="fa fa-search search-trigger"></i></div>'."\n";
            } elseif ($search_type == 'content') {
                $element_output .= '<div id="header-toggle-search" class="header-toggle-content header-toggle-search container"><i class="fa fa-times btn-toggle-close"></i>'.'<form role="search" method="get" id="searchform" action="'.esc_url(home_url('/')).'" class="search-form"><div class="toggle-search-form"><input type="text" value="" name="s" id="s" class="form-control" placeholder="'.esc_html__('Enter your text & hit Enter', 'zozothemes').'" /></div></form></div>'."\n";
            }
        } elseif ($element == 'cart-icon') {
            if (ZOZO_WOOCOMMERCE_ACTIVE) {
                $element_output .= '<div class="'.esc_attr($item_class).' item-cart zozo-woo-cart-info">'.zozo_woo_get_cart().'</div>'."\n";
            }
        } elseif ($element == 'secondary-menu') {
            if (zozo_get_theme_option('zozo_enable_secondary_menu') == 1) {
                $element_output .= '<div class="'.esc_attr($item_class).' item-secondary-menu"><div id="secondary-menu" class="header-main-bar-sidemenu side-menu"><a class="secondary_menu_button" href="javascript:void(0)"><i class="fa fa-bars"></i></a></div></div>'."\n";
            }
        } elseif ($element == 'welcome-msg') {
            if (zozo_get_theme_option('zozo_welcome_msg') != '') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-welcome-msg"><p class="welcome-msg">'.force_balance_tags(zozo_get_theme_option('zozo_welcome_msg')).'</p></div>'."\n";
            }
        } elseif ($element == 'top-menu') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-top-menu">'.zozo_top_bar_menu().'</div>'."\n";
        } elseif ($element == 'mobile-menu') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-main-mobile-menu">'.zozo_main_mobile_menu('primary').'</div>';
        } elseif ($element == 'primary-right-menu') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-main-right-menu">'.zozo_main_right_menu().'</div>';
        } elseif ($element == 'primary-menu') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-main-menu">'.zozo_main_menu().'</div>';
        } elseif ($element == 'address-info') {
            $element_output .= '<div class="'.esc_attr($item_class).' item-address-info">';
            if (zozo_get_theme_option('zozo_header_address') != '') {
                $element_output .= '<div class="header-details-box"><div class="header-details-icon header-address-icon"><i class="fa fa-map-marker"></i></div><div class="header-details-info header-address">'.force_balance_tags(zozo_get_theme_option('zozo_header_address')).'</div></div>';
            }

            if (zozo_get_theme_option('zozo_header_business_hours') != '') {
                $element_output .= '<div class="header-details-box"><div class="header-details-icon header-business-icon"><i class="fa fa-clock-o"></i></div><div class="header-details-info header-business-hours">'.force_balance_tags(zozo_get_theme_option('zozo_header_business_hours')).'</div></div>';
            }

            if ((zozo_get_theme_option('zozo_header_phone') != '') || (zozo_get_theme_option('zozo_header_email') != '')) {
                $element_output .= '<div class="header-details-box"><div class="header-details-icon header-contact-icon"><i class="fa fa-microphone"></i></div><div class="header-details-info header-contact-details"><strong>'.force_balance_tags(zozo_get_theme_option('zozo_header_phone')).'</strong><span><a href="mailto:'.esc_attr(zozo_get_theme_option('zozo_header_email')).'">'.esc_html(zozo_get_theme_option('zozo_header_email')).'</a>'.'</span></div></div>';
            }
            $element_output .= '</div>';
        } elseif ($element == 'text-shortcode') {
            if (isset($shortcode_text) && $shortcode_text != '') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-text">'.do_shortcode($shortcode_text).'</div>'."\n";
            }
        }

        return $element_output;
    }
}

if (!function_exists('zozo_header_toggle_elements')) {
    function zozo_header_toggle_elements($element = '', $item_class = '', $type = '', $shortcode_text = '')
    {
        $element_output = '';

        if ($element == 'contact-info') {
            if (zozo_get_theme_option('zozo_header_phone') != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-contact-phone"><i class="flaticon flaticon-mobilephone31 phone-trigger"></i></div>'."\n";
                } elseif ($type == 'content') {
                    $element_output .= '<div id="header-contact-phone" class="header-toggle-content header-contact-phone container"><i class="fa fa-times btn-toggle-close"></i>'.'<h3 class="header-phone">'.esc_html(zozo_get_theme_option('zozo_header_phone')).'</h3></div>'."\n";
                }
            }
            if (zozo_get_theme_option('zozo_header_email') != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-contact-email"><i class="fa fa-envelope email-trigger"></i></div>'."\n";
                } elseif ($type == 'content') {
                    $element_output .= '<div id="header-contact-email" class="header-toggle-content header-contact-email container"><i class="fa fa-times btn-toggle-close"></i>'.'<h3 class="header-email"><a href="mailto:'.esc_attr(zozo_get_theme_option('zozo_header_email')).'">'.esc_html(zozo_get_theme_option('zozo_header_email')).'</a></h3></div>'."\n";
                }
            }
        } elseif ($element == 'social-icons') {
            if ($type == 'icon') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-social-toggle"><i class="fa fa-share-alt social-trigger"></i></div>'."\n";
            } elseif ($type == 'content') {
                $element_output .= '<div id="header-toggle-social" class="header-toggle-content header-toggle-social container"><i class="fa fa-times btn-toggle-close"></i>'.zozo_display_social_icons().'</div>'."\n";
            }
        } elseif ($element == 'search-icon') {
            if ($type == 'icon') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-search-toggle"><i class="fa fa-search search-trigger"></i></div>'."\n";
            } elseif ($type == 'content') {
                $element_output .= '<div id="header-toggle-search" class="header-toggle-content header-toggle-search container"><i class="fa fa-times btn-toggle-close"></i>'.'<form role="search" method="get" id="searchform" action="'.esc_url(home_url('/')).'" class="search-form"><div class="toggle-search-form"><input type="text" value="" name="s" id="s" class="form-control" placeholder="'.esc_html__('Enter your text & hit Enter', 'zozothemes').'" /></div></form></div>'."\n";
            }
        } elseif ($element == 'cart-icon') {
            if ($type != 'content') {
                if (ZOZO_WOOCOMMERCE_ACTIVE) {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-cart zozo-woo-cart-info">'.zozo_woo_get_cart().'</div>'."\n";
                }
            }
        } elseif ($element == 'secondary-menu') {
            if ($type != 'content') {
                if (zozo_get_theme_option('zozo_enable_secondary_menu') == 1) {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-secondary-menu"><div id="secondary-menu" class="header-main-bar-sidemenu side-menu"><a class="secondary_menu_button" href="javascript:void(0)"><i class="fa fa-bars"></i></a></div></div>'."\n";
                }
            }
        } elseif ($element == 'primary-menu') {
            if ($type != 'content') {
                $element_output .= '<div class="'.esc_attr($item_class).' item-main-menu">'.zozo_main_menu().'</div>';
            }
        } elseif ($element == 'address-info') {
            $header_address = zozo_get_theme_option('zozo_header_address');
            $header_business_hours = zozo_get_theme_option('zozo_header_business_hours');

            if ($header_address != '' || $header_business_hours != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-address-info">';
                }
            }
            if ($header_address != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).'-level item-address-details"><i class="fa fa-map-marker address-trigger"></i></div>'."\n";
                } elseif ($type == 'content') {
                    $element_output .= '<div id="header-address-details" class="header-toggle-content header-address-details container"><i class="fa fa-times btn-toggle-close"></i>'.'<h3 class="header-address">'.force_balance_tags($header_address).'</h3></div>'."\n";
                }
            }

            if ($header_business_hours != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).'-level item-business-hours"><i class="fa fa-clock-o business-trigger"></i></div>'."\n";
                } elseif ($type == 'content') {
                    $element_output .= '<div id="header-business-hours" class="header-toggle-content header-business-hours container"><i class="fa fa-times btn-toggle-close"></i>'.'<h3 class="header-hours">'.force_balance_tags($header_business_hours).'</h3></div>'."\n";
                }
            }
            if ($header_address != '' || $header_business_hours != '') {
                if ($type == 'icon') {
                    $element_output .= '</div>';
                }
            }
        } elseif ($element == 'text-shortcode') {
            if (isset($shortcode_text) && $shortcode_text != '') {
                if ($type == 'icon') {
                    $element_output .= '<div class="'.esc_attr($item_class).' item-text"><i class="fa fa-info text-trigger"></i></div>'."\n";
                } elseif ($type == 'content') {
                    $element_output .= '<div id="header-custom-text" class="header-toggle-content header-custom-text container"><i class="fa fa-times btn-toggle-close"></i>'.do_shortcode($shortcode_text).'</div>'."\n";
                }
            }
        }

        return $element_output;
    }
}

if (!function_exists('zozo_header_contact_info')) {
    function zozo_header_contact_info()
    {
        $header_phone = zozo_get_theme_option('zozo_header_phone');
        $header_email = zozo_get_theme_option('zozo_header_email');

        $output = '';

        $output .= '<div id="header-contact-info" class="top-contact-info">';
        $output .= '<ul class="header-contact-details">';
        if (isset($header_phone) && $header_phone != '') {
            $output .= '<li class="header-phone">'.esc_html($header_phone).'</li>';
        }
        if (isset($header_email) && $header_email != '') {
            $output .= '<li class="header-email">';
            $output .= '<a href="mailto:'.esc_attr($header_email).'">'.esc_html($header_email).'</a>';
            $output .= '</li>';
        }
        $output .= '</ul>';
        $output .= '</div>';

        return $output;
    }
}

if (!function_exists('zozo_woo_get_cart')) {
    function zozo_woo_get_cart()
    {
        global $woocommerce;

        $output = '';

        $output .= '<div class="woo-cart">';
        if (!$woocommerce->cart->cart_contents_count) {
            $output .= '<a class="cart-empty cart-icon" href="'.get_permalink(get_option('woocommerce_cart_page_id')).'"><i class="flaticon flaticon-shopping232"></i></a>';
        } else {
            $output .= '<a class="cart-icon" href="'.get_permalink(get_option('woocommerce_cart_page_id')).'"><i class="flaticon flaticon-shopping232"></i><span class="cart-count">'.wp_kses_post($woocommerce->cart->cart_contents_count).'</span></a>';
            $output .= '<div class="woo-cart-contents">';
            foreach ($woocommerce->cart->cart_contents as $cart_item_key => $cart_item) {
                $output .= '<div class="woo-cart-item clearfix">';

                $output .= '<a href="'.get_permalink($cart_item['product_id']).'" title="'.esc_html($cart_item['data']->post->post_title).'">';
                $thumbnail_id = ($cart_item['variation_id']) ? $cart_item['variation_id'] : $cart_item['product_id'];
                $output .= get_the_post_thumbnail($thumbnail_id, 'thumbnail');
                $output .= '<div class="cart-item-content">';
                $output .= '<h5 class="cart-product-title">'.wp_kses_post($cart_item['data']->post->post_title).'</h5>';
                $output .= '<p class="cart-product-quantity">'.wp_kses_post($cart_item['quantity']).' x '.wp_kses_post($woocommerce->cart->get_product_subtotal($cart_item['data'], 1)).'</p>';
                $output .= '</div>';
                $output .= '</a>';

                $output .= apply_filters('woocommerce_cart_item_remove_link', sprintf('<a href="%s" class="remove remove-cart-item" title="%s" data-cart_id="%s">&times;</a>', esc_url(WC()->cart->get_remove_url($cart_item_key)), esc_html__('Remove this item', 'zozothemes'), $cart_item_key), $cart_item_key);
                $output .= '<div class="ajax-loading"></div>';

                $output .= '</div>';
            }

            $output .= '<div class="woo-cart-total clearfix">';
            $output .= '<h5 class="cart-total">'.esc_html__('Total: ', 'zozothemes').' '.wp_kses_post($woocommerce->cart->get_cart_total()).'</h5>';
            $output .= '</div>';

            $output .= '<div class="woo-cart-links clearfix">';
            $output .= '<div class="cart-link"><a class="btn btn-cart" href="'.get_permalink(get_option('woocommerce_cart_page_id')).'" title="'.esc_html__('Cart', 'zozothemes').'">'.esc_html__('View Cart', 'zozothemes').'</a></div>';
            $output .= '<div class="checkout-link"><a class="btn btn-checkout" href="'.get_permalink(get_option('woocommerce_checkout_page_id')).'" title="'.esc_html__('Checkout', 'zozothemes').'">'.esc_html__('Checkout', 'zozothemes').'</a></div>';
            $output .= '</div>';
            $output .= '</div>';
        }
        $output .= '</div>';

        return $output;
    }
}

if (!function_exists('zozo_top_bar_menu')) {
    function zozo_top_bar_menu()
    {
        $top_menu_args = array(
            'echo' => false,
            'theme_location' => 'top-menu',
            'walker' => new wp_bootstrap_navwalker(),
            'fallback_cb' => 'wp_bootstrap_navwalker::fallback',
            'container_class' => 'zozo-nav top-menu-navigation',
            'container_id' => 'top-nav',
            'menu_id' => 'top-menu',
            'menu_class' => 'nav navbar-nav zozo-top-nav',
        );

        $top_menu_output = '';

        if (function_exists('wp_nav_menu')) {
            if (has_nav_menu('top-menu')) {
                $top_menu_output .= wp_nav_menu($top_menu_args);
            } else {
                $top_menu_output .= '<div class="no-menu">'.esc_html__('Please assign a menu to the Top Bar Menu', 'zozothemes').'</div>';
            }
        }

        return $top_menu_output;
    }
}

if (!function_exists('zozo_main_menu')) {
    function zozo_main_menu()
    {
        global $post;

        $post_id = '';
        $page_menu = '';

        if ((get_option('show_on_front') && get_option('page_for_posts') && is_home()) || (get_option('page_for_posts') && is_archive() && !is_tax('portfolio_categories') && !is_tax('portfolio_tags') && !is_tax('testimonial_categories') && !is_tax('team_categories') && (class_exists('Woocommerce') && !is_shop()) && !is_tax('product_cat') && !is_tax('product_tag'))) {
            $post_id = get_option('page_for_posts');
        } else {
            if (isset($post)) {
                $post_id = $post->ID;
            }

            if (ZOZO_WOOCOMMERCE_ACTIVE) {
                if (is_shop() || is_tax('product_cat') || is_tax('product_tag')) {
                    $post_id = get_option('woocommerce_shop_page_id');
                }
            }
        }

        $page_menu = get_post_meta($post_id, 'zozo_custom_nav_menu', true);

        if (zozo_get_theme_option('zozo_menu_type') != 'standard' && zozo_get_theme_option('zozo_menu_type') == 'megamenu') {
            $main_menu_args = array(
                'echo' => false,
                'container_class' => 'main-nav main-menu-container main-megamenu',
                'container_id' => 'main-nav-container',
                'menu_id' => 'main-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'primary-menu',
                'walker' => new ZozoMegaMenuFrontendWalker(),
                'fallback_cb' => 'ZozoMegaMenuFrontendWalker::fallback',
            );
        } else {
            $main_menu_args = array(
                'echo' => false,
                'container_class' => 'main-nav main-menu-container',
                'container_id' => 'main-nav-container',
                'menu_id' => 'main-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'primary-menu',
                'walker' => new wp_bootstrap_navwalker(),
                'fallback_cb' => 'wp_bootstrap_navwalker::fallback',
            );
        }

        if ($page_menu != '' && $page_menu != 'default') {
            $main_menu_args['menu'] = $page_menu;
        }

        $menu_extra_class = '';
        if (zozo_get_theme_option('zozo_menu_separator') == 1) {
            $menu_extra_class = ' menu-style-separator';
        }

        $menu_output = '';
        // Menu Output
        $menu_output .= '<div class="main-navigation-wrapper'.$menu_extra_class.'">'."\n";
        if (function_exists('wp_nav_menu')) {
            $menu_output .= wp_nav_menu($main_menu_args);
        }
        $menu_output .= '</div>'."\n";

        return $menu_output;
    }
}

if (!function_exists('zozo_main_right_menu')) {
    function zozo_main_right_menu()
    {
        if (zozo_get_theme_option('zozo_menu_type') != 'standard' && zozo_get_theme_option('zozo_menu_type') == 'megamenu') {
            $right_menu_args = array(
                'echo' => false,
                'container_class' => 'main-right-nav main-menu-container main-megamenu',
                'container_id' => 'main-right-nav-container',
                'menu_id' => 'main-right-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'primary-right',
                'walker' => new ZozoMegaMenuFrontendWalker(),
                'fallback_cb' => 'ZozoMegaMenuFrontendWalker::fallback',
            );
        } else {
            $right_menu_args = array(
                'echo' => false,
                'container_class' => 'main-right-nav main-menu-container',
                'container_id' => 'main-right-nav-container',
                'menu_id' => 'main-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'primary-right',
                'walker' => new wp_bootstrap_navwalker(),
                'fallback_cb' => 'wp_bootstrap_navwalker::fallback',
            );
        }

        $menu_extra_class = '';
        if (zozo_get_theme_option('zozo_menu_separator') == 1) {
            $menu_extra_class = ' menu-style-separator';
        }

        $right_menu_output = '';
        // Menu Output
        $right_menu_output .= '<div class="main-right-navigation-wrapper'.$menu_extra_class.'">'."\n";
        if (function_exists('wp_nav_menu')) {
            $right_menu_output .= wp_nav_menu($right_menu_args);
        }
        $right_menu_output .= '</div>'."\n";

        return $right_menu_output;
    }
}

if (!function_exists('zozo_main_mobile_menu')) {
    function zozo_main_mobile_menu($menu_type = '')
    {
        global $post;

        $post_id = '';
        $page_menu = '';
        $mobile_menu = '';

        if ((get_option('show_on_front') && get_option('page_for_posts') && is_home()) || (get_option('page_for_posts') && is_archive() && !is_tax('portfolio_categories') && !is_tax('portfolio_tags') && !is_tax('testimonial_categories') && !is_tax('team_categories') && (class_exists('Woocommerce') && !is_shop()) && !is_tax('product_cat') && !is_tax('product_tag'))) {
            $post_id = get_option('page_for_posts');
        } else {
            if (isset($post)) {
                $post_id = $post->ID;
            }

            if (ZOZO_WOOCOMMERCE_ACTIVE) {
                if (is_shop() || is_tax('product_cat') || is_tax('product_tag')) {
                    $post_id = get_option('woocommerce_shop_page_id');
                }
            }
        }

        $page_menu = get_post_meta($post_id, 'zozo_custom_nav_menu', true);
        $mobile_menu = get_post_meta($post_id, 'zozo_custom_mobile_menu', true);

        if (isset($menu_type) && $menu_type == 'primary') {
            $mobile_menu_args = array(
                'echo' => false,
                'container_class' => 'main-nav main-toggle-nav main-menu-container',
                'container_id' => 'main-toggle-nav',
                'menu_id' => 'main-toggle-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'primary-menu',
                'walker' => new wp_bootstrap_mobile_navwalker(),
                'fallback_cb' => 'wp_bootstrap_mobile_navwalker::fallback',
            );

            if ($page_menu != '' && $page_menu != 'default') {
                $mobile_menu_args['menu'] = $page_menu;
            }
        } else {
            $mobile_menu_args = array(
                'echo' => false,
                'container_class' => 'main-nav main-mobile-nav main-menu-container',
                'container_id' => 'main-mobile-nav',
                'menu_id' => 'main-mobile-menu',
                'menu_class' => 'nav navbar-nav navbar-main zozo-main-nav',
                'theme_location' => 'mobile-menu',
                'walker' => new wp_bootstrap_mobile_navwalker(),
                'fallback_cb' => 'wp_bootstrap_mobile_navwalker::fallback',
            );

            if ($mobile_menu != '' && $mobile_menu != 'default') {
                $mobile_menu_args['menu'] = $mobile_menu;
            }
        }

        $mobile_menu_output = '';
        // Menu Output
        $mobile_menu_output .= '<div class="main-mobile-navigation-wrapper">'."\n";
        if (function_exists('wp_nav_menu')) {
            $mobile_menu_output .= wp_nav_menu($mobile_menu_args);
        }
        $mobile_menu_output .= '</div>'."\n";

        return $mobile_menu_output;
    }
}

if (!function_exists('zozo_logo')) {
    function zozo_logo($logo_class = '', $logo_id = 'logo')
    {
        $logo = $retina_logo = $sticky_logo = array();
        $logo_output = '';

        $zozo_site_title = get_bloginfo('name');
        $zozo_site_url = home_url('/');
        $zozo_site_description = get_bloginfo('description');

        // Standard Logo
        $logo_opt = zozo_get_theme_option('zozo_logo');
        if (isset($logo_opt)) {
            $logo = $logo_opt;
        }

        // Retina Logo
        $retina_logo_opt = zozo_get_theme_option('zozo_retina_logo');
        if (isset($retina_logo_opt)) {
            $retina_logo = $retina_logo_opt;
        }

        // Sticky Logo
        $sticky_logo_opt = zozo_get_theme_option('zozo_sticky_logo');
        if (isset($sticky_logo_opt)) {
            $sticky_logo = $sticky_logo_opt;
        }

        if ($logo_id == 'mobile-logo') {
            $logo_class .= ' zozo-no-sticky-logo';
        } else {
            if (isset($sticky_logo) && $sticky_logo['url']) {
                $logo_class .= ' zozo-has-sticky-logo';
            } else {
                $logo_class .= ' zozo-no-sticky-logo';
            }
        }

        if (isset($retina_logo['url']) && $retina_logo['url'] == '' && $logo['url'] != '') {
            $retina_logo['url'] = $logo['url'];
        }

        if (isset($logo['url']) && $logo['url'] != '') {
            $logo_class .= ' has-img';
        } else {
            $logo_class .= ' no-img';
        }

        // Logo Output
        $logo_output .= '<div id="zozo-'.esc_attr($logo_id).'" class="navbar-header nav-respons zozo-'.esc_attr($logo_id).' '.$logo_class.'">'."\n";
        $logo_output .= '<a href="'.esc_url(home_url('/')).'" class="navbar-brand" title="'.esc_attr(get_bloginfo('name', 'display')).' - '.get_bloginfo('description').'" rel="home">'."\n";

        if ($logo_id == 'mobile-logo') {
            $mobile_logo = '';

            $mobile_logo_opt = zozo_get_theme_option('mobile_logo');
            if (isset($mobile_logo_opt)) {
                $mobile_logo = $mobile_logo_opt;
            }

            // Standard Mobile Logo
            if (isset($mobile_logo['url']) && $mobile_logo['url'] != '') {
                $logo_output .= '<img class="img-responsive zozo-mobile-standard-logo" src="'.esc_url($mobile_logo['url']).'" alt="'.$zozo_site_title.'" width="'.esc_attr($mobile_logo['width']).'" height="'.esc_attr($mobile_logo['height']).'" />'."\n";
            } elseif (isset($logo['url']) && $logo['url'] != '') {
                $logo_output .= '<img class="img-responsive zozo-standard-logo" src="'.esc_url($logo['url']).'" alt="'.$zozo_site_title.'" width="'.esc_attr($logo['width']).'" height="'.esc_attr($logo['height']).'" />'."\n";
            }

            // Text Logo
            if ((!isset($mobile_logo['url']) || $mobile_logo['url'] == '') && (!isset($logo['url']) || $logo['url'] == '')) {
                $logo_output .= '<div class="zozo-text-logo">';
                $logo_output .= '<h1 class="logo-h1 standard-mobile-logo">'.$zozo_site_title.'</h1>'."\n";
                $logo_output .= '</div>'."\n";
            }
        } else {
            // Standard Logo
            if (isset($logo['url']) && $logo['url'] != '') {
                $logo_output .= '<img class="img-responsive zozo-standard-logo" src="'.esc_url($logo['url']).'" alt="'.$zozo_site_title.'" width="'.esc_attr($logo['width']).'" height="'.esc_attr($logo['height']).'" />'."\n";
            }

            // Retina Logo
            if (isset($retina_logo['url']) && $retina_logo['url'] != '') {
                if (isset($retina_logo['height']) && $retina_logo['height'] != '') {
                    $logo_height = intval($retina_logo['height'], 10) / 2;
                } else {
                    $logo_height = intval($logo['height'], 10) / 2;
                }

                if (isset($retina_logo['width']) && $retina_logo['width'] != '') {
                    $logo_width = intval($retina_logo['width'], 10) / 2;
                } else {
                    $logo_width = intval($logo['width'], 10) / 2;
                }
                $logo_output .= '<img class="img-responsive zozo-retina-logo" src="'.$retina_logo['url'].'" alt="'.$zozo_site_title.'" height="'.$logo_height.'" width="'.$logo_width.'" />'."\n";
            }

            // Sticky Logo
            if (isset($sticky_logo['url']) && $sticky_logo['url'] != '') {
                $logo_output .= '<img class="img-responsive zozo-sticky-logo" src="'.esc_url($sticky_logo['url']).'" alt="'.$zozo_site_title.'" width="'.esc_attr($sticky_logo['width']).'" height="'.esc_attr($sticky_logo['height']).'" />'."\n";
            }

            // Text Logo
            $logo_output .= '<div class="zozo-text-logo">';
            if (!isset($logo['url']) || $logo['url'] == '') {
                $logo_output .= '<h1 class="logo-h1 standard-text-logo">'.$zozo_site_title.'</h1>'."\n";
            }
            if (!isset($retina_logo['url']) || $retina_logo['url'] == '') {
                $logo_output .= '<h1 class="logo-h1 retina-text-logo">'.$zozo_site_title.'</h1>'."\n";
            }
            $logo_output .= '</div>'."\n";
        }
        $logo_output .= '</a>'."\n";
        $logo_output .= '</div>'."\n";

        return $logo_output;
    }
}

/* ======================================
 * Mobile Header Wrapper
 * ====================================== */

if (!function_exists('zozo_mobile_header_wrapper')) {
    function zozo_mobile_header_wrapper()
    {
        $post_id = zozo_get_post_id();
        $show_header = '';
        $show_header = get_post_meta($post_id, 'zozo_show_header', true);
        if (!$show_header) {
            $show_header = 'yes';
        }

        $mobile_header_layout = zozo_get_theme_option('mobile_header_layout');
        $mobile_top_text = zozo_get_theme_option('mobile_top_text');

        // Header Transparency
        $header_transparency = '';
        $header_transparency = get_post_meta($post_id, 'zozo_header_transparency', true);
        if (isset($header_transparency) && $header_transparency == '' || $header_transparency == 'default') {
            $header_transparency = zozo_get_theme_option('zozo_header_transparency');
        }

        if (!$header_transparency) {
            $header_transparency = 'no-transparent';
        }

        // Header Skin
        $header_skin = '';
        $header_skin = get_post_meta($post_id, 'zozo_header_skin', true);
        if (isset($header_skin) && $header_skin == '' || $header_skin == 'default') {
            $header_skin = zozo_get_theme_option('zozo_header_skin');
        }

        if (isset($show_header) && $show_header == 'yes') {
            ?>
			<div id="mobile-header" class="mobile-header-section header-skin-<?php echo esc_attr($header_skin); ?> header-<?php echo esc_attr($header_transparency); ?> header-mobile-<?php echo $mobile_header_layout; ?>">
				<?php if (isset($mobile_top_text) && $mobile_top_text != '') {
                echo '<div id="mobile-top-text" class="mobile-top-bar-section"><div class="container">'.do_shortcode($mobile_top_text).'</div></div>';
            }
            echo zozo_mobile_header_layout($mobile_header_layout); ?>
			</div><!-- #mobile-header -->
		<?php
        }
    }

    add_action('zozo_header_wrapper_start', 'zozo_mobile_header_wrapper', 15);
}

if (!function_exists('zozo_mobile_header_layout')) {
    function zozo_mobile_header_layout($mobile_header_layout = '')
    {
        global $woocommerce;

        $mobile_header_class = '';
        $mobile_header_output = '';
        $mobile_menu_cart = '';

        $mobile_show_cart = zozo_get_theme_option('mobile_show_cart');
        $mobile_show_search = zozo_get_theme_option('mobile_show_search');

        $mobile_menu_link = '<div class="mobile-menu-item"><a href="#" class="mobile-menu-nav menu-bars-link"><span class="menu-bars"></span></a></div>';
        $mobile_menu_search = '<div class="mobile-search-item"><a href="#" class="mobile-menu-search"><i class="fa fa-search"></i></a></div>';

        if (ZOZO_WOOCOMMERCE_ACTIVE) {
            if (!$woocommerce->cart->cart_contents_count) {
                $mobile_menu_cart .= '<a class="cart-empty mobile-cart-empty" href="'.get_permalink(get_option('woocommerce_cart_page_id')).'"><i class="flaticon flaticon-shopping232"></i></a>';
            } else {
                $mobile_menu_cart .= '<a class="mobile-cart-link" href="#"><i class="flaticon flaticon-shopping232"></i><span class="cart-count">'.wp_kses_post($woocommerce->cart->cart_contents_count).'</span></a>';
            }
        }

        $mobile_header_output .= '<div id="header-mobile-main" class="header-mobile-main-section navbar">'."\n";
        $mobile_header_output .= '<div class="container">';

        if ($mobile_header_layout == 'right-logo') {
            $mobile_header_output .= '<div class="mobile-header-items-wrap">';
            $mobile_header_output .= $mobile_menu_link."\n";
            if (isset($mobile_show_search) && $mobile_show_search == 1) {
                $mobile_header_output .= $mobile_menu_search."\n";
            }
            if (ZOZO_WOOCOMMERCE_ACTIVE && (isset($mobile_show_cart) && $mobile_show_cart == 1)) {
                $mobile_header_output .= '<div class="mobile-cart-item">'.$mobile_menu_cart.'</div>'."\n";
            }
            $mobile_header_output .= '</div>';
            $mobile_header_output .= zozo_logo('logo-right', 'mobile-logo');
        } elseif ($mobile_header_layout == 'center-logo') {
            $mobile_header_output .= '<div class="mobile-header-items-wrap items-left">';
            $mobile_header_output .= $mobile_menu_link."\n";
            $mobile_header_output .= '</div>';
            $mobile_header_output .= zozo_logo('logo-center', 'mobile-logo');
            $mobile_header_output .= '<div class="mobile-header-items-wrap items-right">';
            if (isset($mobile_show_search) && $mobile_show_search == 1) {
                $mobile_header_output .= $mobile_menu_search."\n";
            }
            if (ZOZO_WOOCOMMERCE_ACTIVE && (isset($mobile_show_cart) && $mobile_show_cart == 1)) {
                $mobile_header_output .= '<div class="mobile-cart-item">'.$mobile_menu_cart.'</div>'."\n";
            }
            $mobile_header_output .= '</div>';
        } elseif ($mobile_header_layout == 'center-logo-alt') {
            $mobile_header_output .= '<div class="mobile-header-items-wrap items-left">';
            if (isset($mobile_show_search) && $mobile_show_search == 1) {
                $mobile_header_output .= $mobile_menu_search."\n";
            }
            if (ZOZO_WOOCOMMERCE_ACTIVE && (isset($mobile_show_cart) && $mobile_show_cart == 1)) {
                $mobile_header_output .= '<div class="mobile-cart-item">'.$mobile_menu_cart.'</div>'."\n";
            }
            $mobile_header_output .= '</div>';
            $mobile_header_output .= zozo_logo('logo-center', 'mobile-logo');
            $mobile_header_output .= '<div class="mobile-header-items-wrap items-right">';
            $mobile_header_output .= $mobile_menu_link."\n";
            $mobile_header_output .= '</div>';
        } else {
            $mobile_header_output .= zozo_logo('logo-left', 'mobile-logo');
            $mobile_header_output .= '<div class="mobile-header-items-wrap">';
            $mobile_header_output .= $mobile_menu_link."\n";
            if (isset($mobile_show_search) && $mobile_show_search == 1) {
                $mobile_header_output .= $mobile_menu_search."\n";
            }
            if (ZOZO_WOOCOMMERCE_ACTIVE && (isset($mobile_show_cart) && $mobile_show_cart == 1)) {
                $mobile_header_output .= '<div class="mobile-cart-item">'.$mobile_menu_cart.'</div>'."\n";
            }
            $mobile_header_output .= '</div>';
        }

        $mobile_header_output .= '</div>';
        $mobile_header_output .= '</div>'."\n";

        return $mobile_header_output;
    }
}

/* ======================================
 * Mobile Menu
 * ====================================== */

if (!function_exists('zozo_mobile_menu_wrapper')) {
    function zozo_mobile_menu_wrapper()
    {
        $mobile_header_layout = zozo_get_theme_option('mobile_header_layout');
        $mobile_show_search = zozo_get_theme_option('mobile_show_search');
        $mobile_show_translation = zozo_get_theme_option('mobile_show_translation');

        if (isset($mobile_header_layout) && ($mobile_header_layout == 'right-logo' || $mobile_header_layout == 'center-logo')) {
            echo '<div id="mobile-menu-wrapper" class="mobile-menu-wrapper mobile-menu-right">'."\n";
        } else {
            echo '<div id="mobile-menu-wrapper" class="mobile-menu-wrapper mobile-menu-left">'."\n";
        }

        if ((isset($mobile_show_translation) && $mobile_show_translation == 1) && (function_exists('pll_the_languages') || function_exists('icl_get_languages'))) {
            echo '<ul class="mobile-menu-languages">'.zozo_language_flags().'</ul>'."\n";
        }

        if (isset($mobile_show_search) && $mobile_show_search == 1) {
            echo '<form method="get" class="mobile-search-form" action="'.esc_url(home_url('/')).'"><input type="text" placeholder="'.__('Enter text to search', 'zozothemes').'" name="s" autocomplete="off" /></form>'."\n";
        }

        echo zozo_main_mobile_menu();

        echo '<div class="mobile-menu-item"><a href="#" class="mobile-menu-nav menu-bars-link"><span class="menu-bars"></span></a></div>';

        echo '</div>';
    }

    add_action('zozo_before_page_wrapper', 'zozo_mobile_menu_wrapper', 20);
}

/* ======================================
 * Mobile Cart
 * ====================================== */

if (!function_exists('zozo_mobile_cart_wrapper')) {
    function zozo_mobile_cart_wrapper()
    {
        $mobile_header_layout = zozo_get_theme_option('mobile_header_layout');
        $mobile_show_cart = zozo_get_theme_option('mobile_show_cart');

        if (ZOZO_WOOCOMMERCE_ACTIVE && (isset($mobile_show_cart) && $mobile_show_cart == 1)) {
            if (isset($mobile_header_layout) && ($mobile_header_layout == 'right-logo' || $mobile_header_layout == 'center-logo-alt')) {
                echo '<div id="mobile-cart-wrapper" class="mobile-cart-wrapper mobile-cart-right">'."\n";
            } else {
                echo '<div id="mobile-cart-wrapper" class="mobile-cart-wrapper mobile-cart-left">'."\n";
            }

            echo '<div class="zozo-woo-cart-info">';
            echo zozo_woo_get_cart();
            echo '</div>';

            echo '</div>';
        }
    }

    add_action('zozo_before_page_wrapper', 'zozo_mobile_cart_wrapper', 30);
}

/* ======================================
 * Mobile Search
 * ====================================== */

if (!function_exists('zozo_mobile_search_wrapper')) {
    function zozo_mobile_search_wrapper()
    {
        $mobile_header_layout = zozo_get_theme_option('mobile_header_layout');
        $mobile_show_search = zozo_get_theme_option('mobile_show_search');

        if (isset($mobile_show_search) && $mobile_show_search == 1) {
            echo '<div id="mobile-search-wrapper" class="mobile-search-wrapper mobile-overlay-search">'."\n";
            echo '<a href="#" target="_self" class="mobile-search-close"><i class="fa fa-times"></i></a>';

            echo '<div class="mobile-search-inner">'."\n";
            echo '<form method="get" action="'.esc_url(home_url('/')).'" class="search-form">';
            echo '<input type="text" value="" name="s" class="form-control" placeholder="'.esc_html__('Enter text to search', 'zozothemes').'" />';
            echo '<button class="btn btn-search" type="submit"><i class="fa fa-search"></i></button>';
            echo '</form>';
            echo '</div>';

            echo '</div>';
        }
    }

    add_action('zozo_before_page_wrapper', 'zozo_mobile_search_wrapper', 40);
}

/* ======================================
 * Language Flags
 * ====================================== */

if (!function_exists('zozo_language_flags')) {
    function zozo_language_flags()
    {
        $language_output = '';

        if (function_exists('pll_the_languages')) {
            $languages = pll_the_languages(array('raw' => 1));
            if (!empty($languages)) {
                foreach ($languages as $l) {
                    $language_output .= '<li>';
                    if ($l['flag']) {
                        if (!$l['current_lang']) {
                            $language_output .= '<a href="'.$l['url'].'"><img src="'.$l['flag'].'" height="12" alt="'.$l['slug'].'" width="18" /><span class="language name">'.$l['name'].'</span></a>'."\n";
                        } else {
                            $language_output .= '<div class="current-language"><img src="'.$l['flag'].'" height="12" alt="'.$l['slug'].'" width="18" /><span class="language name">'.$l['name'].'</span></div>'."\n";
                        }
                    }
                    $language_output .= '</li>';
                }
            }
        } elseif (function_exists('icl_get_languages')) {
            $languages = icl_get_languages('skip_missing=0&orderby=code');
            if (!empty($languages)) {
                foreach ($languages as $l) {
                    $language_output .= '<li>';
                    if ($l['country_flag_url']) {
                        if (!$l['active']) {
                            $language_output .= '<a href="'.$l['url'].'"><img src="'.$l['country_flag_url'].'" height="12" alt="'.$l['language_code'].'" width="18" /><span class="language name">'.$l['translated_name'].'</span></a>'."\n";
                        } else {
                            $language_output .= '<div class="current-language"><img src="'.$l['country_flag_url'].'" height="12" alt="'.$l['language_code'].'" width="18" /><span class="language name">'.$l['translated_name'].'</span></div>'."\n";
                        }
                    }
                    $language_output .= '</li>';
                }
            }
        }

        return $language_output;
    }
}

/* ======================================
 * Section Top anchor for One Page
 * ====================================== */

if (!function_exists('zozo_header_top_anchor')) {
    function zozo_header_top_anchor()
    {
        echo '<div id="section-top" class="zozo-top-anchor"></div>';
    }

    add_action('zozo_header_wrapper_start', 'zozo_header_top_anchor', 30);
}

/* ======================================
 * Page Slider
 * ====================================== */

if (!function_exists('zozo_page_slider_wrapper')) {
    function zozo_page_slider_wrapper()
    {
        global $post;

        $post_id = '';
        $object_id = get_queried_object_id();

        if (is_search()) {
            $post_id = '';
        }
        if (!is_search()) {
            $post_id = '';
            if (!is_home() && !is_front_page() && !is_archive() && isset($object_id)) {
                $post_id = $object_id;
            }
            if (!is_home() && is_front_page() && isset($object_id)) {
                $post_id = $object_id;
            }
            if (is_home() && !is_front_page()) {
                $post_id = get_option('page_for_posts');
            }
            if (class_exists('Woocommerce')) {
                if (is_shop()) {
                    $post_id = get_option('woocommerce_shop_page_id');
                }
            }
        }

        $rev_slider = get_post_meta($post_id, 'zozo_revolutionslider', true);

        if (ZOZO_REVSLIDER_ACTIVE && isset($rev_slider) && $rev_slider != '') {
            echo '<div class="zozo-revslider-section">';
            echo do_shortcode($rev_slider);
            echo '</div>';
        }
    }
}

/* ======================================
 * Featured Post Slider
 * ====================================== */

if (!function_exists('zozo_featured_post_slider')) {
    function zozo_featured_post_slider()
    {
        global $post;

        if (is_home()) {
            if (zozo_get_theme_option('zozo_show_blog_featured_slider') == 1) {
                get_template_part('partials/blog/featured', 'slider');
            }
        }
        // Featured Post Slider for Archives
        elseif (((is_archive() || is_tag() || is_category()) && !is_post_type_archive()) && !(is_tax('product_cat') || is_tax('product_tag'))) {
            if (zozo_get_theme_option('zozo_show_archive_featured_slider') == 1) {
                get_template_part('partials/blog/featured', 'slider');
            }
        }
    }
}
