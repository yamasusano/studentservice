<?php 
function registerNewUser($email, $user_name, $gender)
{
    global $wpdb;
    $account = getAccountName($email);
    if(createUser($account) !== 0){
        userLoggedIn($account);
        getUserInfo(createUser($account), $user_name, $gender,$account);
        wp_redirect(home_url('profile'));
        exit();
    }
    
}

function createUser($account){
    $user_id = username_exists( $account);
    if ( !$user_id and email_exists($email) == false ) {
        $random_password = wp_generate_password( $length=12, $include_standard_special_chars=false );
        $user_id = wp_create_user( $account, $random_password, $user_email );
    } else {
        $random_password = __('User already exists.  Password inherited.');
    }
    return $user_id;
}


function getUserInfo($user_id, $user_name, $gender,$account)
{
    global $wpdb;
    $set_user_name = $wpdb->insert(
        "{$wpdb->prefix}usermetaData",
        [
            "user_id" => $user_id,
            "meta_key" => "username",
            "meta_value" => $user_name,

        ]
    );
    $set_user_gender = $wpdb->insert(
        "{$wpdb->prefix}usermetaData",
        [
            "user_id" => $user_id,
            "meta_key" => "gender",
            "meta_value" => $gender,

        ]
    );
    $set_user_address = $wpdb->insert(
        "{$wpdb->prefix}usermetaData",
        [
            "user_id" => $user_id,
            "meta_key" => "address",
            "meta_value" => '',

        ]
    );
    $set_user_phone = $wpdb->insert(
        "{$wpdb->prefix}usermetaData",
        [
            "user_id" => $user_id,
            "meta_key" => "phone",
            "meta_value" => '',

        ]
    );
    $get_role = emailAnalys($account);
    $set_user_role = $wpdb->insert(
        "{$wpdb->prefix}usermetaData",
        [
            "user_id" => $user_id,
            "meta_key" => "role",
            "meta_value" => $get_role

        ]
    );
}


/* if return 1 => account is Student
*** if return 0 => acccount is Teacher
*/
function emailAnalys($account)
{
    $result = 0;
    if (strlen($account) < 5) {
        $result = 0;
    } else {
        $string = substr(strrev($account), 0, 5);
        $check = false;
        if (is_numeric($string)) {
            $result = 1;
        } 
    }
    return $result;
}
