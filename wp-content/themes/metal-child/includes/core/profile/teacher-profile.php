<?php

function teacherGroupMenu()
{
    $renderHTML = '';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div id="teacher-menu-lists" class="menu-lists">';
    $renderHTML .= '<div class="group-menu-item" style="width:100%">';
    $renderHTML .= '<button id="create-new-group" class="btn btn-info">Create</button></div>';
    $renderHTML .= '<div class="invite-members">';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="message-show"></div>';
    $renderHTML .= '<div id="group-contents">'.teacherListMenu().'</div></div></div>';

    return $renderHTML;
}

function teacherListMenu()
{
    $renderHTML = '';
    $renderHTML .= '<table id="teacher-list-group"> ';
    $renderHTML .= '<tr><th>Semester</th> <th>Name</th> <th>Status</th> </tr>';
    $renderHTML .= get_list_form_teacher(get_current_user_id());
    $renderHTML .= '</table>';

    return $renderHTML;
}
function get_list_form_teacher($teacher_id)
{
    global $wpdb;
    $forms = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}finder_form
    WHERE user_id = '".$teacher_id."'
    order by created_date DESC
    ");
    foreach ($forms as $form) {
        $renderHTML .= teacher_forms($form);
    }

    return $renderHTML;
}

function teacher_forms($form)
{
    $renderHTML .= '<tr>';
    $renderHTML .= '<td><b>'.$form->semester.'</b></td>';
    $renderHTML .= '<td><p id="title-form-teacher" class="title-group-teacher" >'.$form->title.'</p></td>';
    $renderHTML .= '<td><div class="delete-form-group">';
    $renderHTML .= '<button id="delete-form-teacher" class="btn btn-danger btn-sm">Delete</button>';
    $renderHTML .= '<input type="hidden" id="teacher-form-id" value="'.$form->ID.'" /> ';
    $renderHTML .= '</div> </td>';
    $renderHTML .= '</tr>';

    return $renderHTML;
}

function create_new_group($title)
{
    $user_id = get_current_user_id();
    $finder_form = insert_teacher_finder_form($title, $user_id);
    if ($finder_form) {
        $form = $finder_form[0];
        $member_lead = insert_teacher($finder_form[0]->ID, $user_id);
        $groups = insert_teacher_group($finder_form[0]->ID, 'Teacher');
        if ($member_lead && $groups) {
            $renderHTML = teacher_forms($form);
        }
        create_new_group_chat($finder_form[0]->ID, $title);
    }

    return $renderHTML;
}
function create_new_group_chat($form_id, $title)
{
    global $wpdb;
    $create_group_chat = $wpdb->insert(
        "{$wpdb->prefix}group_chat",
        [
            'form_id' => $form_id,
            'name' => $title,
        ]
    );
}
function insert_teacher_finder_form($title, $user_id)
{
    global $wpdb;
    $create_finder_form = $wpdb->insert(
        "{$wpdb->prefix}finder_form",
        [
            'user_id' => $user_id,
            'title' => $title,
            'status' => 0,
            'special' => 1,
        ]
    );
    if ($create_finder_form) {
        $curr_form = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}finder_form
    WHERE title = '".$title."'
    AND user_id = '".$user_id."'
    ");
    }

    return $curr_form;
}
function insert_teacher($form_id, $user_id)
{
    global $wpdb;
    $get_member_first = $wpdb->insert(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => $user_id,
            'member_role' => 0,
        ]
    );
    if ($get_member_first) {
        return true;
    } else {
        return false;
    }
}

function insert_teacher_group($form_id, $group_type)
{
    global $wpdb;
    $get_group = $wpdb->insert(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
            'type' => $group_type,
        ]
    );
    if ($get_group) {
        return true;
    } else {
        return false;
    }
}
function validTitleForm($title)
{
    global $wpdb;
    $teacher_id = get_current_user_id();
    $forms = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}finder_form
    WHERE user_id = '".$teacher_id."'
    ");
    foreach ($forms as $form) {
        if ($title == $form->title) {
            return false;
        }
    }

    return true;
}
function teacher_delete_form($form_id, $user_id)
{
    global $wpdb;
    $delete_members = $wpdb->delete(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => $user_id,
        ]
        );
    $delete_groups = $wpdb->delete(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
        ]
        );
    $delete_skill = $wpdb->delete(
        "{$wpdb->prefix}form_skill",
        [
            'form_id' => $form_id,
        ]
        );
    if (isset($delete_groups) && isset($delete_members)) {
        $delete_form = $wpdb->delete(
            "{$wpdb->prefix}finder_form",
           [
            'ID' => $form_id,
            'user_id' => $user_id,
           ]
        );
    }
    if ($delete_form) {
        return true;
    } else {
        return false;
    }
}
