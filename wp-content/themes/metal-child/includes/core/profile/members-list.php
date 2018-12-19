<?php

include 'includes/core/group/finder-form-action.php';
function get_member_list_via_teacher($form_id)
{
    global $wpdb;
    $is_leader = is_teacher($form_id);
    $renderHTML = '';
    $get_member = get_all_member($form_id);
    $renderHTML .= '<div class="member-message"></div>';
    $renderHTML .= '<table><tr><th>Name</th><th>role</th><th>action</th></tr>';
    foreach ($get_member as $member) {
        $member_name = get_user_link($member->member_id);
        $member_role = get_role_form($form_id, $member->member_id);
        $renderHTML .= '<tr class="member-item">';
        $renderHTML .= '<input type="hidden" name="user-id" id="user-id" value="'.$member->member_id.'" />';
        $renderHTML .= '<td><a href="#">'.$member_name.'</a></td>';
        $renderHTML .= '<td>'.$member_role.'</td>';
        $renderHTML .= '<td class="method-action">';
        if ($is_leader) {
            if ($member_role == 'Member') {
                $renderHTML .= '<button id="kick-out-member" class="btn btn-danger btn-sm" >remove from group</button>';
            }
        } else {
            $renderHTML .= '<button id="infor-view" class="btn btn-info btn-sm" >View</button>';
        }
        $renderHTML .= '</td>';
        $renderHTML .= '</tr>';
    }

    $renderHTML .= '</table>';

    return $renderHTML;
}
function remove_member_via_teacher($form_id, $member_id)
{
    global $wpdb;
    $remove_member = $wpdb->query("
    DELETE FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_id = '".$member_id."'
    ");
    $member_name_remove = get_userdata($member_id)->user_login;
    if ($remove_member) {
        return '<div class="message-success"> Removed '.$member_name_remove.' successful!</div>';
    } else {
        return '<div class="message-fail">Removed false!</div>';
    }
}
