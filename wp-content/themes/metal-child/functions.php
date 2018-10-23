<?php
/* =========================================
 * Enqueues parent theme stylesheet
 * ========================================= */

include 'includes/core/profile/gpf-register.php';
include 'includes/core/profile/gpf-profile.php';
include 'includes/core/group/menu-group.php';
include 'includes/core/group/finder-form-action.php';
include 'includes/core/group/finder-form-insert.php';
include 'includes/core/entity.php';

include 'validate.php';

add_action('wp_enqueue_scripts', 'zozo_enqueue_child_theme_styles');
function zozo_enqueue_child_theme_styles()
{
    //css
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri(), array(), null);
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri().'style.css', array(), null);
    //js
    wp_enqueue_script('jquery', get_stylesheet_directory_uri().'/assets/js/jquery-1.12.4.js', array('jquery'), null, true);
    wp_register_script('custom-js', get_stylesheet_directory_uri().'/assets/js/custom.js', array('jquery'), null, true);
    wp_enqueue_script('custom-js');
}
//start session to login.
add_action('init', 'my_session', 1);
function my_session()
{
    if (!isset($_SESSION['access_token'])) {
        session_start();
    }
}

add_action('after_setup_theme', 'remove_admin_bar');
//remove admin bar via user.
function remove_admin_bar()
{
    if (!current_user_can('administrator') && !is_admin()) {
        show_admin_bar(false);
    }
}
//ADD button login and logout on menu.
add_filter('wp_nav_menu_items', 'add_login_logout_link', 10, 2);
function add_login_logout_link($items)
{
    ob_start();
    if (is_user_logged_in()) {
        $loginoutlink = '<a href="'.wp_logout_url($_SERVER['REQUEST_URI'], false).'" class="btn btn-danger" >Log Out</a>';
    } else {
        $loginoutlink = '<a href="'.home_url('login').'" class="btn btn-info" >Log In</a>';
    }
    ob_end_clean();
    $items .= '<li>'.$loginoutlink.'</li>';

    return $items;
}
//Check token via Google api to login or register new user.
add_action('init', 'userLogIn', 2);
function userLogIn()
{
    if (!is_admin()) {
        if (isset($_SESSION['access_token'])) {
            $email = $_SESSION['email'];
            $account = getAccountName($email);
            $result = username_exists($account);
            if ($result) {
                loggIn($account);
            } else {
                $gender = $_SESSION['gender'];
                $user_name = $_SESSION['givenName'].' '.$_SESSION['familyName'];
                registerNewUser($email, $user_name, $gender, $account);
            }
        }
    }
}
//set login for user.
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
//remove token via goole when logout user.
add_action('wp_logout', 'endSession');
function endSession()
{
    unset($_SESSION['access_token']);
    session_destroy();
}

//get basic user information.
add_action('wp_ajax_nopriv_data_over_view', 'data_over_view');
add_action('wp_ajax_data_over_view', 'data_over_view');

function data_over_view()
{
    echo wp_send_json(['view' => overView()]);
    die();
}
//event action click btn "edit" in overview profile.
add_action('wp_ajax_nopriv_change_button', 'change_button');
add_action('wp_ajax_change_button', 'change_button');
function change_button()
{
    echo wp_send_json(['btnChange' => btnChangeEdit()]);
    die();
}
add_action('wp_ajax_nopriv_update_profile', 'update_profile');
add_action('wp_ajax_update_profile', 'update_profile');
//update -edit information,update infor in database.
function update_profile()
{
    echo wp_send_json(['message' => 'update success.']);
    die();
}
//get menu list in user profile
add_action('wp_ajax_nopriv_menu_group', 'menu_group');
add_action('wp_ajax_menu_group', 'menu_group');
function menu_group()
{
    echo wp_send_json(['menu' => groupMenu()]);
    die();
}
//genarate Finder form in group.
add_action('wp_ajax_nopriv_finder_form', 'finder_form');
add_action('wp_ajax_finder_form', 'finder_form');
function finder_form()
{
    echo wp_send_json(['form' => finderForm()]);
    die();
}
//event action post Finder form to home page.
add_action('wp_ajax_nopriv_post_finder_form', 'post_finder_form');
add_action('wp_ajax_post_finder_form', 'post_finder_form');
function post_finder_form()
{
    global $wpdb;
    //crreate value
    $message = '';
    $type = 0;
    $title = $_POST['title'];
    $description = $_POST['description'];
    $members = $_POST['members'];
    $skill = $_POST['skill'];
    $other = $_POST['other'];
    $supervisor = $_POST['supervisor'];
    $close_date = $_POST['close_date'];
    $contact = $_POST['contact'];
    $group_type = info('role');
    $user_id = get_current_user_id();
    //end create

    $form_validate = validFormFinder($title, $description, $close_date);
    if (!isset($form_validate)) {
        $insert_finder_table = insert_finder_form($title, $description, $close_date, $other, $contact, $user_id);
        $suppervisor_id = get_user_by('login', $supervisor)->ID;
        if ($insert_finder_table) {
            $form_id = finder_form_id($title);
            $insert_member_table = insert_member_leader($form_id, $user_id);
            $insert_group_table = insert_group($form_id, $group_type, $suppervisor_id);
            $insert_skill_table = insert_skill($form_id, $skill);

            $message = 'Post success';
            $type = 1;
        } else {
            $message = 'Post failed';
        }
    } else {
        $message = $form_validate;
    }

    // $form_test = array('title' => $title, 'desciprtion' => $description, 'member' => $members, 'skill' => $skill, 'other' => $other, 'suppervisor' => $supervisor, 'close-date' => $close_date, 'contact' => $contact, 'group_type' => $group_type, 'user_id' => $user_id);

    echo wp_send_json(['check' => $check, 'message' => $message, 'type' => $type]);
    die();
}
add_action('join_action', 'joinFormaAction');
function joinFormaAction()
{
    if (!is_user_logged_in()) {
        echo 'error!!! login first';
    } else {
        if (isset($_POST['form-id'])) {
            $form_id = $_POST['form-id'];
            echo sendRequest($form_id);
        }
    }
}

add_action('wp_ajax_nopriv_magage_request', 'magage_request');
add_action('wp_ajax_magage_request', 'magage_request');
function magage_request()
{
    echo wp_send_json(['notification' => manageRequest()]);
    die();
}

add_action('wp_ajax_nopriv_accept_request', 'accept_request');
add_action('wp_ajax_accept_request', 'accept_request');
function accept_request()
{
    if (isset($_POST['request-user'])) {
        $user_name = $_POST['request-user'];
        $user_id = get_userdatabylogin($user_name)->ID;
        $action = accessRequest($user_id);
        $message = '';
        $result;
        if ($action['result']) {
            $message = $action['message'];
            $result = $action['result'];
        } else {
            $message = $action['message'];
            $result = $action['result'];
        }
    }
    echo wp_send_json(['results' => $result, 'message' => $message]);
    die();
}
