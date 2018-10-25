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
    $is_leader = is_leader($form_id);
    $renderHtml = '';
    $renderHtml .= '<h3>Notification</h3>';
    $renderHtml .= '<div class="noti-message"></div><hr>';
    if ($is_leader) {
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

function is_leader($form_id)
{
    global $wpdb;
    $is_leader = $wpdb->get_var("
    SELECT COUNT(*) FROM {$wpdb->prefix}members
    where form_id = '".$form_id."'
    and member_id = '".get_current_user_id()."'
    and member_role = 0
    ");
    if ($is_leader == 1) {
        return true;
    }

    return false;
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
function get_member_list()
{
    global $wpdb;
    $form_id = check_student_form();
    $is_leader = is_leader($form_id);
    $renderHTML = '';
    $get_member = $wpdb->get_results("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    ");
    $renderHTML .= '<table><tr><th>Name</th><th>role</th><th>action</th></tr>';
    foreach ($get_member as $member_id) {
        $member_name = get_userdata($member_id->member_id)->user_login;
        $member_role = get_role_form($form_id, $member_id->member_id);
        $renderHTML .= '<tr class="member-item">';
        $renderHTML .= '<input type="hidden" name="user-id" id="user-id" value="'.$member_id->member_id.'" />';
        $renderHTML .= '<td><a href="#">'.$member_name.'</a></td>';
        $renderHTML .= '<td>'.$member_role.'</td>';
        $renderHTML .= '<td class="method-action">';
        if ($is_leader) {
            if ($member_role != 'Leader') {
                $renderHTML .= '<button id="change-admin">set to leader</button>';
                $renderHTML .= '<button id="kick-out" >remove from group</button>';
            }
        } else {
            $renderHTML .= '<button id="infor-view" >View</button>';
        }
        $renderHTML .= '</td>';
        $renderHTML .= '</tr>';
    }

    $renderHTML .= '</table>';

    return $renderHTML;
}

function get_role_form($form_id, $member_id)
{
    global $wpdb;
    $member_role = $wpdb->get_var("
    SELECT member_role 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$member_id."'
    ");
    if ($member_role == 0) {
        return 'Leader';
    } elseif ($member_role == 1) {
        return 'Member';
    } elseif ($member_role == 2) {
        return 'Supervisor';
    }
}

//LONGTT
//Change leader of group 
function set_new_leader($member_id)
{
    global $wpdb;
    $form_id = check_student_form();
    $leader_id = get_leader_id($form_id);
    $set_leader = $wpdb->update(
        "{$wpdb->prefix}item_by_day",
        [
            "member_role" => 1
        ],
        [
            "form_id" => $form_id,
            "member_id" => $member_id
        ]
    );
    $remove_leader = $wpdb->update(
        "{$wpdb->prefix}item_by_day",
        [
            "member_role" => 0
        ],
        [
            "form_id" => $form_id,
            "member_id" => $$leader_id 
        ]
    );
    if($set_leader && $remove_leader) return true;
    else return false;
}

function get_leader_id($form_id){
    global $wpdb;
    $leader_id = $wpdb->get_var("
    SELECT member_id 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_role = 1
    ");
    return $leader_id;
}

//LONGTT
//Remove member in group
function remove_member($member_id)
{
    global $wpdb;
    $form_id = check_student_form();
    $remove_member = $wpdb->query("
    DELETE FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$member_id."'
    ");
    if(remove_member) return true;
    else return false;
}