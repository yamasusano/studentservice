<?php

function check_form_exist($user_id)
{
    global $wpdb;
    $form_id = $wpdb->get_var("
    SELECT m.form_id
    FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id
    WHERE member_id = '".$user_id."'
    AND g.type = 'Student'
    ");

    if ($form_id) {
        return false;
    }

    return true;
}

function is_member_in_group($form_id, $user_id)
{
    global $wpdb;
    $result = $wpdb->get_var("
    SELECT *
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$user_id."'
    ");

    if ($result) {
        return true;
    }

    return false;
}
