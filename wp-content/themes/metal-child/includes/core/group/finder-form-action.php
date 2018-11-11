<?php

include 'includes/core/profile/gpf-profile.php';
require_once 'form-check.php';
function form_meta($key, $id)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT $key FROM {$wpdb->prefix}finder_form 
    where ID = '".$id."'
    ");

    return $value;
}
function get_request_via_leader($get_request, $request)
{
    $message = '';
    $button = '';
    $user_name = get_user_by('id', $get_request->member_id)->user_login;
    switch ($request) {
        case 0:
        $message = '<p>you have invited '.get_url('user', $get_request->member_id).$user_name.'</a>to join in to project <b>'.form_meta('title', $get_request->form_id).'</b></p>';
        $button = '<button type="submit" id="reject-invite-request" class="btn btn-sm btn-danger btn-sm">Cancel</button>';
        break;
        case 1:
        $message = '<p>'.get_url('user', $get_request->member_id).$user_name.'</a> want join in to project <b>'.form_meta('title', $get_request->form_id).'</b></p>';
        $button = '<button type="submit" id="acxept-user" class="btn btn-sm btn-info btn-sm">Access</button><button type="submit" id="deny-user" class="btn btn-sm btn-danger btn-sm">Deny</button>';
        break;
        default:
        break;
    }

    return array('message' => $message, 'button' => $button);
}

function get_request_via_users($get_request, $request)
{
    $message = '';
    $button = '';
    $user_name = get_user_by('id', $get_request->member_id)->user_login;
    switch ($request) {
        case 0:
        $message = '<p>'.get_url('user', form_meta('user_id', $get_request->form_id)).get_userdata(form_meta('user_id', $get_request->form_id))->user_login.'</a>
        want to invite you to join project '.get_url('form-detail', $get_request->form_id).form_meta('title', $get_request->form_id).'</a></p>';
        $button = '<button type="submit" id="join-in-form" class="btn btn-sm btn-info btn-sm">Join in</button><button type="submit" id="deny-join-in" class="btn btn-sm btn-danger btn-sm">Deny</button>';
        break;
        case 1:
        $message = '<p>You have send request to project :  '.get_url('form-detail', $get_request->form_id).form_meta('title', $get_request->form_id).'</a></p>';
        $button = '<button type="submit" id="cancel-request-join-form" class="btn btn-sm btn-danger btn-sm">Cancel</button>';
        break;
        default:
        break;
    }

    return array('message' => $message, 'button' => $button);
}
function manageRequest()
{
    global $wpdb;
    $is_leader = is_leader();
    $renderHtml = '';
    $renderHtml .= '<div class="noti-message"></div><hr>';
    if ($is_leader) {
        $form_id = has_form_id();
        $get_request = $wpdb->get_results("
        SELECT * 
        FROM {$wpdb->prefix}request 
        where form_id = '".$form_id."' 
        ORDER BY time_request DESC
        ");
        foreach ($get_request as $request) {
            $get_action = get_request_via_leader($request, $request->request);
            $renderHtml .= '<div class="request-items">';
            $renderHtml .= '<div class="content-request">';
            $renderHtml .= $get_action['message'];
            $renderHtml .= '</div>';
            $renderHtml .= '<div class="button-request">';
            $renderHtml .= $get_action['button'];
            $renderHtml .= '<input type="hidden" id="user-id" value="'.$request->member_id.'" /> </div>';
            $renderHtml .= '</div>';
        }
    } else {
        $get_request = $wpdb->get_results("
        SELECT * 
        FROM {$wpdb->prefix}request 
        WHERE member_id = '".get_current_user_id()."' 
        ORDER BY time_request DESC
        ");
        foreach ($get_request as $request) {
            $get_action = get_request_via_users($request, $request->request);
            $renderHtml .= '<div class="request-items">';
            $renderHtml .= '<div class="content-request">';
            $renderHtml .= $get_action['message'];
            $renderHtml .= '</div>';
            $renderHtml .= '<div class="button-request">';
            $renderHtml .= $get_action['button'];
            $renderHtml .= '<input type="hidden" id="user-id" value="'.$request->form_id.'" /> </div>';
            $renderHtml .= '</div>';
        }
    }

    return $renderHtml;
}
function get_url($key, $value)
{
    $renderHTML = '';
    switch ($key) {
    case 'user':
    $renderHTML = '<a href="'.home_url($key).'?user-id='.$value.'" class="btn btn-info btn-sm btn-user" >';

    break;
    case 'form-detail':
    $renderHTML = '<a href="'.home_url($key).'?form-id='.$value.'" >';
    break;
}

    return $renderHTML;
}
function is_leader()
{
    global $wpdb;
    $form_id = has_form_id();
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
    $remove_request = removeRequest($form_id, $user_id);
    $form_exist = isFormExist($user_id);
    if ($remove_request) {
        if ($form_exist) {
            return array('result' => false, 'message' => $user_name.' have already team.Reject request!!');
        } else {
            $approve_member = $wpdb->insert(
                    "{$wpdb->prefix}members",
                    [
                        'form_id' => $form_id,
                        'member_id' => $user_id,
                        'member_role' => 1,
                    ]
                );
            if ($approve_member) {
                return array('result' => true, 'message' => 'Graduation !!! you have a new member');
            } else {
                return array('result' => false, 'message' => 'approve user failed');
            }
        }
    } else {
        return array('result' => false, 'message' => 'approve user failed');
    }
}

function rejectRequest($user_id)
{
    $form_id = has_form_id();
    removeRequest($form_id, $user_id);
    if (removeRequest($form_id, $user_id)) {
        return true;
    } else {
        return false;
    }
}

function user_access_request($form_id)
{
    global $wpdb;
    $user_id = get_current_user_id();
    $form_exist = isFormExist($user_id);
    if ($form_exist) {
        return array('result' => false, 'message' => 'You have already team.Reject request!!');
    } else {
        if (removeRequest($form_id, $user_id)) {
            if (userInformation('major', $user_id) == 'Student') {
                $approve_member = $wpdb->insert(
                    "{$wpdb->prefix}members",
                    [
                        'form_id' => $form_id,
                        'member_id' => $user_id,
                        'member_role' => 1,
                    ]
                );
            } else {
                $approve_member = $wpdb->insert(
                    "{$wpdb->prefix}members",
                    [
                        'form_id' => $form_id,
                        'member_id' => $user_id,
                        'member_role' => 2,
                    ]
                );
            }
        } else {
            return array('result' => false, 'message' => 'join in  failed');
        }

        if ($approve_member) {
            return array('result' => true, 'message' => 'Join in success');
        } else {
            return array('result' => false, 'message' => 'join in  failed');
        }
    }
}
function isFormExist($user_id)
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
        return true;
    }

    return false;
}

function removeRequest($form_id, $user_id)
{
    global $wpdb;

    $remove_request = $wpdb->delete(
    "{$wpdb->prefix}request",
    [
        'form_id' => $form_id,
         'member_id' => $user_id,
    ]
    );
    if ($remove_request) {
        return true;
    }

    return false;
}
function get_member_list()
{
    global $wpdb;
    $form_id = check_student_form();
    $is_leader = is_leader($form_id);
    $renderHTML = '';
    $get_member = get_all_member($form_id);
    $renderHTML .= '<div class="member-message"></div>';
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
            if ($member_role == 'Student') {
                $renderHTML .= '<button id="change-admin" class="btn btn-info btn-sm" >set to leader</button>';
                $renderHTML .= '<button id="kick-out" class="btn btn-danger btn-sm" >remove from group</button>';
            } elseif ($member_role == 'Supervisor') {
                $renderHTML .= '<button id="infor-view" class="btn btn-info btn-sm" >View</button>';
            }
        } else {
            $renderHTML .= '<button id="infor-view" class="btn btn-info btn-sm" >View</button>';
        }
        $renderHTML .= '</td>';
        $renderHTML .= '</tr>';
    }

    $renderHTML .= '</table>';

    return $renderHTML;
}
function get_all_member($form_id)
{
    global $wpdb;
    $get_member = $wpdb->get_results("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."' 
    ");

    return $get_member;
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
    $remove_leader = $wpdb->update(
        "{$wpdb->prefix}members",
        [
            'member_role' => 1,
        ],
        [
            'form_id' => $form_id,
            'member_id' => $leader_id,
        ]
    );
    $set_leader = $wpdb->update(
            "{$wpdb->prefix}members",
            [
                'member_role' => 0,
            ],
            [
                'form_id' => $form_id,
                'member_id' => $member_id,
            ]
        );
    $member_name_leader = get_userdata($member_id)->user_login;
    if ($set_leader && $remove_leader) {
        return $member_name_leader.' become new leader in your group';
    } else {
        return 'Set new leader false!';
    }
}

function get_leader_id($form_id)
{
    global $wpdb;
    $leader_id = $wpdb->get_var("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_role = 0
    ");

    return $leader_id;
}

//LONGTT
// Remove member in group
function remove_member($member_id)
{
    global $wpdb;
    $form_id = check_student_form();
    $remove_member = $wpdb->query("
    DELETE FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_id = '".$member_id."'
    ");
    $member_name_remove = get_userdata($member_id)->user_login;
    if ($remove_member) {
        return 'Removed '.$member_name_remove.' successful!';
    } else {
        return 'Removed false!';
    }
}

//valid limit member in finder form
function is_max_member($form_id)
{
    global $wpdb;

    $count_mem = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_role = 1 
    ");

    if ($count_mem >= 5) {
        return false;
    }

    return true;
}

function closeForm()
{
    global $wpdb;
    $form_id = check_student_form();
    $close = $wpdb->update(
    "{$wpdb->prefix}finder_form",
    [
        'status' => 0,
    ],
    [
        'ID' => $form_id,
    ]
);
}
function reopenFinderForm()
{
    global $wpdb;
    $form_id = check_student_form();
    $close = $wpdb->update(
    "{$wpdb->prefix}finder_form",
    [
        'status' => 1,
    ],
    [
        'ID' => $form_id,
    ]
);
}

function updateFinderForm($title, $description, $other, $contact, $semester, $close_date)
{
    global $wpdb;
    $form_id = has_form_id();
    $update_form_finder = $wpdb->update(
        "{$wpdb->prefix}finder_form",
        [
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'contact' => $contact,
            'semester' => $semester,
            'due_date' => $close_date,
        ],
        [
            'ID' => $form_id,
        ]
    );
    if ($update_form_finder) {
        return 'Update success!';
    } else {
        return 'Update failed. Have no something change !!!!';
    }
}
function major($user_id)
{
    global $wpdb;
    $name = userInformation('major', $user_id);
    $major_id = $wpdb->get_var("
    SELECT ID 
    FROM {$wpdb->prefix}major 
    WHERE name = '".$name."'
    ");

    return $major_id;
}
function searchUsers($keyword)
{
    global $wpdb;
    $renderHTML = '';

    $results = $wpdb->get_results("
    SELECT ID 
    FROM {$wpdb->prefix}users 
    WHERE user_login LIKE '%".$keyword."%' 
    AND ID != '".get_current_user_id()."'
    AND ID != 1 
    ");
    $renderHTML .= '<div class="result-search">';
    if (empty($results)) {
        $renderHTML .= '<p>User <b>'.$keyword.'</b> doesn\'t exist !!!</p>';
    } else {
        $renderHTML .= '<div class="member-message"></div>';
        $renderHTML .= '<table id="result_list_users">';
        $renderHTML .= '<tr><th>Role</th><th>User name</th><th>Major</th><th>Action</th></tr>';

        foreach ($results as $result) {
            $user_major = userInformation('major', $result->ID);
            $user_role = userInformation('role', $result->ID);
            $renderHTML .= '<tr><td>'.$user_role.'</td><td>'.get_userdata($result->ID)->user_login.'</td><td>'.$user_major.'</td>';
            $renderHTML .= '<td><div class="btn-group-invite">'.get_view_action_search($result->ID).'<input type="hidden" id="user-id" value="'.$result->ID.'" /></div></td>';
            $renderHTML .= '</tr>';
        }
        $renderHTML .= '</table>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}

function actionInSearch($user_id)
{
    global $wpdb;
    $renderHTML = '';
    $form_id = has_form_id();
    $members_role = $wpdb->get_var("
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
        if ($members_role) {
            $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
        } else {
            if ($user_role == 'Student') {
                if ($user_major == $form_major) {
                    $renderHTML = '<button id="action-invite-student" class="btn btn-primary btn-sm">Invite student</button>';
                } else {
                    $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.' class="btn btn-info">View</a>';
                }
            } else {
                $renderHTML = '<button  id="action-invite-student" class="btn btn-primary btn-sm">Invite supervisor</button>';
            }
        }
    } else {
        $renderHTML = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
    }

    return $renderHTML;
}

function get_view_action_search($user_id)
{
    global $wpdb;
    $renderHTML = '';
    $form_id = has_form_id();
    $check_request_exist = $wpdb->get_var("
        SELECT * FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND member_id = '".$user_id."'
        AND request = 0
        ");
    if ($check_request_exist) {
        $renderHTML = '<button id="cancel-invite-user" class="btn-danger btn btn-sm">Cancel</button>';
    } else {
        $renderHTML = actionInSearch($user_id);
    }

    return $renderHTML;
}
function re_action_invite_student($user_id)
{
    global $wpdb;
    $form_id = has_form_id();
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
            $button = '<button id="action-invite-student" class="btn btn-primary btn-sm">Invite student</button>';

            return array('result' => true, 'message' => 'reject request success ', 'button' => $button);
        } else {
            return array('result' => false, 'message' => 'reject request failed');
        }
    } else {
        return array('result' => false, 'message' => 'request have not exist');
    }
}
function action_invite_user($user_id)
{
    global $wpdb;
    $is_form = check_form_exist($user_id);
    $form_id = has_form_id();
    if ($is_form) {
        if (has_request($form_id, $user_id)) {
            $check_request_exist = $wpdb->get_var("
        SELECT * FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND user_id = '".$user_id."'
        AND request = 0
        ");
            if ($check_request_exist) {
                $cancel_request = '<button id="cancel-invite-user" class="btn-danger btn btn-sm">Cancel</button>';

                return array('result' => true, 'message' => 'waiting <b>'.get_userdata($user_id)->user_login.' </b>confirm', 'button' => $cancel_request);
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
                        'user_id' => $user_id,
                    ]
                    );
                if ($user_join_in) {
                    $button_view = '<a href="'.home_url('user').'?>user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
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
                $cancel_request = '<button id="cancel-invite-user" class="btn-danger btn btn-sm">Cancel</button>';

                return array('result' => true, 'message' => 'waiting <b>'.get_userdata($user_id)->user_login.' </b>confirm', 'button' => $cancel_request);
            } else {
                return array('result' => false, 'message' => 'invite user failed');
            }
        }
    } else {
        return array('result' => false, 'message' => get_userdata($result->ID)->user_login.'have already group !!!');
    }
}

function userInformation($meta_key, $user_id)
{
    global $wpdb;
    $user_info = $wpdb->get_results("
SELECT *
FROM {$wpdb->prefix}usermetaData
WHERE user_id = '".$user_id."'
");
    switch ($meta_key) {
case 'username':
    return $user_info[0]->meta_value;
    break;
case 'gender':
    return $user_info[1]->meta_value;
    break;
case 'address':
    return $user_info[2]->meta_value;
    break;
case 'phone':
    return $user_info[3]->meta_value;
    break;
case 'role':
    $role = $user_info[4]->meta_value;
    switch ($role) {
        case 1:
            return 'Student';
            break;
        case 0:
            return 'Teacher';
            break;
    }
    break;
case 'major':
    return $user_info[5]->meta_value;
    break;
case 'email':
    return $user_info[6]->meta_value;
    break;
case 'biography':
    return $user_info[7]->meta_value;
    break;
default:
    return $user_info;
}
}
