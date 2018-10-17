<?php
/* =========================================
 * Enqueues parent theme stylesheet
 * ========================================= */

include 'includes/core/profile/gpf-register.php';
include 'includes/core/profile/gpf-profile.php';
include 'includes/core/group/menu-group.php';
include 'includes/core/entity.php';
include 'logout.php';
include 'validate.php';

add_action('wp_enqueue_scripts', 'zozo_enqueue_child_theme_styles');
function zozo_enqueue_child_theme_styles()
{
    //css
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri(), array(), null);
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri() . 'style.css', array(), null);
    //js
    wp_enqueue_script('jquery', get_stylesheet_directory_uri() . '/assets/js/jquery-1.12.4.js', array('jquery'), null, true);
    wp_register_script('custom-js', get_stylesheet_directory_uri() . '/assets/js/custom.js', array('jquery'), null, true);
    wp_enqueue_script('custom-js');

}

add_action('init', 'my_session', 1);
function my_session()
{
    if (!isset($_SESSION['access_token'])) {
        session_start();
    }
}
add_action('init', 'userLogIn', 2);
function userLogIn()
{if (!is_admin()) {
    if (isset($_SESSION['access_token'])) {
        $email = $_SESSION['email'];
        $account = getAccountName($email);
        $result = username_exists($account);
        if ($result) {
            loggIn($account);
        } else {
            $gender = $_SESSION['gender'];
            $user_name = $_SESSION['givenName'] . ' ' . $_SESSION['familyName'];
            registerNewUser($email, $user_name, $gender, $account);
        }
    }
}
}

function loggIn($account)
{
    $user = get_user_by('login', $account);
    if (!is_user_logged_in()) {
        if (!is_wp_error($user)) {
            clean_user_cache($user->ID);
            wp_clear_auth_cookie();
            wp_set_current_user($user->ID);
            wp_set_auth_cookie($user->ID, true, false);
            update_user_caches($user);
        }
    }
}

add_action('wp_logout', 'endSession');
function endSession()
{
    unset($_SESSION['access_token']);
    session_destroy();
}

add_action('verifyLogin', 'userLoggedIn');
function userLoggedIn()
{
    if (!is_user_logged_in()) {
        wp_redirect(home_url());
        exit;
    }
}

add_action('wp_ajax_nopriv_data_over_view', 'data_over_view');
add_action('wp_ajax_data_over_view', 'data_over_view');

function data_over_view()
{
    echo wp_send_json(['view' => overView()]);
    die();
}

add_action('wp_ajax_nopriv_change_button', 'change_button');
add_action('wp_ajax_change_button', 'change_button');
function change_button()
{
    echo wp_send_json(['btnChange' => btnChangeEdit()]);
    die();
}
add_action('wp_ajax_nopriv_update_profile', 'update_profile');
add_action('wp_ajax_update_profile', 'update_profile');

function update_profile()
{
    echo wp_send_json(['message' => 'update success.']);
    die();
}

add_action('wp_ajax_nopriv_menu_group', 'menu_group');
add_action('wp_ajax_menu_group', 'menu_group');
function menu_group()
{
    echo wp_send_json(['menu' => groupMenu()]);
    die();
}

add_action('wp_ajax_nopriv_finder_form', 'finder_form');
add_action('wp_ajax_finder_form', 'finder_form');
function finder_form()
{
    echo wp_send_json(['form' => finderForm()]);
    die();

}

add_action('wp_ajax_nopriv_post_finder_form', 'post_finder_form');
add_action('wp_ajax_post_finder_form', 'post_finder_form');
function post_finder_form()
{
    global $wpdb;
    //crreate value
    $message = '';
    $check = false;
    $title = $_POST['title'];
    $description = $_POST['description'];
    $members = $_POST['members'];
    $skill = $_POST['skill'];
    $supervisor = $_POST['supervisor'];
    $close_date = $_POST['close_date'];
    //end create

    //validate form
    $title_check = titleCheck($title);

    //end validate
    if (!$title_check['result']) {
        $message = 'Title'.$title_check['message'];
        $check = false;
    } else {
        $check = true;
    }

    $get_finder_form = $wpdb->insert(
        "{$wpdb->prefix}finder_form",
        [
        'user_id'        => get_current_user_id(),
        'title'          => $title,
        'description'    => $description,
        'other_skill'    => '', 
        'expiry_date'    => $skil,
        'status'         => 1
        ]
    );

        $user_id = get_current_user_id();
        $group_type = info('role');
        $form  = array('user-id'=>$user_id,'title' => $title,'description' =>$description,'group_type' =>$group_type,
        'members' =>$members,'skill' =>$skill,'suppervisor' =>$supervisor ,'closed' =>$close_date);


    echo wp_send_json(['check' => $check, 'message' => $form]);
    die();

}

function add_query_vars_filter($vars)
{
    $vars[] = "action";
    return $vars;
}
add_filter('query_vars', 'add_query_vars_filter');
