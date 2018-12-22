<?php

function query_list_student_form_via_teacher($user_id)
{
    global $wpdb;
    $list_form = $wpdb->get_results("
    SELECT f.* FROM {$wpdb->prefix}finder_form as f
    INNER JOIN  {$wpdb->prefix}members as m 
    ON f.ID = m.form_id
    WHERE m.member_id = '".$user_id."' 
    AND m.member_role = 2
    ");
    foreach ($list_form as $form) {
        $renderHTML .= list_student_form($form);
    }

    return $renderHTML;
}
function list_form_student($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div class="menu-lists" style="padding:10px;">';
    $renderHTML .= '<div class="group-menu-items"><h4>Student List Form</h4></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="group-button-other"></div>';
    $renderHTML .= '<div class="message-show"></div>';
    $renderHTML .= '<div id="group-contents" style= "padding:10px;">';

    $renderHTML .= get_list_student_form_via_teacher($user_id);
    $renderHTML .= '</div></div></div>';

    return $renderHTML;
}
function get_list_student_form_via_teacher($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<table id="list-group-student-via-teacher"> ';
    $renderHTML .= '<tr><th>Semester</th> <th>Name</th> <th>Member(s)</th><th>Status</th> </tr>';
    $renderHTML .= query_list_student_form_via_teacher($user_id);
    $renderHTML .= '</table>';

    return $renderHTML;
}

function list_student_form($form)
{
    $renderHTML .= '<tr>';
    $renderHTML .= '<td><b>'.$form->semester.'</b></td>';
    $renderHTML .= '<td><p id="student-form-title" class="title-group-teacher" >'.$form->title.'</p>';
    $renderHTML .= '<input type="hidden" id="student-form-id" value="'.$form->ID.'" /></td>';
    $renderHTML .= '<td>'.members_in_group_student($form->ID).'</td>';
    $renderHTML .= '<td><div class="delete-form-group">';
    $renderHTML .= action_check_status_form_student($form);
    $renderHTML .= '</div></td>';
    $renderHTML .= '</tr>';

    return $renderHTML;
}

function action_check_status_form_student($form)
{
    global $wpdb;
    $status = set_sts_form_student($form->ID);
    if ($status) {
        $renderHTML .= 'Closed';
    } else {
        $status = $form->status;
        if ($status == 0) {
            $renderHTML .= 'Closed';
        } else {
            $renderHTML .= 'Opening';
        }
    }

    return $renderHTML;
}

function set_sts_form_student($form_id)
{
    global $wpdb;
    $semester = $wpdb->get_var("
    SELECT semester
    FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."' 
    ");
    $check = $wpdb->get_var("
    SELECT status
    FROM {$wpdb->prefix}semester
    WHERE name = '".$semester."'
    ");
    if ($check == 0) {
        return true;
    }

    return false;
}

function members_in_group_student($form_id)
{
    global $wpdb;
    $members = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}members
    WHERE member_role != 2 
    AND form_id = '".$form_id."'
    ");
    $renderHTML = count($members);

    return $renderHTML;
}
function member_pos($form_id, $member_id)
{
    global $wpdb;
    $pos = $wpdb->get_var("
    SELECT postion
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$member_id."'
    ");

    return $pos;
}
