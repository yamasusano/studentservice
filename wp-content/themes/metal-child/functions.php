<?php
/* =========================================
 * Enqueues parent theme stylesheet
 * ========================================= */
//profle
include 'includes/core/profile/gpf-register.php';
include 'includes/core/profile/gpf-profile.php';
include 'includes/core/profile/teacher-profile.php';
include 'includes/core/profile/teacher-form.php';
include 'includes/core/profile/manage-teacher-request.php';
include 'includes/core/profile/members-list.php';
//Finder-FORM
include 'includes/core/group/menu-group.php';
include 'includes/core/group/finder-form-action.php';
include 'includes/core/group/finder-form-insert.php';
//other group
include 'includes/core/other-groups/student.php';
include 'includes/core/other-groups/teacher.php';
//notification
include 'includes/core/notify/menu-notication.php';
//user chat
include 'includes/core/chat-group/chat-form.php';
include 'includes/core/entity.php';
include 'includes/core/user_activitive.php';
include 'validate.php';
// include 'chat/index.php';
add_action('wp_enqueue_scripts', 'zozo_enqueue_child_theme_styles');
function zozo_enqueue_child_theme_styles()
{
    //css
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri(), array(), null);
    wp_enqueue_style('zozo-child-theme-style', get_stylesheet_uri().'style.css', array(), null);
    wp_enqueue_style('jquery-confirm', get_stylesheet_directory_uri().'/assets/css/jquery-confirm.min.css');
    wp_enqueue_style('form', get_stylesheet_directory_uri().'/assets/css/form.css');
    wp_enqueue_style('chat-form', get_stylesheet_directory_uri().'/assets/css/chat.css');
    wp_enqueue_style('teacher', get_stylesheet_directory_uri().'/assets/css/teacher.css');
    wp_enqueue_style('user-view', get_stylesheet_directory_uri().'/assets/css/user-view.css');
    wp_enqueue_style('datatables', get_stylesheet_directory_uri().'/assets/css/datatables.css');
    wp_enqueue_style('notification', get_stylesheet_directory_uri().'/assets/css/notification.css');
    wp_enqueue_style('animation-load', get_stylesheet_directory_uri().'/assets/css/animation-load.css');
    wp_enqueue_style('group', get_stylesheet_directory_uri().'/assets/css/group.css');

    //js
    wp_enqueue_script('jquery-v2.2.4.min', get_stylesheet_directory_uri().'/assets/js/jquery.min.js', array('jquery'), null, true);
    wp_enqueue_script('mark.min', get_stylesheet_directory_uri().'/assets/js/mark.min.js', array('jquery'), null, true);
    wp_enqueue_script('front-end-js', get_stylesheet_directory_uri().'/assets/js/front-end.js', array('jquery'), null, true);
    wp_enqueue_script('confirm-js', get_stylesheet_directory_uri().'/assets/js/jquery-confirm.min.js', array('jquery'), null, true);
    wp_enqueue_script('datatables', get_stylesheet_directory_uri().'/assets/js/datatables.js', array('jquery'), null, true);
    //ckeditor-js
    wp_enqueue_script('ckeditor-js', get_stylesheet_directory_uri().'/ckeditor/ckeditor.js', array('jquery'), null, true);
    wp_enqueue_script('config-ckeditor-js', get_stylesheet_directory_uri().'/ckeditor/config.js', array('jquery'), null, true);
    wp_enqueue_script('style-ckeditor-js', get_stylesheet_directory_uri().'/ckeditor/styles.js', array('jquery'), null, true);
    //profile-js
    wp_enqueue_script('custom-js', get_stylesheet_directory_uri().'/assets/js/custom.js', array('jquery'), null, true);
    wp_enqueue_script('profile-js', get_stylesheet_directory_uri().'/assets/js/profile.js', array('jquery'), null, true);
    wp_enqueue_script('form-js', get_stylesheet_directory_uri().'/assets/js/form.js', array('jquery'), null, true);
    wp_enqueue_script('requestHandle-js', get_stylesheet_directory_uri().'/assets/js/requestHandle.js', array('jquery'), null, true);
    //teacher-js
    wp_enqueue_script('teacher-action', get_stylesheet_directory_uri().'/assets/js/teacher-action.js', array('jquery'), null, true);
    wp_enqueue_script('teacher-handle', get_stylesheet_directory_uri().'/assets/js/teacher-handle-action.js', array('jquery'), null, true);
    wp_enqueue_script('other-form', get_stylesheet_directory_uri().'/assets/js/other-form.js', array('jquery'), null, true);
    //chat
    wp_enqueue_script('chat', get_stylesheet_directory_uri().'/assets/js/chat.js', array('jquery'), null, true);
    wp_enqueue_script('action-chat', get_stylesheet_directory_uri().'/assets/js/action-chat.js', array('jquery'), null, true);
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

/* Remove Unwanted Admin Menu Items */
/*-----------------------------------------------------------------------------------*/
add_action('admin_init', 'wpse_136058_remove_menu_pages');

function wpse_136058_remove_menu_pages()
{
    remove_menu_page('metal');
    // remove_menu_page('upload.php');                 //Media
    remove_menu_page('index.php');                 //Media
    // remove_menu_page('themes.php');                 //Appearance
    // remove_menu_page('plugins.php');                //Plugins
    remove_menu_page('tools.php');                  //Tools
    remove_menu_page('options-general.php');        //Settings
    remove_menu_page('vc-general');
    remove_menu_page('edit.php?post_type=zozo_team_member');
    remove_menu_page('edit.php?post_type=zozo_portfolio');
    remove_menu_page('edit.php?post_type=zozo_services');
    remove_menu_page('edit.php?post_type=zozo_testimonial');
}
// add_action('admin_init', 'wpse_136058_debug_admin_menu');

// function wpse_136058_debug_admin_menu()
// {
//     echo '<pre>'.print_r($GLOBALS['menu'], true).'</pre>';
// }
  /*-----------------------------------------------------------------------------------*/
//ADD button login and logout on menu.

add_filter('wp_nav_menu_items', 'add_login_logout_link', 10, 2);
function add_login_logout_link($items)
{
    ob_start();
    if (is_user_logged_in()) {
        $loginoutlink .= menu_bar_profile();
    } else {
        $loginoutlink .= '<a href="'.home_url('login').'" style="margin-right: 30px;" >
        <i class="fa fa-fw fa-lg fa-sign-in"></i>
        Log In</a>';
    }
    ob_end_clean();
    $items .= '<ul class="nav navbar-nav navbar-right my-menu-right">'.$loginoutlink.'</ul>';

    return $items;
}

//Check token via Google api to login or register new user.
add_action('init', 'userLogIn', 2);
function userLogIn()
{
    if (!is_admin()) {
        if (isset($_SESSION['access_token'])) {
            action_user_online();
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
    action_user_offline();
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
    echo wp_send_json(['btnChange' => btnChangeEdit(), 'gender' => selectGender(), 'major' => selectMajor(), 'semester_level' => select_semester_level()]);
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
        $biography = stripslashes_deep($_POST['bio']);
        $phone = $_POST['phone'];
        $address = $_POST['address'];
        $message = '<div class="message-success">'.updateUserProfile($name, $gender, $address, $phone, $biography, $major).'</div>';
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
    $semester = $_POST['semester'];
    $title = $_POST['title'];
    $description = stripslashes_deep($_POST['description']);
    $members = $_POST['members'];
    $skill = $_POST['skill'];
    $other = $_POST['other'];
    $contact = $_POST['contact'];
    $group_type = info('role');
    $user_id = get_current_user_id();
    //end create
    $is_major = has_major();
    if ($is_major['result']) {
        $form_validate = validFormFinder($title, $description);
        if ($form_validate['result']) {
            $insert_finder_table = insert_finder_form($semester, $title, $description, $other, $contact, $user_id);
            $suppervisor_id = get_user_by('login', $supervisor)->ID;
            if ($insert_finder_table) {
                $form_id = finder_form_id($title);
                $insert_member_table = insert_member_leader($form_id, $user_id);
                $insert_group_table = insert_group($form_id, $group_type);
                $insert_skill_table = insert_skill($form_id, $skill);

                $message = '<div class="message-success">Publish success</div>';
                $type = 1;
            } else {
                $message = '<div class="message-fail">Publish failed</div>';
            }
        } else {
            $message = '<div class="message-fail">'.$form_validate['message'].'</div>';
        }
    } else {
        $message = $is_major['message'];
    }

    echo wp_send_json(['message' => $message, 'type' => $type]);
    die();
}
add_action('groups', 'getGroups');
function getGroups()
{
    echo get_groups();
}

add_action('wp_ajax_nopriv_close_form_finder', 'close_form_finder');
add_action('wp_ajax_close_form_finder', 'close_form_finder');
function close_form_finder()
{
    closeForm();
    $message = '<div class="message-fail">Form closed</div>';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_reopen_form_finder', 'reopen_form_finder');
add_action('wp_ajax_reopen_form_finder', 'reopen_form_finder');
function reopen_form_finder()
{
    reopenFinderForm();
    $message = '<div class="message-success">Form re-open.</div>';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_verify_user_login', 'verify_user_login');
add_action('wp_ajax_verify_user_login', 'verify_user_login');
function verify_user_login()
{
    $url_login = '';
    if (!is_user_logged_in()) {
        $url_login = home_url('login');
    }
    echo wp_send_json(['redirect_url' => $url_login]);
    die();
}
add_action('join_action', 'join_form_action');
function join_form_action()
{
    if (isset($_POST['form-id'])) {
        $form_id = $_POST['form-id'];
        $user_id = $_POST['user-id'];
        $postion = $_POST['postion'];
        $message = stripslashes_deep($_POST['message']);
        $check = actionJoinForm($form_id, $user_id);
        if (!$check['result']) {
            $renderHTML = '<div class="message-fail"> ';
            $renderHTML .= $check['message'];
        } else {
            $renderHTML = '<div class="message-success"> ';
            $renderHTML .= sendRequest($form_id, $user_id, $message, $postion);
        }
        $renderHTML .= '</div>';
        echo $renderHTML;
    }
}
add_action('reject_request', 'userRejectRequest');
function userRejectRequest()
{
    $form_id = $_POST['form-id'];
    $user_id = get_current_user_id();
    removeRequest($form_id, $user_id);

    if (removeRequest($form_id, $user_id)) {
        $renderHTML = '<div class="message-success"> ';
        $renderHTML .= 'reject request success!';
        $renderHTML .= '</div>';
    } else {
        $renderHTML = '<div class="message-fail"> ';
        $renderHTML .= 'Request have been rejected!';
        $renderHTML .= '</div>';
    }

    echo $renderHTML;
}
add_action('wp_ajax_nopriv_reject_request_form', 'reject_request_form');
add_action('wp_ajax_reject_request_form', 'reject_request_form');
function reject_request_form()
{
    $form_id = $_POST['form-id'];
    $user_id = get_current_user_id();
    removeRequest($form_id, $user_id);
    $check = false;
    if (removeRequest($form_id, $user_id)) {
        $message = '<div class="message-success">Reject request success!</div>';
        $check = true;
    } else {
        $message = '<div class="message-fail">Request have been rejected!</div>';
    }
    echo wp_send_json(['check' => $check, 'notification' => $message]);
    die();
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
    if (isset($_POST['user-id'])) {
        $user_id = $_POST['user-id'];
        $form_id = $_POST['form-id'];
        $pos = $_POST['pos'];
        $action = accessRequest($form_id, $user_id, $pos);
        $message = '';
        $result;
        if ($action['result']) {
            $message = '<div class="message-success">'.$action['message'].'</div>';
            $result = $action['result'];
        } else {
            $message = '<div class="message-fail">'.$action['message'].'</div>';
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
    if (isset($_POST['form-id'])) {
        $form_id = $_POST['form-id'];
    }

    if (rejectRequest($form_id)) {
        $message = '<div class="message-success">Request has been rejected</div>';
    } else {
        $message = '<div class="message-fail">Request is not exist</div>';
    }
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_accept_request_via_user', 'accept_request_via_user');
add_action('wp_ajax_accept_request_via_user', 'accept_request_via_user');
function accept_request_via_user()
{
    $form_id = $_POST['form-id'];
    $action = user_access_request($form_id);
    $message = '';
    $result;
    if ($action['result']) {
        $message = '<div class="message-success">'.$action['message'].'</div>';
        $result = $action['result'];
    } else {
        $message = '<div class="message-fail">'.$action['message'].'</div>';
        $result = $action['result'];
    }

    echo wp_send_json(['results' => $result, 'message' => $message]);
    die();
}

add_action('wp_ajax_nopriv_reject_request_via_user', 'reject_request_via_user');
add_action('wp_ajax_reject_request_via_user', 'reject_request_via_user');
function reject_request_via_user()
{
    if (isset($_POST['request-user'])) {
        $user_name = $_POST['request-user'];
        $user_id = get_userdatabylogin($user_name)->ID;
    }
    if (rejectRequest($form_id)) {
        $message = '<div class="message-success">Request has been rejected</div>';
    } else {
        $message = '<div class="message-fail">Request is not exist</div>';
    }
    echo wp_send_json(['message' => $message]);
    die();
}

add_action('wp_ajax_nopriv_members_list', 'members_list');
add_action('wp_ajax_members_list', 'members_list');
function members_list()
{
    echo wp_send_json(['members' => get_member_list()]);
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
add_action('wp_ajax_nopriv_update_form_finder', 'update_form_finder');
add_action('wp_ajax_update_form_finder', 'update_form_finder');
function update_form_finder()
{
    $check = false;
    if (isset($_POST['title'])) {
        $title = $_POST['title'];
        $description = stripslashes_deep($_POST['description']);
        $other = $_POST['otherSkill'];
        $contact = $_POST['contact'];
        $semester = $_POST['semester'];
        $skill = $_POST['skill'];
        $form_validate = validFormFinder($title, $description);
        if ($form_validate['result']) {
            $message = updateFinderForm($title, $description, $other, $contact, $semester, $skill);
            $check = true;
        } else {
            $message = '<div class="message-fail">'.$form_validate['message'].'</div> ';
        }
        echo wp_send_json(['message' => $message, 'url_profile' => home_url('profile/?mode=view'), 'check' => $check]);
        die();
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
add_action('wp_ajax_nopriv_result_search_user', 'result_search_user');
add_action('wp_ajax_result_search_user', 'result_search_user');
function result_search_user()
{
    $keyword = $_POST['keyword'];
    echo wp_send_json(['render' => searchUsers($keyword)]);
    die();
}

add_action('filter_section', 'filter_form_page');
function filter_form_page()
{
    $post_type = $_GET['type-value'];
    $semester = $_GET['semester-value'];
    $major = $_GET['major-value'];
    $poster = $_GET['poster'];
    echo filterPage($post_type, $semester, $major, $poster);
}
add_action('result_searchs', 'result_search_box', 10, 1);
function result_search_box($type)
{
    $post_type = $_GET['type-value'];
    $semester = $_GET['semester-value'];
    $major = $_GET['major-value'];
    $poster = $_GET['poster'];
    $count = count(result_search($post_type, $semester, $major, $poster));
    if (isset($_GET['poster'])) {
        switch ($type) {
            case 'count':
            echo result_search_message($count, $post_type, $semester, $major, $poster);
            break;
            case 'result':
            echo result_form_content($post_type, $semester, $major, $poster);
            break;
            case 'pagination':
            pagination_result_search($count, $post_type, $semester, $major, $poster);
            break;
        }
    } else {
        switch ($type) {
            case 'count':
            echo result_search_message($count, $post_type, $semester, $major, $poster);
            break;
            case 'result':
            echo result_form_content($post_type, $semester, $major, $poster);
            break;
            case 'pagination':
            pagination_result_search($count, $post_type, $semester, $major, $poster);
            break;
    }
    }
}
add_action('new-feed', 'support_student_ideas');

function support_student_ideas()
{
    echo get_ideas_form();
}
add_action('wp_ajax_nopriv_over_view_profile', 'over_view_profile');
add_action('wp_ajax_over_view_profile', 'over_view_profile');
function over_view_profile()
{
    echo wp_send_json(['overview' => overView()]);
    die();
}
add_action('wp_ajax_nopriv_invite_user_join', 'invite_user_join');
add_action('wp_ajax_invite_user_join', 'invite_user_join');
function invite_user_join()
{
    $user_id = $_POST['user-id'];
    $check = action_invite_user($user_id);
    $message = '';
    $button_cancel = '';
    if ($check['result']) {
        $message = '<div class="message-success">'.$check['message'].'</div>';
        $button_cancel = $check['button'];
    } else {
        $message = '<div class="message-fail">'.$check['message'].'</div>';
    }
    echo wp_send_json(['check' => $check['result'], 'message' => $message, 'button' => $button_cancel]);
    die();
}
add_action('wp_ajax_nopriv_re_invite_user_join', 're_invite_user_join');
add_action('wp_ajax_re_invite_user_join', 're_invite_user_join');
function re_invite_user_join()
{
    $user_id = $_POST['user-id'];
    $check = re_action_invite_student($user_id);
    $message = '';
    $button_join = '';
    if ($check['result']) {
        $message = $check['message'];
        $button_join = $check['button'];
    } else {
        $message = $check['message'];
    }
    echo wp_send_json(['check' => $check['result'], 'message' => $message, 'button' => $button_join]);
    die();
}

add_action('wp_ajax_nopriv_get_chat_form', 'get_chat_form');
add_action('wp_ajax_get_chat_form', 'get_chat_form');
function get_chat_form()
{
    $form_id = $_POST['ID'];
    echo wp_send_json(['chat_form' => get_form_chat($form_id)]);
    die();
}
add_action('wp_ajax_nopriv_create_new_form', 'create_new_form');
add_action('wp_ajax_create_new_form', 'create_new_form');
function create_new_form()
{
    $title = $_POST['title'];
    $validTitle = validTitleForm($title);
    if ($validTitle) {
        $new_group = create_new_group($title);
    } else {
        $message = '<div class="message-fail"><b>'.$title.'</b> already exist.</div>';
    }
    echo wp_send_json(['new_form' => $new_group, 'message' => $message, 'check' => $validTitle]);
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

add_action('wp_ajax_nopriv_delete_teach_form', 'delete_teach_form');
add_action('wp_ajax_delete_teach_form', 'delete_teach_form');
function delete_teach_form()
{
    $form_id = $_POST['ID'];
    $title = $_POST['title'];
    $user_id = get_current_user_id();
    $delete = teacher_delete_form($form_id, $user_id);
    if ($delete) {
        $message = '<b>'.$title.'</b> has been deleted.';
    } else {
        $message = '<b>'.$title.'</b> has been deleted.';
    }
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_get_teacher_form', 'get_teacher_form');
add_action('wp_ajax_get_teacher_form', 'get_teacher_form');
function get_teacher_form()
{
    $form_id = $_POST['ID'];
    $form_view = get_action_form_teacher($form_id);
    echo wp_send_json(['form' => $form_view]);
    die();
}
add_action('wp_ajax_nopriv_get_teacher_form_action', 'get_teacher_form_action');
add_action('wp_ajax_get_teacher_form_action', 'get_teacher_form_action');
function get_teacher_form_action()
{
    $form_id = $_POST['ID'];
    echo wp_send_json(['form_content' => generate_teacher_form($form_id)]);
    die();
}
add_action('wp_ajax_nopriv_update_form_finder_teacher', 'update_form_finder_teacher');
add_action('wp_ajax_update_form_finder_teacher', 'update_form_finder_teacher');
function update_form_finder_teacher()
{
    $check = false;
    if (isset($_POST['ID'])) {
        $form_id = $_POST['ID'];
        $title = $_POST['title'];
        $description = stripslashes_deep($_POST['description']);
        $other = $_POST['otherSkill'];
        $contact = $_POST['contact'];
        $semester = $_POST['semester'];
        $skill = $_POST['skill'];
        $is_major = teacher_has_major();
        $time_check = get_time_close_form($semester);
        if ($time_check['result']) {
            if ($is_major['result']) {
                $form_validate = validFormFinder($title, $description);
                if ($form_validate['result']) {
                    $message = updateFinderFormTeacher($form_id, $title, $description, $other, $contact, $semester, $skill);
                    $check = true;
                } else {
                    $message = '<div class="message-fail">'.$form_validate['message'].'</div> ';
                }
            } else {
                $message = '<div class="message-fail">'.$is_major['message'].'</div>';
            }
        } else {
            $message = '<div class="message-fail">'.$time_check['message'].'</div>';
        }
    }

    echo wp_send_json(['message' => $message, 'url_profile' => home_url('profile/?mode=view'), 'check' => $check]);
    die();
}
add_action('wp_ajax_nopriv_close_form_finderTeacher', 'close_form_finderTeacher');
add_action('wp_ajax_close_form_finderTeacher', 'close_form_finderTeacher');
function close_form_finderTeacher()
{
    $form_id = $_POST['ID'];
    closeFormTeach($form_id);
    $message = '<div class="message-fail">Form closed</div>';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_re_open_form_teach', 're_open_form_teach');
add_action('wp_ajax_re_open_form_teach', 're_open_form_teach');
function re_open_form_teach()
{
    $form_id = $_POST['ID'];
    reOpenFormTeach($form_id);
    $message = '<div class="message-success">Form is open now </div>';
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_magage_teache_request', 'magage_teache_request');
add_action('wp_ajax_magage_teache_request', 'magage_teache_request');
function magage_teache_request()
{
    echo wp_send_json(['notification' => get_request_list()]);
    die();
}
add_action('wp_ajax_nopriv_approve_request_via_teacher', 'approve_request_via_teacher');
add_action('wp_ajax_approve_request_via_teacher', 'approve_request_via_teacher');
function approve_request_via_teacher()
{
    $form_id = $_POST['form-id'];
    $user_id = $_POST['user-id'];
    $type = $_POST['type'];
    $request = approve_request($form_id, $user_id, $type);
    if ($type = 1) {
        if ($request['result']) {
            $message = '<div class="message-success">'.$request['message'].'</div>';
        } else {
            $message = '<div class="message-fail">'.$request['message'].'</div>';
        }
    }
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_members_list_via_teacher', 'members_list_via_teacher');
add_action('wp_ajax_members_list_via_teacher', 'members_list_via_teacher');
function members_list_via_teacher()
{
    $form_id = $_POST['ID'];
    echo wp_send_json(['members' => get_member_list_via_teacher($form_id)]);
    die();
}

add_action('wp_ajax_nopriv_find_student_partner', 'find_student_partner');
add_action('wp_ajax_find_student_partner', 'find_student_partner');
function find_student_partner()
{
    $keyword = $_POST['keyword'];
    $form_id = $_POST['ID'];
    echo wp_send_json(['render' => search_student_via_teacher($keyword, $form_id)]);
    die();
}

add_action('wp_ajax_nopriv_kick_out_member', 'kick_out_member');
add_action('wp_ajax_kick_out_member', 'kick_out_member');
function kick_out_member()
{
    if (isset($_POST['user'])) {
        $form_id = $_POST['ID'];
        $user_id = $_POST['user'];
        $message = remove_member_via_teacher($form_id, $user_id);
    }

    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_invite_student_via_teacher', 'invite_student_via_teacher');
add_action('wp_ajax_invite_student_via_teacher', 'invite_student_via_teacher');
function invite_student_via_teacher()
{
    $form_id = $_POST['ID'];
    $user_id = $_POST['user-id'];
    $check = action_invite_user_via_teacher($user_id, $form_id);
    $message = '';
    $button_cancel = '';
    if ($check['result']) {
        $message = $check['message'];
        $button_cancel = $check['button'];
    } else {
        $message = $check['message'];
    }
    echo wp_send_json(['check' => $check['result'], 'message' => $message, 'button' => $button_cancel]);
    die();
}
add_action('wp_ajax_nopriv_re_invite_user_join_via_teacher', 're_invite_user_join_via_teacher');
add_action('wp_ajax_re_invite_user_join_via_teacher', 're_invite_user_join_via_teacher');
function re_invite_user_join_via_teacher()
{
    $form_id = $_POST['ID'];
    $user_id = $_POST['user-id'];
    $check = re_action_invite_via_teacher($form_id, $user_id);
    $message = '';
    $button_join = '';
    if ($check['result']) {
        $message = $check['message'];
        $button_join = $check['button'];
    } else {
        $message = $check['message'];
    }
    echo wp_send_json(['check' => $check['result'], 'message' => $message, 'button' => $button_join]);
    die();
}
add_action('wp_ajax_nopriv_get_teacher_list', 'get_teacher_list');
add_action('wp_ajax_get_teacher_list', 'get_teacher_list');
function get_teacher_list()
{
    $create_menu = list_form_teacher();

    echo wp_send_json(['create_menu' => $create_menu]);
    die();
}
add_action('wp_ajax_nopriv_get_teacher_form_detail', 'get_teacher_form_detail');
add_action('wp_ajax_get_teacher_form_detail', 'get_teacher_form_detail');
function get_teacher_form_detail()
{
    $form_id = $_POST['ID'];
    $html = form_teacher_detail($form_id);
    $group_button = get_group_button();
    echo wp_send_json(['form_content' => $html, 'button' => $group_button]);
    die();
}
add_action('wp_ajax_nopriv_list_student_form_via_teacher', 'list_student_form_via_teacher');
add_action('wp_ajax_list_student_form_via_teacher', 'list_student_form_via_teacher');
function list_student_form_via_teacher()
{
    $user_id = get_current_user_id();
    $html = list_form_student($user_id);
    echo wp_send_json(['form_content' => $html]);
    die();
}
add_action('wp_ajax_nopriv_student_form_detail_via_teacher', 'student_form_detail_via_teacher');
add_action('wp_ajax_student_form_detail_via_teacher', 'student_form_detail_via_teacher');
function student_form_detail_via_teacher()
{
    $form_id = $_POST['ID'];
    $html = form_teacher_detail($form_id);
    $button_action = get_group_button();

    echo wp_send_json(['form_content' => $html, 'group_button' => $button_action]);
    die();
}

add_action('wp_ajax_nopriv_actionListenerUserLog', 'actionListenerUserLog');
add_action('wp_ajax_actionListenerUserLog', 'actionListenerUserLog');
function actionListenerUserLog()
{
    $user_id = $_POST['user-id'];
    $class = '';
    $check = is_user_online($user_id);
    echo wp_send_json(['check' => $check]);
    die();
}
add_action('wp_ajax_nopriv_create_chat_box', 'create_chat_box');
add_action('wp_ajax_create_chat_box', 'create_chat_box');
function create_chat_box()
{
    $user_id = $_POST['user_id'];
    $user_name = get_user_by('ID', $user_id)->user_login;
    $current_user_id = get_current_user_id();
    $history = history_chat_user($user_id, $current_user_id);
    $check = is_user_online($user_id);
    $box = box_chat($user_id);
    echo wp_send_json(['box_chat' => $box, 'name' => $user_name, 'check' => $check, 'history_chat' => $history]);
    die();
}
add_action('wp_ajax_nopriv_create_chat_box2', 'create_chat_box2');
add_action('wp_ajax_create_chat_box2', 'create_chat_box2');
function create_chat_box2()
{
    $sender_id = $_POST['sender_id'];
    $receiver_id = $_POST['receiver_id'];
    $current_user_id = get_current_user_id();
    if ($sender_id == $current_user_id) {
        $user_id = $receiver_id;
    } elseif ($receiver_id == $current_user_id) {
        $user_id = $sender_id;
    }
    $history = history_chat_user($user_id, $current_user_id);
    $check = is_user_online($user_id);
    $box = box_chat($user_id);
    echo wp_send_json(['box_chat' => $box, 'name' => $user_name, 'check' => $check, 'history_chat' => $history]);
    die();
}

add_action('wp_ajax_nopriv_notification_chat', 'notification_chat');
add_action('wp_ajax_notification_chat', 'notification_chat');
function notification_chat()
{
    $current_user_id = get_current_user_id();
    $chat = get_box_chat($current_user_id);
    echo wp_send_json(['message' => $chat]);
    die();
}
add_action('wp_ajax_set_notice_for_user', 'set_notice_for_user');
add_action('wp_ajax_set_notice_for_user', 'set_notice_for_user');
function set_notice_for_user()
{
    $user_id = get_notice_for_user();
    $current_user_id = get_current_user_id();
    $check = false;
    if ($user_id == $current_user_id) {
        $check = true;
    }
    echo wp_send_json(['check' => $check, 'current_id' => $current_user_id]);
    die();
}

add_action('wp_ajax_nopriv_leave_group_teacher', 'leave_group_teacher');
add_action('wp_ajax_leave_group_teacher', 'leave_group_teacher');
function leave_group_teacher()
{
    $form_id = $_POST['ID'];
    $user_id = get_current_user_id();
    $leave = leave_teacher_group($form_id, $user_id);
    echo wp_send_json(['check' => $leave]);
    die();
}
remove_action('wpua_before_avatar', 'wpua_do_before_avatar');
remove_action('wpua_after_avatar', 'wpua_do_after_avatar');
function my_avatar_before()
{
    echo '<div id="update-user-avatar">';
}
add_action('wpua_before_avatar', 'my_avatar_before');

function my_after_avatar_s()
{
    echo '</div>';
}
add_action('wpua_after_avatar', 'my_after_avatar_s');
