<?php

include 'includes/core/profile/gpf-profile.php';
require_once 'form-check.php';
function userInfo($meta_key, $user_id)
{
    global $wpdb;
    $user_info = $wpdb->get_var("
    SELECT meta_value
    FROM {$wpdb->prefix}usermetaData
    WHERE user_id = '".$user_id."'
    AND meta_key = '".$meta_key."'
    ");

    return $user_info;
}
function get_btn_case($btn)
{
    $button = '';
    switch ($btn) {
        case 'alert-join':
        $button = '<button  type="button" id="btn-alert-join" class="btn btn-info">Join Us</button>';
        break;
        case 'join':
        $button = '<button type="submit" name="btn-join-form" class="btn btn-info">Join</button>';
        break;
        case 'closed':
        $button = '<button class="btn btn-close" disabled>Closed</button>';
        break;
        case 'cancel':
        $button = '<button type="submit" name="cancel-join-request" class="btn btn-danger">cancel</button>';
        break;
        case 'chat':
        $button = '<button type="submit" name="chat-with-group" id="chat-with-group" class="btn btn-primary">Chat now!</button>';
        break;
        default:
        break;
    }

    return $button;
}
function get_edit_btn($form_id)
{
    $renderHTML = '';
    if (!is_user_logged_in()) {
        $renderHTML = '<div class="btn-edit-content">'.get_btn_case('edit').'</div>';
    } else {
        if (get_form_value($form_id, 'user_id') == get_current_user_id() && check_student_form() == $form_id) {
            $renderHTML = '<div class="btn-edit-content"><a href="'.home_url('profile').'?mode=edit"class="btn btn-primary">Edit</a></div>';
        }
    }

    return $renderHTML;
}
function handle_request_form($form_id)
{
    if (isset($_POST['btn-join-form'])) {
        do_action('join_action');
        echo get_button_join($form_id);
    } elseif (isset($_POST['cancel-join-request'])) {
        do_action('reject_request');
        echo get_button_join($form_id);
    } else {
        echo get_button_join($form_id);
    }
}
// in processing : tạo button action join group
function get_button_join($form_id)
{
    $status_form = checkStatusForm($form_id);
    if (is_user_logged_in()) {
        $user_role = info('role');
        if ($user_role != 'Teacher') {
            $renderHTML = '<div class="groups-button-request"> ';
            if (is_request_exist($form_id)) {
                $renderHTML .= get_btn_case('cancel');
            } elseif (!$status_form) {
                $renderHTML .= get_btn_case('closed');
            } elseif (is_member_in_group($form_id, get_current_user_id())) {
                $renderHTML .= get_btn_case('chat');
            } else {
                $renderHTML .= get_btn_case('alert-join');
            }

            $renderHTML .= '</div>';
        }
    } else {
        $renderHTML = '<div class="groups-button-request"> ';
        if (is_request_exist($form_id)) {
            $renderHTML .= get_btn_case('cancel');
        } elseif (!$status_form) {
            $renderHTML .= get_btn_case('closed');
        } elseif (is_member_in_group($form_id, get_current_user_id())) {
            $renderHTML .= get_btn_case('chat');
        } else {
            $renderHTML .= get_btn_case('alert-join');
        }

        $renderHTML .= '</div>';
    }

    return $renderHTML;
}

function is_request_exist($form_id)
{
    global $wpdb;
    $result = $wpdb->get_var("
    SELECT * FROM {$wpdb->prefix}request
    WHERE form_id = '".$form_id."'
    AND member_id = '".get_current_user_id()."'
    AND request = 1
    ");
    if ($result) {
        return true;
    }

    return false;
}

function formViewInfo($form_id)
{
    $major = userInfo('major', get_form_value($form_id, 'user_id'));
    $user_role = userInfo('role', get_form_value($form_id, 'user_id'));
    $renderHTML .= '<div class="form-detail-info"><h6>General Information:</h6> ';
    $renderHTML .= '<div>';
    $renderHTML .= '<div class="col-lg-6">';
    $renderHTML .= '<div class="col-lg-4">Semester  </div>';
    $renderHTML .= '<div class="col-lg-8">'.get_form_value($form_id, 'semester').'</div>';
    $renderHTML .= '<div class="col-lg-4">Leader  </div>';
    $renderHTML .= '<div class="col-lg-8"><a href="'.home_url('user').'?user-id='.get_form_value($form_id, 'user_id').'" target="_blank" class="btn btn-info btn-sm">'.get_userdata(get_form_value($form_id, 'user_id'))->user_login.'</a></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-6">';
    $renderHTML .= '<div class="col-lg-4">Major  </div>';
    $renderHTML .= '<div class="col-lg-8">'.$major.'</div>';
    if ($user_role == '1') {
        $renderHTML .= '<div class="col-lg-4">Supervisor  </div>';
        if (get_supervisor($form_id)) {
            $renderHTML .= '<div class="col-lg-8">'.get_supervisor($form_id).'</div>';
        } else {
            $renderHTML .= '<div class="col-lg-8">Not yet</div>';
        }
    }
    $renderHTML .= '</div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function formViewSkill($form_id)
{
    $renderHTML .= '<div class="form-detail-info"><h6>Requirements:</h6> ';
    $renderHTML .= '<div>';
    $renderHTML .= '<div class="col-lg-6">';
    $renderHTML .= '<div class="col-lg-4">Responsibilities  </div>';
    $renderHTML .= '<div class="col-lg-8">'.get_skills($form_id).'</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-6">';
    $renderHTML .= '<div class="col-lg-4">Other requirements  </div>';
    $renderHTML .= '<div class="col-lg-8">'.get_form_value($form_id, 'other_skill').'</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function formDescription($form_id)
{
    $renderHTML .= '<div class="form-detail-info"><h6>Description:</h6> ';
    $renderHTML .= '<div class="form-detail-desciption" >';
    $renderHTML .= get_form_value($form_id, 'description');
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function formMember($form_id)
{
    $renderHTML .= '<div class="form-detail-info"><h6>Members:</h6> ';
    $renderHTML .= '<div class="form-detail-members" >';
    $renderHTML .= get_list_member($form_id);
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function formView($form_id)
{
    $renderHTML .= '<div class="view-form-detail">';
    $renderHTML .= '<div class="form-detail-head"><div class="form-view-title"> <h3>'.get_form_value($form_id, 'title').'</h3></div>';
    $renderHTML .= get_edit_btn($form_id);
    $renderHTML .= '<input type="hidden" name="form-id" value="'.$form_id.'" /> ';
    $renderHTML .= '<input type="hidden" name="user-id" value="'.get_form_value($form_id, 'user_id').'" /> ';
    $renderHTML .= '</div>';
    $renderHTML .= formViewInfo($form_id);
    $renderHTML .= formMember($form_id);
    $renderHTML .= formViewSkill($form_id);
    $renderHTML .= formDescription($form_id);
    $renderHTML .= '</div>';

    return $renderHTML;
}

function get_form_value($form_id, $field)
{
    global $wpdb;

    $value = $wpdb->get_var("
    SELECT $field
    FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
    ");

    return $value;
}
function get_list_member($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $members_id = $wpdb->get_results("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_role = 1
    ");
    foreach ($members_id as $members) {
        $pos = get_member_postion($form_id, $members->member_id);
        $member_name = get_userdata($members->member_id)->user_login;
        if (is_null($pos)) {
            $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" class="btn btn-sm btn-info" >'.$member_name.'</a>';
        } else {
            $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" class="btn btn-sm btn-info" >'.$member_name.' - '.$pos.'</a>';
        }
    }

    return $renderHTML;
}

function get_supervisor($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $supervisor = $wpdb->get_var("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_role = 2
    ");
    if ($supervisor) {
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$supervisor.'" class="btn btn-info btn-sm">'.get_userdata($supervisor)->user_login.'</a>';
    } else {
    }

    return $renderHTML;
}

function get_skills($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $skills = $wpdb->get_results("
    SELECT s.name
    FROM {$wpdb->prefix}skill_major as s
    INNER JOIN {$wpdb->prefix}form_skill as f
    ON f.skill_id = s.ID
    WHERE f.form_id = '".$form_id."'
    ");
    foreach ($skills as $skill) {
        $renderHTML .= $skill->name.' <br> ';
    }

    return $renderHTML;
}

function get_form_related($form_id)
{
    global $wpdb;
    $form_major = userInfo('major', get_form_value($form_id, 'user_id'));
    $get_forms = $wpdb->get_results("
    SELECT f.* FROM {$wpdb->prefix}finder_form as f
    JOIN {$wpdb->prefix}usermetaData as u
    ON f.user_id = u.user_id 
    WHERE meta_value = '".$form_major."'
    AND f.ID != '".$form_id."'
    order by created_date DESC
    limit 5
    ");

    return $get_forms;
}

function related_topic($form_id)
{
    $forms = get_form_related($form_id);
    $renderHTML = '';
    $renderHTML .= '<div class="form-related"> ';
    foreach ($forms as $form) {
        $renderHTML .= '<p><a href="'.home_url('form-detail').'?form-id='.$form->ID.'" >';
        $renderHTML .= '<b>'.$form->title.'</b></a></p>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}

function get_form_related_semester($form_id)
{
    global $wpdb;
    $semester = get_form_value($form_id, 'semester');
    $get_forms = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}finder_form as f
    WHERE semester = '".$semester."'
    AND f.ID != '".$form_id."'
    order by created_date DESC
    limit 5
    ");

    return $get_forms;
}
function related_semester($form_id)
{
    $forms = get_form_related_semester($form_id);
    $renderHTML = '';
    $renderHTML .= '<div class="form-related"> ';
    foreach ($forms as $form) {
        $renderHTML .= '<p><a href="'.home_url('form-detail').'?form-id='.$form->ID.'" >';
        $renderHTML .= '<b>'.$form->title.'</b></a></p>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}

function form_exception($form_id)
{
    global $wpdb;
    $form = $wpdb->get_var("
    SELECT *
    FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
    ");
    if ($form) {
        return true;
    } else {
        return false;
    }
}
function form_not_found()
{
    $renderHTML .= '<div id="post-404" class="post post-404">';
    $renderHTML .= '<div class="entry-content">';
    $renderHTML .= '<div class="content-404page">';
    $renderHTML .= '<h2 class="title-one">Oops! Form Not Found</h2>';
    $renderHTML .= '<h3 class="title-two">404</h3>';
    $renderHTML .= '<span class="404icon"><i class="fa fa-thumbs-down"></i></span>';
    $renderHTML .= '<h5 class="title-three">Sorry!! The form you are looking for does not exist</h5>';
    $renderHTML .= '</div></div></div>';
    echo $renderHTML;
}

function member_select_position($form_id)
{
    global $wpdb;
    $skills = $wpdb->get_results("
    SELECT s.name
    FROM {$wpdb->prefix}skill_major as s
    INNER JOIN {$wpdb->prefix}form_skill as f
    ON f.skill_id = s.ID
    WHERE f.form_id = '".$form_id."'
    ");
    if ($skills) {
        $renderHTML .= '<select name="postion" id="select-postion">';
        $renderHTML .= '<option value="">N/A</option>';
        foreach ($skills as $skill) {
            $renderHTML .= '<option value="'.$skill->name.'">'.$skill->name.'</option>';
        }
        $renderHTML .= '</select>';
    } else {
        $renderHTML .= '<select name="postion" id="select-postion">';
        $renderHTML .= '<option value="">N/A</option>';
        $renderHTML .= '</select>';
    }

    return $renderHTML;
}?>

