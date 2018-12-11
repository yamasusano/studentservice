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
// function
function get_list_student_form_via_teacher($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<table id="teacher-list-group"> ';
    $renderHTML .= '<tr> <th>Name</th> <th>Status</th> </tr>';
    $renderHTML .= query_list_student_form_via_teacher($user_id);
    $renderHTML .= '</table>';

    return $renderHTML;
}

function list_student_form($form)
{
    $renderHTML .= '<tr>';
    $renderHTML .= '<td><p id="student-form-title" class="title-group-teacher" >'.$form->title.'</p>';
    $renderHTML .= '<input type="hidden" id="student-form-id" value="'.$form->ID.'" /></td>';
    $renderHTML .= '<td><div class="delete-form-group">';
    if ($form->status == 0) {
        $renderHTML .= 'Closed';
    } else {
        $renderHTML .= 'Openning';
    }

    $renderHTML .= '</div></td>';
    $renderHTML .= '</tr>';

    return $renderHTML;
}
