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
        case 'edit':
        $button = '<a href="#"class="btn btn-warning">Contact Us</a>';
        break;
        case 'join':
        $button = '<button type="submit" name="btn-join-form" class="btn btn-info">Join Us</button>';
        break;
        case 'closed':
        $button = '<button class="btn btn-close" disabled>Closed</button>';
        break;
        case 'cancel':
        $button = '<button type="submit" name="cancel-join-request" class="btn btn-danger">cancel</button>';
        break;
        case 'chat':
        $button = '<button type="submit" name="chat-with-group" class="btn btn-primary">Chat now!</button>';
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
            $renderHTML = '<div class="btn-edit-content"><a href="'.home_url('profile').'?form-mode=edit"class="btn btn-primary">Edit</a></div>';
        } else {
            if (empty(has_form_id())) {
                $renderHTML = '<div class="btn-edit-content">'.get_btn_case('edit').'</div>';
            }
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
    $renderHTML = '<div class="groups-button-request"> ';
    if (is_request_exist($form_id)) {
        $renderHTML .= get_btn_case('cancel');
    } elseif (!$status_form) {
        $renderHTML .= get_btn_case('closed');
    } elseif (is_member_in_group($form_id, get_current_user_id())) {
        $renderHTML .= get_btn_case('chat');
    } else {
        $renderHTML .= get_btn_case('join');
    }

    $renderHTML .= '</div>';

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

function formView($form_id)
{
    $major = userInfo('major', get_form_value($form_id, 'user_id'));
    $renderHTML .= '<div class="form-detail"><h3>'.get_form_value($form_id, 'title').'</h3>';
    $renderHTML .= get_edit_btn($form_id);
    $renderHTML .= '<input type="hidden" name="form-id" value="'.$form_id.'" /> ';
    $renderHTML .= '<input type="hidden" name="user-id" value="'.get_form_value($form_id, 'user_id').'" /> ';
    $renderHTML .= '<div class="form-major" style="text-align:center;"><b>'.$major.'</b></div>';
    $renderHTML .= '<div class= "form-detail-semester">Semester - <b>'.get_form_value($form_id, 'semester').'</b></div>';
    $renderHTML .= '<table id="form-view-detail">
        <tr>
            <th>Leader</th>
            <td><a href="'.home_url('user').'?user-id='.get_form_value($form_id, 'user_id').'" target="_blank" class="btn btn-info btn-sm">'.get_userdata(get_form_value($form_id, 'user_id'))->user_login.'</a></td>
        </tr>
        <tr>
            <th>Members</th>
            <td>'.get_list_member($form_id).'</td>
        </tr>
        <tr>
            <th>Description</th>
            <td class="description">'.get_form_value($form_id, 'description').'</td>
        </tr>
        <tr>
            <th>Skill set</th>
            <td>'.get_skills($form_id).'</td>
        </tr>
        <tr>
            <th>Other</th>
            <td>'.get_form_value($form_id, 'other_skill').'</td>
        </tr>
        <tr>
            <th>contact</th>
            <td>'.get_form_value($form_id, 'contact').'</td>
        </tr>
        <tr>
            <th>Suppervisor</th>';
    if (get_supervisor($form_id)) {
        $renderHTML .= '<td>'.get_supervisor($form_id).'</td>';
    } else {
        $renderHTML .= '<td>Not yet</td>';
    }
    $renderHTML .= '</tr>
        <tr>
            <th>Due date</th>
            <td>'.get_form_value($form_id, 'due_date').'</td>
        </tr>';
    $renderHTML .= '</table></div>';

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
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" class="btn btn-info btn-sm">'.get_userdata($members->member_id)->user_login.'</a>';
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
        $renderHTML .= $skill->name.' , ';
    }

    return $renderHTML;
}
