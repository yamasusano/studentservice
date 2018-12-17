<?php

function get_list_members($form_id)
{
    global $wpdb;
    $members = $wpdb->get_results("
    SELECT member_id FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    ");

    return $members;
}

function get_members_info($user_id, $key)
{
    global $wpdb;
    switch ($key) {
    case 'account':
        $value = get_user_by('ID', $user_id)->user_login;
        break;

    default:
    $value = $wpdb->get_var("
    SELECT meta_value FROM {$wpdb->prefix}usermetaData 
    WHERE meta_key = '".$key."' 
    AND user_id = '".$user_id."'
    ");
        break;
}

    return $value;
}

function get_user_chat_id($user_id, $current_user_id)
{
    global $wpdb;
    $result = $wpdb->get_var("
    SELECT ID FROM {$wpdb->prefix}user_chat 
    WHERE user_send = '".$current_user_id."'
    AND user_recevive = '".$user_id."'
    ");
    if (!$result) {
        $result = $wpdb->get_var("
        SELECT ID FROM {$wpdb->prefix}user_chat 
        WHERE user_send = '".$user_id."'
        AND user_recevive = '".$current_user_id."'
        ");
    }

    return $result;
}
function get_history_chat($user_id, $current_user_id)
{
    global $wpdb;
    $chat_id = get_user_chat_id($user_id, $current_user_id);
    if ($chat_id) {
        $contents = $wpdb->get_results("
        SELECT * FROM {$wpdb->prefix}chat_user 
        WHERE chat_id = '".$chat_id."'
        
        ");
    }

    return $contents;
}

function get_chat_list($current_user_id)
{
    global $wpdb;
    $result = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}user_chat 
    WHERE user_send = '".$current_user_id."'
    OR user_recevive = '".$current_user_id."'
    ");

    return $result;
}

function get_user_message($chat_id)
{
    global $wpdb;
    $message = $wpdb->get_var("
    SELECT message FROM {$wpdb->prefix}chat_user  
    WHERE chat_id = '".$chat_id."' 
    order by create_date DESC 
    LIMIT 1
    ");

    return $message;
}
function have_new_message()
{
    global $wpdb;
}
