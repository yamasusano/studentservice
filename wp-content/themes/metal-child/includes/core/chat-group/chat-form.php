<?php

require_once 'form-info.php';
function get_form_chat($form_id)
{
    $renderHTML = '';

    $renderHTML .= '<div class="group-chat-form"> ';
    $renderHTML .= '<div class="chat-form-member">';
    $renderHTML .= '<div class="col-lg-1"><b>Members</b></div>';
    $renderHTML .= '<div id="list-member-chat" class="col-lg-11">';
    $renderHTML .= generate_member($form_id);
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="chat-form-content"><div class="chat-box">';
    $renderHTML .= '</div></div>';
    $renderHTML .= '<table class="chat-form-input">';
    $renderHTML .= '<tr><td>';
    $renderHTML .= '<textarea name="message-chat" id="message-chat" placeholder="Type a message..."></textarea>';
    $renderHTML .= '</td>';
    $renderHTML .= '<td>';
    $renderHTML .= '<button type="submbit" id="send-message" class="btn btn-primary btn-message">Send</button>';
    $renderHTML .= '</td>';
    $renderHTML .= '</tr></table>';
    $renderHTML .= '</div>';

    return $renderHTML;
}

function box_chat($user_id)
{
    return generate_box_chat($user_id);
}
function box_chat2($user_id, $user_name)
{
    return generate_box_chat2($user_id, $user_name);
}
function history_chat_user($user_id, $current_user_id)
{
    $renderHTML = '';
    $receive_name = get_user_by('ID', $user_id)->user_login;
    $history_chat = get_history_chat($user_id, $current_user_id);
    foreach ($history_chat as $chat) {
        if ($chat->sender == $current_user_id) {
            $renderHTML .= '<div class="current_user">';
            $renderHTML .= '<div class="content-message">';
            $renderHTML .= '<span>'.$chat->message.'</span>';
            $renderHTML .= '</div>';
            $renderHTML .= '</div>';
        } elseif ($chat->sender == $user_id) {
            $renderHTML .= '<div class="other_user">';
            $renderHTML .= '<div class="content-message">';
            $renderHTML .= '<span>'.$chat->message.'</span>';
            $renderHTML .= '</div>';
            $renderHTML .= '</div>';
        }
    }

    return $renderHTML;
}
function get_notice_for_user()
{
    $user_id = have_new_message();

    return $user_id;
}
