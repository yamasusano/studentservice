<?php

function insert_finder_form($title, $description, $close_date, $other, $contact, $user_id)
{
    global $wpdb;
    $get_finder_form = $wpdb->insert(
        "{$wpdb->prefix}finder_form",
        [
            'user_id' => get_current_user_id(),
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'expiry_date' => $close_date,
            'contact' => $contact,
            'status' => 1,
        ]
    );
    if ($get_finder_form) {
        return true;
    } else {
        return false;
    }
}
function insert_member_leader($form_id, $user_id)
{
    global $wpdb;
    $get_member_first = $wpdb->insert(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => $user_id,
            'member_role' => 0,
           'status' => 0,
        ]
    );
    if ($get_member_first) {
        return true;
    } else {
        return false;
    }
}

function insert_group($form_id, $group_type, $supervisor_id)
{
    global $wpdb;
    $get_group = $wpdb->insert(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
            'type' => $group_type,
            'suppervisor_id' => get_user_by('login', $supervisor)->ID,
        ]
    );
    if ($get_group) {
        return true;
    } else {
        return false;
    }
}

function insert_skill($form_id, $skillString)
{
    global $wpdb;
    $skills = explode(',', $skillString);
    foreach ($skills as $skill) {
        if (!empty($skill)) {
            $skill_id = get_skill_id($skill);
            $get_skill = $wpdb->insert(
                "{$wpdb->prefix}form_skill",
                [
                    'form_id' => $form_id,
                    'skill_id' => $skill_id,
                ]
            );
        }
    }
}

function finder_form_id($title)
{
    global $wpdb;
    $form_id = $wpdb->get_var("
        SELECT ID
        FROM {$wpdb->prefix}finder_form
        WHERE title = '".$title."'
        ");

    return $form_id;
}

function get_skill_id($skill)
{
    global $wpdb;
    $skill_id = $wpdb->get_var("
    SELECT ID
    FROM {$wpdb->prefix}skill_major
    WHERE name = '".$skill."'
    ");

    return $skill_id;
}

function sendRequest($form_id)
{
    global $wpdb;
    $message = '';
    $insert_members_watting = $wpdb->insert(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => get_current_user_id(),
            'member_role' => 1,
            'status' => 1,
        ]
    );
    if ($insert_members_watting) {
        $message = 'Waitting leader acxept';
    }

    return $message;
}
