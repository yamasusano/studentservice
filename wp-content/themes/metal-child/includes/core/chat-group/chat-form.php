<?php

require_once 'form-info.php';
require_once 'group-chat.php';
function get_form_chat($form_id)
{
    $renderHTML = '';

    $renderHTML .= '<div class="group-chat-form"> ';
    $renderHTML .= '<div class="chat-title">';
    $renderHTML .= '<h4>'.get_title($form_id).'</h4>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="chat-form-member">';
    $renderHTML .= '<div class="col-lg-1"><b>Members</b></div>';
    $renderHTML .= '<div id="list-member-chat" class="col-lg-9">';
    $renderHTML .= generate_member($form_id);
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-1"><b><button class="btn btn-success btn-sm" >Recommended</button></b></div>';
    $renderHTML .= '<div class="recommend-list"></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="chat-form-content"><div class="chat-box">';
    $renderHTML .= '<div id="wait">
        <div class="sk-circle">
        <div class="sk-circle1 sk-child"></div>
        <div class="sk-circle2 sk-child"></div>
        <div class="sk-circle3 sk-child"></div>
        <div class="sk-circle4 sk-child"></div>
        <div class="sk-circle5 sk-child"></div>
        <div class="sk-circle6 sk-child"></div>
        <div class="sk-circle7 sk-child"></div>
        <div class="sk-circle8 sk-child"></div>
        <div class="sk-circle9 sk-child"></div>
        <div class="sk-circle10 sk-child"></div>
        <div class="sk-circle11 sk-child"></div>
        <div class="sk-circle12 sk-child"></div>
        </div>
        </div>';

    $renderHTML .= '</div></div>';
    $renderHTML .= '<div name="box-chat-text" id="input-message-group" contenteditable="true" data-placeholder="Type a message..."></div>';
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
