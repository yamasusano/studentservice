<?php

include 'includes/core/profile/teacher-form.php';
function teacher_list_form($form)
{
    $renderHTML .= '<tr>';
    $renderHTML .= '<td><a href='.home_url('user').'?user-id='.$form->user_id.'>'.teacher_info_detail($form->user_id, 'username').'</a></td>';
    $renderHTML .= '<td> <p class="title-form-other">'.$form->title.'</p>';
    $renderHTML .= '<input type="hidden" id="teacher-form-id" value="'.$form->ID.'"/> </td>';
    $renderHTML .= '</tr>';

    return $renderHTML;
}

function form_lists($user_id)
{
    global $wpdb;
    $form_id = $wpdb->get_results("
    SELECT form_id 
    FROM {$wpdb->prefix}members 
    WHERE member_id = '".$user_id."' 
    AND member_role = 1 
    order by joined_date DESC
    ");

    foreach ($form_id as $ID) {
        $type = $wpdb->get_results("
        SELECT * 
        FROM {$wpdb->prefix}groups
        WHERE form_id = '".$ID->form_id."'
        AND type = 'Teacher'
        ");
        if ($type) {
            $form = $wpdb->get_results("
            SELECT * 
            FROM {$wpdb->prefix}finder_form 
            WHERE ID = '".$ID->form_id."'
            ");
            $renderHTML .= teacher_list_form($form[0]);
        }
    }

    return $renderHTML;
}
function gen_list_form_teacher()
{
    $current_user = get_current_user_id();
    $renderHTML = '';
    $renderHTML .= '<table id="teacher-lists">';
    $renderHTML .= '<tr> <th>Leader</th> <th>Groups Name</th> </tr>';
    $renderHTML .= form_lists($current_user);
    $renderHTML .= '</table>';

    return $renderHTML;
}
function list_form_teacher()
{
    $renderHTML = '';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div class="menu-lists" style="padding:10px;">';
    $renderHTML .= '<div class="group-menu-item"<h4>Teacher Groups</h4></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="message-show"></div>';
    $renderHTML .= '<div id="group-contents" style= "padding:10px;">';

    $renderHTML .= gen_list_form_teacher();
    $renderHTML .= '</div></div></div>';

    return $renderHTML;
}
