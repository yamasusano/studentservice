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
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri().'/assets/css/jquery-confirm.min.css', array(), null);
    //js
    wp_enqueue_script('jquery', get_stylesheet_directory_uri().'/assets/js/jquery-1.12.4.js', array('jquery'), null, true);
    wp_register_script('custom-js', get_stylesheet_directory_uri().'/assets/js/custom.js', array('jquery'), null, true);
    wp_enqueue_script('custom-js');
    wp_register_script('confirm-js', get_stylesheet_directory_uri().'/assets/js/jquery-confirm.min.js', array('jquery'), null, true);
    wp_enqueue_script('confirm-js');
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
    echo wp_send_json(['btnChange' => btnChangeEdit(), 'gender' => selectGender(), 'major' => selectMajor()]);
    die();
}
add_action('wp_ajax_nopriv_update_profile', 'update_profile');
add_action('wp_ajax_update_profile', 'update_profile');
//update -edit information,update infor in database.
function update_profile()
{
    if (isset($_POST['name'])) {
        $name = $_POST['name'];
        $gender = $_POST['gender'];
        $major = $_POST['major'];
        $biography = $_POST['bio'];
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $message = updateUserProfile($name, $gender, $address, $phone, $biography, $major);
    }
    echo wp_send_json(['message' => $message]);
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
    $is_major = has_major();
    if ($is_major['result']) {
        $form_validate = validFormFinder($title, $description, $close_date);
        if (isset($form_validate)) {
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
    } else {
        $message = $is_major['message'];
    }

    echo wp_send_json(['check' => $check, 'message' => $message, 'type' => $type]);
    die();
}

add_action('wp_ajax_nopriv_close_form_finder', 'close_form_finder');
add_action('wp_ajax_close_form_finder', 'close_form_finder');
function close_form_finder()
{
    closeForm();
    $message = 'Form closed ';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_reopen_form_finder', 'reopen_form_finder');
add_action('wp_ajax_reopen_form_finder', 'reopen_form_finder');
function reopen_form_finder()
{
    reopenFinderForm();
    $message = 'Form re-open. ';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('join_action', 'joinFormaAction');
function joinFormaAction()
{
    if (isset($_POST['form-id'])) {
        $form_id = $_POST['form-id'];
        $user_id = $_POST['user-id'];
        $check = actionJoinForm($form_id, $user_id);
        if (!$check['result']) {
            echo $check['message'];
        } else {
            echo sendRequest($form_id, $user_id);
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

add_action('wp_ajax_nopriv_reject_user_request', 'reject_user_request');
add_action('wp_ajax_reject_user_request', 'reject_user_request');
function reject_user_request()
{
    if (isset($_POST['request-user'])) {
        $user_name = $_POST['request-user'];
        $user_id = get_userdatabylogin($user_name)->ID;
    }
    echo wp_send_json(['message' => rejectRequest($user_id)]);
    die();
}

add_action('wp_ajax_nopriv_members_list', 'members_list');
add_action('wp_ajax_members_list', 'members_list');
function members_list()
{
    echo wp_send_json(['members' => get_member_list()]);
    die();
}
add_action('wp_ajax_nopriv_teacher_menu_group', 'teacher_menu_group');
add_action('wp_ajax_teacher_menu_group', 'teacher_menu_group');
function teacher_menu_group()
{
    $create_menu = teacherGroupMenu();
    echo wp_send_json(['create_menu' => $create_menu]);
    die();
}
add_action('wp_ajax_nopriv_set_new_leader_in_group', 'set_new_leader_in_group');
add_action('wp_ajax_set_new_leader_in_group', 'set_new_leader_in_group');
function set_new_leader_in_group()
{
    if (isset($_POST['user'])) {
        $user_id = $_POST['user'];
        $message = set_new_leader($user_id);
    }
    echo wp_send_json(['message' => $message]);
    die();
}

add_action('wp_ajax_nopriv_remove_member_in_group', 'remove_member_in_group');
add_action('wp_ajax_remove_member_in_group', 'remove_member_in_group');
function remove_member_in_group()
{
    if (isset($_POST['user'])) {
        $user_id = $_POST['user'];
        $message = remove_member($user_id);
    }

    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_get_action_form', 'get_action_form');
add_action('wp_ajax_get_action_form', 'get_action_form');

function get_action_form()
{
    echo wp_send_json(['get_action' => actionEditForm()]);
    die();
}
add_action('wp_ajax_nopriv_update_form_finder', 'update_form_finder');
add_action('wp_ajax_update_form_finder', 'update_form_finder');
function update_form_finder()
{
    if (isset($_POST['title'])) {
        $title = $_POST['title'];
        $description = $_POST['description'];
        $other = $_POST['otherSkill'];
        $contact = $_POST['contact'];
        $close_date = $_POST['close'];
        $form_validate = validFormFinder($title, $description, $close_date);
        if (!isset($form_validate)) {
            $message = updateFinderForm();
        } else {
            $message = $form_validate;
        }

        echo wp_send_json(['message' => $message]);
        die();
    }
}

add_action('wp_ajax_nopriv_create_new_form', 'create_new_form');
add_action('wp_ajax_create_new_form', 'create_new_form');
function create_new_form()
{
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('reject_request', 'userRejectRequest');
function userRejectRequest()
{
    $form_id = $_POST['form-id'];
    $user_id = get_current_user_id();
    removeRequest($form_id, $user_id);
    if (removeRequest($form_id, $user_id)) {
        echo 'reject request success!';
    } else {
        echo 'Request have been rejected!';
    }
}
add_action('wp_ajax_nopriv_student_leave_group', 'student_leave_group');
add_action('wp_ajax_student_leave_group', 'student_leave_group');
function student_leave_group()
{
    $check = actionLeaveGroup();
    $message = '';
    $type = 0;
    if ($check['result']) {
        $message = $check['message'];
        $type = 1;
    } else {
        $message = $check['message'];
    }

    echo wp_send_json(['message' => $message, 'type' => $type]);
    die();
}
add_action('wp_ajax_nopriv_action_student_leave_group', 'action_student_leave_group');
add_action('wp_ajax_action_student_leave_group', 'action_student_leave_group');
function action_student_leave_group()
{
    $user_id = get_current_user_id();
    $form_id = check_student_form();
    studentLeaveGroup($form_id, $user_id);
    echo wp_send_json(['message' => $message]);
    die();
}
