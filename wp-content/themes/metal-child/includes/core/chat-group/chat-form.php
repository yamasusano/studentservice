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
    $renderHTML .= '<div class="col-lg-1"><button id="manage-recommand" class="btn btn-success btn-sm">Recommended</button></div>';
    $renderHTML .= '<div class="recommend-list">';
    $renderHTML .= '<div id="waiting">
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
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="chat-form-content"><div class="save-popup"></div><div class="chat-box">';
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

function set_recommend($form_id, $message)
{
    $save = save_recommended($form_id, $message);
    if ($save) {
        return 'recommended';
    } else {
        return 'save failed';
    }
}
function set_recommend_list($form_id)
{
    $result = get_recommended_list($form_id);
    $count = count($result);
    $renderHTML = '';
    $in = 1;
    foreach ($result as $index) {
        $renderHTML .= '<div class="recommend-item">';
        $renderHTML .= '<input type="hidden" name="recommend-index" value="'.$index->ID.'" />';
        $renderHTML .= '<b>'.$in.'</b>.&nbsp;&nbsp;';
        $renderHTML .= '<span>'.$index->note.'</span>';
        $renderHTML .= '<span class="remove-recommend"><i class="fa fa-times" aria-hidden="true"></i></span>';
        $renderHTML .= '</div>';
        ++$in;
    }

    return array('count' => $count, 'content' => $renderHTML);
}

function remove_recommended_list($ID)
{
    $check = action_remove_recommend($ID);
    if ($check) {
        return true;
    } else {
        return false;
    }
}
