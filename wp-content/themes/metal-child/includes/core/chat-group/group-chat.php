<?php

function get_title($form_id)
{
    global $wpdb;
    $title = $wpdb->get_var("
    select name from {$wpdb->prefix}group_chat 
    where form_id = '".$form_id."'
    ");

    return $title;
}

function show_message_group($form_id, $current_user)
{
    $renderHTML = '';
    $history_chat = show_message_group_chat($form_id, $current_user);
    foreach ($history_chat as $chat) {
        if ($chat->user_id == $current_user) {
            $renderHTML .= '<div class="current_user">';
            $renderHTML .= '<div class="content-message">';
            $renderHTML .= '<span>'.$chat->message.'</span>';
            $renderHTML .= '</div>';
            $renderHTML .= '</div>';
        } else {
            $renderHTML .= '<div class="other_user">';
            $renderHTML .= '<div class="other_user_name"><span style="font-size: 13px;">'.get_user_by('ID', $chat->user_id)->user_login.'</span></div>';
            $renderHTML .= '<div class="content-message" style="margin-left: 20px;">';
            $renderHTML .= '<span>'.$chat->message.'</span>';
            $renderHTML .= '</div>';
            $renderHTML .= '</div>';
        }
    }

    return $renderHTML;
}
