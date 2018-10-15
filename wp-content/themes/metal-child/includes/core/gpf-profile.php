<?php
function defineRole()
{
    global $wpdb;
    $user_id = get_current_user_id();
    $user_role = 0;
    if ($user_id !== 0) {
        $user_role = $wpdb->get_results("
        SELECT meta_value
        FROM {$wpdb->prefix}usermetaData
        WHERE meta_key = 'role'
        AND user_id = '" . $user_id . "'
        ");
    }
}

function info()
{
    global $wpdb;
    $user_id = get_current_user_id();
    $user_info = $wpdb->get_results("
    SELECT *
    FROM {$wpdb->prefix}usermetaData
    WHERE user_id = '" . $user_id . "'
    ");
    return $user_info;
}

function switchModeProfile(){
    if(isset($_POST['user-id'])){
        $mode = 'edit';
        $user_name = $_POST['user-id'];
        echo $user_name .'---'.$mode;
    }
}