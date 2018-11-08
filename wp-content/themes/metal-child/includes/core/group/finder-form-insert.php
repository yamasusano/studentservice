<?php

function has_major()
{
    $current_major = info('major');
    if (empty($current_major)) {
        return array('result' => false, 'message' => 'You need to have a major to post Finder form, go to profile to update your major.');
    }

    return array('result' => true);
}
function insert_finder_form($semester, $title, $description, $close_date, $other, $contact, $user_id)
{
    global $wpdb;
    $get_finder_form = $wpdb->insert(
        "{$wpdb->prefix}finder_form",
        [
            'user_id' => get_current_user_id(),
            'semester' => $semester,
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'due_date' => $close_date,
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
function form_info($field, $form_id)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT $field 
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'
    ");

    return $value;
}

function sendRequest($form_id, $leader_id)
{
    global $wpdb;
    $message = '';
    $count = $wpdb->get_var("
    SELECT *
    FROM {$wpdb->prefix}request 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".get_current_user_id()."'
    ");
    if (limitRequest($form_id)) {
        $message = 'You can send request maximum 3 form !!!';
    } else {
        if (isset($count)) {
            $message = 'Waitting <a href="'.home_url('user').'?user-id='.$leader_id.'" >'.get_userdata($leader_id)->user_login.'</a> accept';
        } else {
            $insert_members_watting = $wpdb->insert(
                "{$wpdb->prefix}request",
                [
                    'form_id' => $form_id,
                    'member_id' => get_current_user_id(),
                ]
            );
            if ($insert_members_watting) {
                $message = 'Waitting <a href="'.home_url('user').'?user-id='.$leader_id.'" >'.get_userdata($leader_id)->user_login.'</a> accept';
            }
        }
    }

    return $message;
}

function limitRequest($form_id)
{
    global $wpdb;
    $count = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}request 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".get_current_user_id()."'
    ");
    if ($count > 3) {
        return true;
    }

    return false;
}

function actionJoinForm($form_id, $user_id)
{
    $form_major = user_metadata('major', $user_id);
    $is_major = info('major');
    $status = checkStatusForm($form_id);
    $message = '';
    if (!is_user_logged_in()) {
        $message = 'error!!! login first.';

        return array('result' => false, 'message' => $message);
    } elseif (!$status) {
        $message = 'Sorry! Form closed. You can not join to this form.';

        return array('result' => false, 'message' => $message);
    } elseif (empty($is_major)) {
        $message = 'You need to update your major in profile first.';

        return array('result' => false, 'message' => $message);
    } elseif ($is_major !== $form_major) {
        $message = 'Your major have not the same major form.';

        return array('result' => false, 'message' => $message);
    }

    return array('result' => true);
}

function checkStatusForm($form_id)
{
    global $wpdb;
    $status = $wpdb->get_var("
SELECT status 
FROM {$wpdb->prefix}finder_form 
WHERE ID = '".$form_id."'
");
    if ($status == 1) {
        return true;
    }

    return false;
}

function user_metadata($meta_key, $user_id)
{
    global $wpdb;
    $user_info = $wpdb->get_var("
    SELECT meta_value
    FROM {$wpdb->prefix}usermetaData
    WHERE user_id = '".$user_id."'
    AND meta_key = '".$meta_key."'
    ");

    return $user_info;
}
