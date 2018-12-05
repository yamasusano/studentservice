<?php

function teacherGroupMenu()
{
    $renderHTML = '';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div class="menu-lists">';
    $renderHTML .= '<div class="group-menu-item"><button id="create-new-group" class="btn btn-info">Create</button></div>';
    $renderHTML .= '<div class="invite-members">
                <input type="text" name="student-name" id="student-name"  placeholder="search student here...">
                <button class="btn btn-info" name="search-students" id="search-students" >Search</button>
                </div></div>';
    $renderHTML .= '<div id="group-contents">'.teacherListMenu().'</div></div></div>';

    return $renderHTML;
}
function teacherListMenu()
{
    $renderHTML = '';
    $renderHTML .= '<table id="teacher-list-group"> ';
    $renderHTML .= '<tr> <th>Name</th> <th>Status</th> </tr>';
    $renderHTML .= '</table>';

    return $renderHTML;
}

function create_new_group($title)
{
    $user_id = get_current_user_id();
    $renderHTML = '';
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
        ]
    );
    if ($create_finder_form) {
        return true;
    } else {
        return false;
    }
}
// function insert_member_leader($form_id, $user_id)
// {
//     global $wpdb;
//     $get_member_first = $wpdb->insert(
//         "{$wpdb->prefix}members",
//         [
//             'form_id' => $form_id,
//             'member_id' => $user_id,
//             'member_role' => 0,
//         ]
//     );
//     if ($get_member_first) {
//         return true;
//     } else {
//         return false;
//     }
// }

// function insert_group($form_id, $group_type)
// {
//     global $wpdb;
//     $get_group = $wpdb->insert(
//         "{$wpdb->prefix}groups",
//         [
//             'form_id' => $form_id,
//             'type' => $group_type,
//         ]
//     );
//     if ($get_group) {
//         return true;
//     } else {
//         return false;
//     }
// }
