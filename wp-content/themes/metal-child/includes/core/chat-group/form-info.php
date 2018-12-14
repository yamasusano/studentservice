<?php

require_once 'connect-db.php';

function generate_member($form_id)
{
    $member_list = get_list_members($form_id);
    $renderHTML = '';
    foreach ($member_list as $user_id) {
        $user_id = $user_id->member_id;
        $renderHTML = get_user_status_activitive($user_id);
    }

    return $renderHTML;
}

function generate_box_chat($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="box-chat">';
    $renderHTML .= '<div class="box-chat-title">';
    $renderHTML .= '<input type="hidden" name="user-id" value="'.$user_id.'" class="user-id" />';
    $check = is_user_online($user_id);
    if ($check) {
        $renderHTML .= '<span name="user-status" class="dot user-active"></span>';
    } else {
        $renderHTML .= '<span name="user-status" class="dot"></span>';
    }
    $renderHTML .= '<b class="user-chat-name">'.get_members_info($user_id, 'account').'</b>';
    $renderHTML .= '<span id="close-box-chat" class="close">&times;</span>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="group-box-chat">';
    $renderHTML .= '<div class="box-chat-content">';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="box-chat-send">';
    $renderHTML .= '<div name="box-chat-text" id="box-chat-text" contenteditable="true" data-placeholder="Type a message..."></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function get_user_status_activitive($user_id)
{
    $renderHTML .= '<a href="'.home_url('user?user-id='.$user_id.' ').'" class="btn btn-sm">';
    $renderHTML .= '<input type="hidden" name="user-id" value="'.$user_id.'" class="user-id" />';
    $renderHTML .= '<b class="user-chat-name">'.get_members_info($user_id, 'account').'</b>';
    $check = is_user_online($user_id);
    if ($check) {
        $renderHTML .= '<span name="user-status" class="dot user-active"></span>';
    } else {
        $renderHTML .= '<span name="user-status" class="dot"></span>';
    }
    $renderHTML .= '</a>';

    return $renderHTML;
}
