<?php

include 'includes/core/chat-group/connect-db.php';

function menu_bar_profile()
{
    $renderHTML = '';
    $user_id = get_current_user_id();
    $user_name = explode(' ', info('username'));
    $last_name = end($user_name);
    $renderHTML .= '<div class="group-menu-right">';
    $renderHTML .= get_menu_notification();
    $renderHTML .= get_menu_chat();
    $renderHTML .= '<div id="profile-bar" class="dropdown-profile-bar">';
    $renderHTML .= '<div class="dropbtn" ><a href="'.home_url('profile').'" >hi,'.$last_name.'</a></div>';
    $renderHTML .= '<div class="dropdown-content">';
    $renderHTML .= '<a href="'.home_url('profile').'" ><i class="fa fa-user" aria-hidden="true"></i> &nbsp;Profile</a>';
    $renderHTML .= '<a href="'.home_url('profile').'?mode=view"><i class="fa fa-users" aria-hidden="true"></i> &nbsp;Groups</a>';
    $renderHTML .= '<a href="'.wp_logout_url($_SERVER['REQUEST_URI'], false).'"><i class="fa fa-sign-out" aria-hidden="true"></i> &nbsp;Log Out</a>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}

function get_menu_notification()
{
    $renderHTML .= '<div id="notification-bar" class="dropdown-notification">';
    $renderHTML .= '<div class="dropbtn" ><a href="#" class="prefix-icon"><i class="fa fa-bell" aria-hidden="true"></i></a></div>';
    $renderHTML .= '<div class="dropdown-content col-lg-3">';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}

function get_menu_chat()
{
    $renderHTML .= '<div id="chat-bar" class="dropdown-notification">';
    $renderHTML .= '<div class="dropbtn"><a href="#" class="prefix-icon"><i class="fa fa-lg fa-comments-o" aria-hidden="true"></i></a></div>';
    $renderHTML .= '<div class="dropdown-content col-lg-3">';
    $renderHTML .= '<div class="notice-chat">Group Chat</div>';
    $renderHTML .= '<div class="list-notice-chat">';
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
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}

function get_box_chat($current_user_id)
{
    $list = get_chat_list($current_user_id);

    foreach ($list as $chat) {
        $chat_id = $chat->ID;
        if ($current_user_id == $chat->user_send) {
            $message = get_user_message($chat_id);
            $renderHTML .= '<div class="get-chat"> ';
            $renderHTML .= '<input type="hidden" id="user-name" value="'.get_name_of_user($chat->user_recevive).'" /> ';
            $renderHTML .= '<input type="hidden" id="user-send-id" value="'.$chat->user_send.'" /> ';
            $renderHTML .= '<input type="hidden" id="user-receive-id" value="'.$chat->user_recevive.'" /> ';
            $renderHTML .= '<div class="col-lg-2">';
            $renderHTML .= '<div class="get-user-receive">'.get_avatar($chat->user_recevive, 32).'</div>';
            $renderHTML .= '</div>';
            $renderHTML .= '<div class="col-lg-10"><b>'.get_name_of_user($chat->user_recevive).'</b>';
            $renderHTML .= '<p>'.$message.'</p></div>';
            $renderHTML .= '</div>';
        } elseif ($current_user_id == $chat->user_recevive) {
            $message = get_user_message($chat_id);
            $renderHTML .= '<div class="get-chat"> ';
            $renderHTML .= '<input type="hidden" id="user-name" value="'.get_name_of_user($chat->user_send).'" /> ';
            $renderHTML .= '<input type="hidden" id="user-send-id" value="'.$chat->user_send.'" /> ';
            $renderHTML .= '<input type="hidden" id="user-receive-id" value="'.$chat->user_recevive.'" /> ';
            $renderHTML .= '<div class="col-lg-2">';
            $renderHTML .= '<div class="get-user-receive">'.get_avatar($chat->user_send, 32).'</div>';
            $renderHTML .= '</div>';
            $renderHTML .= '<div class="col-lg-10"><b>'.get_name_of_user($chat->user_send).'</b>';
            $renderHTML .= '<p>'.$message.'</p></div>';
            $renderHTML .= '</div>';
        }
    }

    return $renderHTML;
}
function get_name_of_user($user_id)
{
    $name = get_user_by('ID', $user_id)->user_login;

    return $name;
}
