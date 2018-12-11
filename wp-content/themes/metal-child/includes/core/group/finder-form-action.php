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
        $user_name = '<td>'.get_url('user', $get_request->member_id).$user_name.'</a></td>';
        $project = '<td><b>'.form_meta('title', $get_request->form_id).'</b></td>';
        $message = '<td><p>'.$get_request->message.'</p></td>';
        $created = '<td>'.$get_request->time_request.'</td>';
        $button = '<td><div class="button-request"><button type="submit" id="reject-invite-request" class="btn btn-sm btn-danger btn-sm">Cancel</button>';
        $button .= '<input type="hidden" id="form-id" value="'.$get_request->form_id.'" /></div></td>';
        break;
        case 1:
        $user_name = '<td>'.get_url('user', $get_request->member_id).$user_name.'</a></td>';
        $project = '<td><b>'.form_meta('title', $get_request->form_id).'</b></td>';
        $message = '<td><p>'.$get_request->message.'</p></td>';
        $created = '<td>'.$get_request->time_request.'</td>';
        $button = '<td><div class="button-request"><button type="submit" id="acxept-user" class="btn btn-sm btn-info btn-sm">Access</button>';
        $button .= '<button type="submit" id="deny-user" class="btn btn-sm btn-danger btn-sm">Deny</button>';
        $button .= '<input type="hidden" id="form-id" value="'.$get_request->form_id.'" />';
        $button .= '<input type="hidden" id="user-id" value="'.$get_request->member_id.'" /></div></td>';
        break;
        default:
        break;
    }

    return array('message' => $message, 'button' => $button, 'user' => $user_name, 'project' => $project, 'created' => $created);
}

function get_request_via_users($get_request, $request)
{
    $message = '';
    $button = '';
    $user_name = get_user_by('id', $get_request->member_id)->user_login;
    switch ($request) {
        case 0:
        $user_name = '<td>'.get_url('user', form_meta('user_id', $get_request->form_id)).get_userdata(form_meta('user_id', $get_request->form_id))->user_login.'</a></td>';
        $project = '<td><b>'.get_url('form-detail', $get_request->form_id).form_meta('title', $get_request->form_id).'</a></b></td>';
        $message = '<td><p>'.$get_request->message.'</p></td>';
        $created = '<td>'.$get_request->time_request.'</td>';
        $button = '<td><div class="button-request"><button type="submit" id="join-in-form" class="btn btn-sm btn-info btn-sm">Join in</button>';
        $button .= '<button type="submit" id="deny-join-in" class="btn btn-sm btn-danger btn-sm">Deny</button>';
        $button .= '<input type="hidden" id="form-id" value="'.$get_request->form_id.'" /> </div></td>';
        break;
        case 1:
        $user_name = '<td>'.get_url('user', form_meta('user_id', $get_request->form_id)).get_userdata(form_meta('user_id', $get_request->form_id))->user_login.'</a></td>';
        $project = '<td><b>'.get_url('form-detail', $get_request->form_id).form_meta('title', $get_request->form_id).'</a></b></td>';
        $message = '<td><p>'.$get_request->message.'</p></td>';
        $created = '<td>'.$get_request->time_request.'</td>';
        $button = '<td><div class="button-request"><button type="submit" id="cancel-request-join-form" class="btn btn-sm btn-danger btn-sm">Cancel</button>';
        $button .= '<input type="hidden" id="form-id" value="'.$get_request->form_id.'" /> </div></td>';
        break;
        default:
        break;
    }

    return array('message' => $message, 'button' => $button, 'user' => $user_name, 'project' => $project, 'created' => $created);
}
function get_list_request()
{
    global $wpdb;

    $get_request1 = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}request as r
    INNER JOIN {$wpdb->prefix}finder_form as f
    ON f.ID = r.form_id
    where f.user_id = '".get_current_user_id()."'
    ORDER BY time_request DESC
    ");
    $get_request2 = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}request 
    WHERE member_id = '".get_current_user_id()."' 
    ORDER BY time_request DESC
    ");
    $array = array_merge($get_request1, $get_request2);

    return $array;
}
function manageRequest()
{
    global $wpdb;
    $renderHtml = '';
    $renderHtml .= '<div class="noti-message"></div>';
    $renderHtml .= '<table class="table-striped">';
    $renderHtml .= '<tr><th>Receiver/Sender</th> <th>Project Name</th> <th>Message</th> <th>Date Created</th> <th>Status</th></tr>';
    $get_request = get_list_request();
    foreach ($get_request as $request) {
        $is_leader = is_leader($request->ID);
        if ($is_leader) {
            $get_action = get_request_via_leader($request, $request->request);
            $renderHtml .= '<tr>';
            $renderHtml .= $get_action['user'];
            $renderHtml .= $get_action['project'];
            $renderHtml .= $get_action['message'];
            $renderHtml .= $get_action['created'];
            $renderHtml .= $get_action['button'];
            $renderHtml .= '</tr>';
        } else {
            $get_action = get_request_via_users($request, $request->request);
            $renderHtml .= '<tr>';
            $renderHtml .= $get_action['user'];
            $renderHtml .= $get_action['project'];
            $renderHtml .= $get_action['message'];
            $renderHtml .= $get_action['created'];
            $renderHtml .= $get_action['button'];
            $renderHtml .= '</tr>';
        }
    }
    $renderHtml .= '</table>';

    return $renderHtml;
}
function get_url($key, $value)
{
    $renderHTML = '';
    switch ($key) {
    case 'user':
    $renderHTML = '<a href="'.home_url($key).'?user-id='.$value.'" >';
    break;
    case 'form-detail':
    $renderHTML = '<a href="'.home_url($key).'?form-id='.$value.'" >';
    break;
}

    return $renderHTML;
}
function is_leader($form_id)
{
    global $wpdb;
    $is_leader = $wpdb->get_var("
    SELECT * FROM {$wpdb->prefix}finder_form
    where ID = '".$form_id."'
    AND user_id = '".get_current_user_id()."'
    ");
    if ($is_leader) {
        return true;
    }

    return false;
}
//HUYLV
// 23/10 leader still access user although user have already joined in other form.

function accessRequest($form_id, $user_id)
{
    global $wpdb;
    $message = '';
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
                return array('result' => true, 'message' => '<div class="message-success"> Graduation !!! you have a new member </div>');
            } else {
                return array('result' => false, 'message' => '<div class="message-fail"> Approve user failed</div>');
            }
        }
    } else {
        return array('result' => false, 'message' => '<div class="message-fail">Approve user failed<div>');
    }
}

function rejectRequest($form_id)
{
    global $wpdb;

    $remove_request = $wpdb->delete(
    "{$wpdb->prefix}request",
    [
        'form_id' => $form_id,
    ]
    );
    if ($remove_request) {
        return true;
    } else {
        return false;
    }
}
function checkFormType($form_id)
{
    global $wpdb;
    $type = $wpdb->get_var("
    SELECT type 
    FROM {$wpdb->prefix}groups
    WHERE form_id = '".$form_id."'
    ");

    return $type;
}
function user_access_request($form_id)
{
    global $wpdb;
    $user_id = get_current_user_id();
    $form_exist = isFormExist($user_id);
    $form_type = checkFormType($form_id);
    if ($form_type == 'Student') {
        if ($form_exist) {
            return array('result' => false, 'message' => 'You have already team.Reject request!!');
        } else {
            if (removeRequest($form_id, $user_id)) {
                if (user_metadata('role', $user_id) == '1') {
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
    } else {
        if (removeRequest($form_id, $user_id)) {
            if (user_metadata('role', $user_id) == '1') {
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
    $renderHTML .= '<table class=""><tr><th>Name</th><th>role</th><th>action</th></tr>';
    foreach ($get_member as $member_id) {
        $member_name = get_userdata($member_id->member_id)->user_login;
        $member_role = get_role_form($form_id, $member_id->member_id);
        $renderHTML .= '<tr class="member-item">';
        $renderHTML .= '<input type="hidden" name="user-id" id="user-id" value="'.$member_id->member_id.'" />';
        $renderHTML .= '<td><a href="#">'.$member_name.'</a></td>';
        $renderHTML .= '<td>'.$member_role.'</td>';
        $renderHTML .= '<td class="method-action">';
        if ($is_leader) {
            if ($member_role == 'Member') {
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
    SELECT user_id
    FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
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

function updateFinderForm($title, $description, $other, $contact, $semester, $skill)
{
    global $wpdb;
    $form_id = has_form_id();
    $skills = explode(',', $skill);
    $update_form_finder = $wpdb->update(
        "{$wpdb->prefix}finder_form",
        [
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'contact' => $contact,
            'semester' => $semester,
        ],
        [
            'ID' => $form_id,
        ]
    );
    $reset_skill = $wpdb->delete(
    "{$wpdb->prefix}form_skill",
    [
        'form_id' => $form_id,
    ]
    );
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

    return '<div class="message-success">Update success!</div>';
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
    $has_form = $wpdb->get_var("
    SELECT m.form_id
    FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id
    WHERE member_id = '".$user_id."'
    AND g.type = 'Student'
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
                if (isset($has_form)) {
                    $renderHTML = '<a href="'.home_url('user').'?user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
                } else {
                    if ($user_major == $form_major) {
                        $renderHTML = '<button id="action-invite-student" class="btn btn-primary btn-sm">Invite student</button>';
                    } else {
                        $renderHTML = '<a href="'.home_url('user').'?user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
                    }
                }
            } else {
                $renderHTML = '<button  id="action-invite-student" class="btn btn-primary btn-sm">Invite supervisor</button>';
            }
        }
    } else {
        $renderHTML = '<a href="'.home_url('user').'?user-id='.$user_id.'" class="btn btn-info btn-sm">View</a>';
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
    $user_role = userInformation('role', $user_id);
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
            if ($user_role == 'Teacher') {
                $button = '<button id="action-invite-student" class="btn btn-primary btn-sm">Invite Supervisor</button>';
            } elseif ($user_role == 'Student') {
                $button = '<button id="action-invite-student" class="btn btn-primary btn-sm">Invite Student</button>';
            }

            return array('result' => true, 'message' => '<div class="message-fail">reject request success</div>', 'button' => $button);
        } else {
            return array('result' => false, 'message' => '<div class="message-fail">reject request failed</div>');
        }
    } else {
        return array('result' => false, 'message' => '<div class="message-fail">request have not exist</div>');
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
                } elseif (userInformation('role', $user_id) == 'Teacher') {
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

                return array('result' => true, 'message' => '<div class="message-success">Waiting <b>'.get_userdata($user_id)->user_login.' </b>confirm</div>', 'button' => $cancel_request);
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
