<?php

include 'includes/core/group/finder-form-action.php';

function approve_request($form_id, $user_id, $type)
{
    global $wpdb;
    $message = '';
    switch ($type) {
        case 0:
        removeRequest($form_id, $user_id);
        if (removeRequest($form_id, $user_id)) {
            return true;
        } else {
            return false;
        }
        break;
        case 1:
        $user_name = get_userdata($user_id)->user_login;
        $remove_request = removeRequest($form_id, $user_id);
        if ($remove_request) {
            $approve_member = $wpdb->insert(
                        "{$wpdb->prefix}members",
                        [
                            'form_id' => $form_id,
                            'member_id' => $user_id,
                            'member_role' => 1,
                        ]
                    );
            if ($approve_member) {
                return array('result' => true, 'message' => '<div class="message-success"> Graduation !!! you have a new member </div>');
            } else {
                return array('result' => false, 'message' => '<div class="message-fail"> Approve user failed</div>');
            }
        } else {
            return array('result' => false, 'message' => '<div class="message-fail">Approve user failed<div>');
        }
        break;
    }
}

function search_student_via_teacher($keyword, $form_id)
{
    global $wpdb;
    $renderHTML = '';

    $results = $wpdb->get_results("
    SELECT user.ID
    FROM {$wpdb->prefix}users as user
    JOIN 
    (SELECT * FROM {$wpdb->prefix}usermetaData 
    WHERE meta_key = 'role' AND meta_value = 1 ) as u
    ON user.ID = u.user_id
    WHERE user.user_login LIKE '%".$keyword."%' 
    ");
    $renderHTML .= '<div class="result-search">';
    if (empty($results)) {
        $renderHTML .= '<p>User <b>'.$keyword.'</b> doesn\'t exist !!!</p>';
    } else {
        $renderHTML .= '<div class="member-message"></div>';
        $renderHTML .= '<table id="result_list_users" class="table-striped">';
        $renderHTML .= '<tr><th>Role_ID</th><th>User name</th><th>Major</th><th>Action</th></tr>';
        foreach ($results as $result) {
            $user_name = $wpdb->get_var("
            SELECT meta_value FROM {$wpdb->prefix}usermetaData 
            WHERE meta_key = 'username' AND user_id = '".$result->ID."'
            ");
            $user_major = userInformation('major', $result->ID);
            $user_role = userInformation('role', $result->ID);
            $renderHTML .= '<tr><td>'.get_userdata($result->ID)->user_login.'</td><td>'.$user_name.'</td><td>'.$user_major.'</td>';
            $renderHTML .= '<td><div class="btn-group-invite">'.get_view_action_search_via_teacher($result->ID, $form_id).'<input type="hidden" id="user-id" value="'.$result->ID.'" /></div></td>';
            $renderHTML .= '</tr>';
        }
        $renderHTML .= '</table>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}
function get_view_action_search_via_teacher($user_id, $form_id)
{
    global $wpdb;
    $renderHTML = '';
    $check_request_exist = $wpdb->get_var("
        SELECT * FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND member_id = '".$user_id."'
        AND request = 0
        ");
    if ($check_request_exist) {
        $renderHTML = '<button id="cancel-invite-user-via-teacher" class="btn-danger btn btn-sm">Cancel</button>';
    } else {
        $renderHTML = action_search_via_teacher($user_id, $form_id);
    }

    return $renderHTML;
}
function action_search_via_teacher($user_id, $form_id)
{
    global $wpdb;
    $renderHTML = '';
    $members_is_exist = $wpdb->get_var("
    SELECT *
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    AND member_id = '".$user_id."' 
    ");
    $is_leader = get_leader_id($form_id);
    $user_role = userInformation('role', $user_id);
    $user_major = userInformation('major', $user_id);
    if ($is_leader == get_current_user_id()) {
        $form_major = userInformation('major', $is_leader);
        if ($members_is_exist) {
            $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
        } else {
            if ($user_major == $form_major) {
                $renderHTML = '<button id="action-invite-via-teacher" class="btn btn-primary btn-sm">Invite</button>';
            } else {
                $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
            }
        }
    } else {
        $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
    }

    return $renderHTML;
}
function action_invite_user_via_teacher($user_id, $form_id)
{
    global $wpdb;
    if (has_request($form_id, $user_id)) {
        $check_request_exist = $wpdb->get_var("
        SELECT * FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND user_id = '".$user_id."'
        AND request = 0
        ");
        if ($check_request_exist) {
            $cancel_request = '<button id="cancel-invite-user-via-teacher" class="btn-danger btn btn-sm">Cancel</button>';

            return array('result' => true, 'message' => '<div class="message-success">Waiting <b>'.get_userdata($user_id)->user_login.' </b>confirm</div>', 'button' => $cancel_request);
        } else {
            if (userInformation('role', $user_id) == 'Student') {
                $user_join_in = $wpdb->insert(
                        "{$wpdb->prefix}members",
                        [
                            'form_id' => $form_id,
                            'member_id' => $user_id,
                            'member_role' => 1,
                        ]
                    );
            } elseif (userInformation('role', $user_id) == 'Student') {
                $user_join_in = $wpdb->insert(
                        "{$wpdb->prefix}members",
                        [
                            'form_id' => $form_id,
                            'member_id' => $user_id,
                            'member_role' => 2,
                        ]
                    );
            }

            $delete_request = $wpdb->delete(
                    "{$wpdb->prefix}request",
                    [
                        'form_id' => $form_id,
                    ]
                    );
            if ($user_join_in) {
                $button_view = '<a href="'.home_url('user').'?user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
                $message = '<a href="'.home_url('user').'?user-id='.$user_id.'" >'.get_userdata($user_id)->user_login.'</a> have send request to joined in group. 
                    <a href="'.home_url('user').'?user-id='.$user_id.'" >'.get_userdata($user_id)->user_login.'</a> will join in group now';
            }

            return array('result' => true, 'message' => $message, 'button' => $button_view);
        }
    } else {
        $make_request = $wpdb->insert(
                "{$wpdb->prefix}request",
                [
                    'form_id' => $form_id,
                    'member_id' => $user_id,
                    'request' => 0,
                ]
            );
        if ($make_request) {
            $cancel_request = '<button id="cancel-invite-user-via-teacher" class="btn-danger btn btn-sm">Cancel</button>';

            return array('result' => true, 'message' => '<div class="message-success">Waiting <b>'.get_userdata($user_id)->user_login.' </b>confirm</div>', 'button' => $cancel_request);
        } else {
            return array('result' => false, 'message' => 'invite user failed');
        }
    }
}

function re_action_invite_via_teacher($form_id, $user_id)
{
    global $wpdb;
    $check_request_exist = $wpdb->get_var("
        SELECT * FROM {$wpdb->prefix}request
        WHERE form_id = '".$form_id."' 
        AND member_id = '".$user_id."'
        AND request = 0
        ");
    if ($check_request_exist) {
        $delete_request = $wpdb->delete(
            "{$wpdb->prefix}request",
            [
                'form_id' => $form_id,
                'member_id' => $user_id,
            ]
            );
        if ($delete_request) {
            $button = '<button id="action-invite-via-teacher" class="btn btn-primary btn-sm">Invite</button>';

            return array('result' => true, 'message' => '<div class="message-fail">reject request success</div>', 'button' => $button);
        } else {
            return array('result' => false, 'message' => '<div class="message-fail">reject request failed</div>');
        }
    } else {
        return array('result' => false, 'message' => '<div class="message-fail">request have not exist</div>');
    }
}
