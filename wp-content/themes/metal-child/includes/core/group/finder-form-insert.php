<?php

function has_major()
{
    $current_major = info('major');
    if (empty($current_major)) {
        return array('result' => false, 'message' => '<div class="message-fail">You need to have a major to post Finder form, go to profile to update your major.</div>');
    }

    return array('result' => true);
}
function insert_finder_form($semester, $title, $description, $other, $contact, $user_id)
{
    global $wpdb;
    $has_form = has_form_id();
    if ($has_form) {
        return false;
    } else {
        $get_finder_form = $wpdb->insert(
            "{$wpdb->prefix}finder_form",
            [
                'user_id' => get_current_user_id(),
                'semester' => $semester,
                'title' => $title,
                'description' => $description,
                'other_skill' => $other,
                'contact' => $contact,
                'status' => 1,
            ]
        );
    }
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

function insert_group($form_id, $group_type)
{
    global $wpdb;
    $get_group = $wpdb->insert(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
            'type' => $group_type,
        ]
    );
    if ($get_group) {
        return true;
    } else {
        return false;
    }
}
function create_group_finder_chat($form_id, $title)
{
    global $wpdb;
    $set_group_chat = $wpdb->insert(
        "{$wpdb->prefix}group_chat",
        [
            'form_id' => $form_id,
            'name' => $title,
        ]
    );
    if ($set_group_chat) {
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

function sendRequest($form_id, $leader_id, $request_message, $postion)
{
    global $wpdb;
    $message = '';
    if (limitRequest($form_id)) {
        $message = 'You can send request maximum 3 form !!!';
    } else {
        if (has_request($form_id, get_current_user_id())) {
            $get_request = $wpdb->get_var("
            SELECT *
            FROM {$wpdb->prefix}request 
            WHERE form_id = '".$form_id."' 
            AND member_id = '".get_current_user_id()."'
            AND request = 1
            ");
            if (isset($get_request)) {
                $message = 'Thanks for joining us, we will contact you soon .';
            } else {
                $user_join_in = $wpdb->insert(
                    "{$wpdb->prefix}members",
                    [
                        'form_id' => $form_id,
                        'member_id' => get_current_user_id(),
                        'member_role' => 1,
                    ]
                );
                $delete_request = $wpdb->delete(
                    "{$wpdb->prefix}request",
                    [
                        'form_id' => $form_id,
                        'member_id' => get_current_user_id(),
                    ]
                    );
                if ($user_join_in) {
                    $message = '<a href="'.home_url('user').'?user-id='.$leader_id.'" >'.get_userdata($leader_id)->user_login.'</a> have invited you to joined in group. You will join in group now.';
                }
            }
        } else {
            $user_set_request = $wpdb->insert(
                "{$wpdb->prefix}request",
                [
                    'form_id' => $form_id,
                    'member_id' => get_current_user_id(),
                    'request' => 1,
                    'message' => $request_message,
                    'postion' => $postion,
                ]
            );
            if ($user_set_request) {
                $message = 'Thanks for joining us, we will contact you soon .';
            }
        }
    }

    return $message;
}
function has_request($form_id, $user_id)
{
    global $wpdb;
    $check = $wpdb->get_var("
    SELECT *
    FROM {$wpdb->prefix}request 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$user_id."'
    ");
    if ($check) {
        return true;
    }

    return false;
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
    $has_form = check_student_form();
    $message = '';
    $form_type = is_form_type($form_id);
    if (!$status) {
        $message = 'Sorry! Form closed. You can not join to this form.';

        return array('result' => false, 'message' => $message);
    } elseif (empty($is_major)) {
        $message = 'You need to update your major in profile first.';

        return array('result' => false, 'message' => $message);
    } elseif ($is_major !== $form_major) {
        $message = 'Your major must be the same major form.';

        return array('result' => false, 'message' => $message);
    } elseif ($has_form && $form_type == 'Student') {
        $message = 'You have already joined in student group.';

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
function is_form_type($form_id)
{
    global $wpdb;
    $type = $wpdb->get_var("
    SELECT type  
    FROM {$wpdb->prefix}groups 
    WHERE form_id = '".$form_id."'
    ");

    return $type;
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
