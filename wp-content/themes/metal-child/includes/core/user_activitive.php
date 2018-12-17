<?php

function get_list_email()
{
    global $wpdb;
    $list_email = $wpdb->get_results("
    SELECT email FROM {$wpdb->prefix}users_status
    ");

    return $list_email;
}

function action_user_online()
{
    global $wpdb;
    $check = false;
    $email = $_SESSION['email'];
    foreach (get_list_email() as $mail) {
        if ($email == $mail->email) {
            $check = true;
        }
    }
    if ($check) {
        $update = $wpdb->update(
                "{$wpdb->prefix}users_status",
                [
                   'status' => 1,
                ],
                [
                    'email' => $email,
                ]
                );
    } else {
        $insert = $wpdb->insert(
                "{$wpdb->prefix}users_status",
                [
                    'email' => $email,
                    'status' => 1,
                ]
                );
    }
}
function action_user_offline()
{
    global $wpdb;
    $email = $_SESSION['email'];
    $update = $wpdb->update(
        "{$wpdb->prefix}users_status",
        [
           'status' => 0,
        ],
        [
            'email' => $email,
        ]
        );
}
function is_user_online($user_id)
{
    global $wpdb;
    $user_email = get_user_by('ID', $user_id)->user_email;
    $status = $wpdb->get_var("
    SELECT status FROM {$wpdb->prefix}users_status
    WHERE email = '".$user_email."' 
    ");
    if ($status == 1) {
        return true;
    }

    return false;
}
