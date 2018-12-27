<?php

include 'includes/core/profile/teacher-form.php';
function teacher_list_form($form)
{
    $renderHTML .= '<tr>';
    $renderHTML .= '<td><b>'.$form->semester.'</b></td>';
    $renderHTML .= '<td><a href='.home_url('user').'?user-id='.$form->user_id.'>'.teacher_info_detail($form->user_id, 'username').'</a></td>';
    $renderHTML .= '<td> <p class="title-form-other">'.$form->title.'</p>';
    $renderHTML .= '<input type="hidden" id="teacher-form-id" value="'.$form->ID.'"/> </td>';
    $renderHTML .= '<td>'.members_in_group_teacher($form->ID).'</td>';
    $renderHTML .= '<td>'.($form->status == 0 ? 'Closed' : 'Opening').'</td>';
    $renderHTML .= '</tr>';

    return $renderHTML;
}

function members_in_group_teacher($form_id)
{
    global $wpdb;
    $members = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}members
    WHERE member_role = 1 
    AND form_id = '".$form_id."'
    ");
    $renderHTML = count($members);

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
    $renderHTML .= '<tr><th>Semester</th><th>Teacher</th> <th>Name</th><th>Member(s)</th><th>Status</th></tr>';
    $renderHTML .= form_lists($current_user);
    $renderHTML .= '</table>';

    return $renderHTML;
}
function list_form_teacher()
{
    $renderHTML = '';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div class="menu-lists" style="padding:10px;">';
    $renderHTML .= '<div class="group-menu-items"><h4>Teacher List Form</h4></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="group-button-other"></div>';
    $renderHTML .= '<div class="message-show"></div>';
    $renderHTML .= '<div id="group-contents" style= "padding:10px;">';

    $renderHTML .= gen_list_form_teacher();
    $renderHTML .= '</div></div></div>';

    return $renderHTML;
}
function get_group_button()
{
    $renderHTML .= '<button id="group-chat" class="btn btn-info">Messenger</button>';
    $renderHTML .= '<button id="members-lists" class="btn btn-info">Members</button>';

    return $renderHTML;
}
function form_teacher_detail($form_id)
{
    $renderHTML = '';
    $renderHTML .= form_teacher_view_detail($form_id);

    return $renderHTML;
}
function get_form_mation($form_id)
{
    global $wpdb;
    $select = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'
    ");

    return $select;
}
function form_teacher_view_detail($form_id)
{
    $members = set_member_to_form($form_id);
    $type = form_type_via_teach($form_id);
    $status = set_sts_form_student($form_id);
    $form = get_form_mation($form_id);
    if ($form_id) {
        $renderHTML .= '<div class="form-view" style="position:relative;">';
        $renderHTML .= '<h3 style="text-transform: uppercase;">'.get_form_teacher_info($form_id, 'title').'</h3>';
        $renderHTML .= '<h5 style="padding-left: 40px;">Semester  <b>'.get_form_teacher_info($form_id, 'semester').'</b></h5>';
        $renderHTML .= '<hr class="style-four">';
        $renderHTML .= '<div class="form-view-detail">';
        $renderHTML .= '<div class="desc-view"><div class="col-lg-3 col">Description</div><div class="col-lg-9 col">'.get_form_teacher_info($form_id, 'description').'</div></div>';
        $renderHTML .= '<div class="members"><div class="col-lg-3 col">Members</div><div class="col-lg-9 col">'.$members.'</div></div>';
        $renderHTML .= '<div class="skill-set"><div class="col-lg-3">Responsibilities</div><div class="col-lg-9">'.get_skill_teacher_form($form_id).'</div></div>';
        $renderHTML .= '<div class="Others"><div class="col-lg-3">Others</div><div class="col-lg-9">'.get_form_teacher_info($form_id, 'other_skill').'</div></div>';
        $renderHTML .= '<div class="status"><div class="col-lg-3">Status</div><div class="col-lg-9">'.action_check_status_form_student($form).'</div></div>';
        $renderHTML .= '</div></div>';
        if ($type == 'Student' && !$status) {
            $renderHTML .= '<button id="leave-group-teacher" class="btn btn-danger">Leave<input type="hidden" value="'.$form_id.'"/> </button>';
        } elseif ($type == 'Teacher') {
            $renderHTML .= '<button id="leave-group-teacher" class="btn btn-danger">Leave<input type="hidden" value="'.$form_id.'"/></button>';
        }
    }

    return $renderHTML;
}
function form_type_via_teach($form_id)
{
    global $wpdb;
    $type = $wpdb->get_var("
    SELECT type 
    FROM {$wpdb->prefix}groups
    WHERE form_id = '".$form_id."'
    ");

    return $type;
}
function leave_teacher_group($form_id, $user_id)
{
    global $wpdb;
    $leave_group = $wpdb->delete(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => $user_id,
        ]
);
    if ($leave_group) {
        return true;
    }

    return false;
}
