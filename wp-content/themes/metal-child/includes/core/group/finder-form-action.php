<?php

include 'includes/core/profile/gpf-profile.php';

function form_meta($key)
{
    global $wpdb;
    $form_id = has_form_id();
    $value = $wpdb->get_var("
    SELECT $key FROM {$wpdb->prefix}finder_form 
    where ID = '".$form_id."'
    ");

    return $value;
}

function manageRequest()
{
    global $wpdb;
    $form_id = has_form_id();
    $get_request = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}members
    where form_id = '".$form_id."'
    and status = 1
    ORDER BY joined_date DESC
    ");
    $is_leader = $wpdb->get_var("
    SELECT COUNT(*) FROM {$wpdb->prefix}members
    where form_id = '".$form_id."'
    and member_id = '".get_current_user_id()."'
    and member_role = 0
    ");
    $renderHtml = '';
    $renderHtml .= '<h3>Notification</h3>';
    $renderHtml .= '<div class="noti-message"></div><hr>';
    if ($is_leader == 1) {
        foreach ($get_request as $request) {
            $user_name = get_user_by('id', $request->member_id)->user_login;
            $renderHtml .= '<div class="request-items">';
            $renderHtml .= '<div class="content-request">';
            $renderHtml .= '<p><a href="#">'.$user_name.'</a>';
            $renderHtml .= ' want join in to project <b>'.form_meta('title').'</b></p></div>';
            $renderHtml .= '<div class="button-request">';
            $renderHtml .= '<button type="submit" id="acxept-user" class="btn btn-sm btn-info">access</button>';
            $renderHtml .= '<button type="submit" id="deny-user" class="btn btn-sm btn-info">deny</button></div>';
            $renderHtml .= '</div>';
        }
    }

    return $renderHtml;
}
//HUYLV
// 23/10 leader still access user although user have already joined in other form.

function accessRequest($user_id)
{
    global $wpdb;
    $message = '';
    $form_id = has_form_id();
    $user_name = get_userdata($user_id)->user_login;
    if (!checkUserExist($user_id)) {
        return array('result' => false, 'message' => $user_name.' have joined in other form.Can\'t access this member to group.');
    } else {
        $approve_member = $wpdb->update(
            "{$wpdb->prefix}members",
            [
                'status' => 0,
            ],
            [
                'form_id' => $form_id,
                'member_id' => $user_id,
            ]
        );
        if ($approve_member) {
            return array('result' => true, 'message' => 'Graduation !!! you have a new member.');
        } else {
            return array('result' => false, 'message' => 'insert failed.');
        }
    }
}

function checkUserExist($user_id)
{
    global $wpdb;

    $record = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}finder_form 
    WHERE user_id = '".$user_id."'
    ");
    if ($record == 1) {
        return false;
    }

    return true;
}
