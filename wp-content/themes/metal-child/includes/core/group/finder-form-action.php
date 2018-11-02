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
    SELECT * 
    FROM {$wpdb->prefix}request 
    where form_id = '".$form_id."' 
    ORDER BY time_request DESC
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
                return array('result' => true, 'message' => 'Graduation !!! you have a new member.');
            } else {
                return array('result' => false, 'message' => 'insert failed.');
            }
        }
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

    $remove_request = $wpdb->query("
    DELETE FROM {$wpdb->prefix}request 
    WHERE form_id = '".$form_id."' 
    AND member_id = '".$user_id."'
    ");
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
            if ($member_role != 'Leader') {
                $renderHTML .= '<button id="change-admin" class="btn btn-info btn-sm" >set to leader</button>';
                $renderHTML .= '<button id="kick-out" class="btn btn-danger btn-sm" >remove from group</button>';
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

function updateFinderForm()
{
    global $wpdb;
    $form_id = has_form_id();
    $update_form_finder = update(
        "{$wpdb->prefix}finder_form",
        [
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'contact' => $contact,
            'expiry_date' => $close_date,
        ],
        [
            'ID' => $form_id,
        ]
    );
    if ($update_form_finder) {
        return 'Update Finder form success!';
    } else {
        return 'update fail';
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
    $major =
    $renderHTML .= '<div class="result-search">';
    if (empty($results)) {
        $renderHTML .= '<b>'.$keyword.'</b> not found!!!';
    } else {
        $renderHTML .= '<table>';
        $renderHTML .= '<tr><th>Role</th><th>User name</th><th>Major</th><th>Action</th></tr>';

        foreach ($results as $result) {
            $user_role = userInformation('role', $result->ID);
            $user_major = userInformation('major', $result->ID);
            $renderHTML .= '<tr><td>'.$user_role.'</td><td>'.get_userdata($result->ID)->user_login.'</td><td>'.$user_major.'</td>';
            if ($user_role == 'Teacher') {
                $renderHTML .= '<td></td>';
            } else {
                if ($user_major == '' || major(get_current_user_id()) != major($result->ID)) {
                    $renderHTML .= '<td><a href="'.home_url('user').'?user-id='.$result->ID.' " class="btn" ></a>View</td>';
                } else {
                }
            }
            $renderHTML .= '</tr>';
        }
        $renderHTML .= '</table>';
    }
    $renderHTML .= '</div>';

    return $renderHTML;
}
// check các trường hợp :
// th1: user đã tồn tại trong nhóm
// th2: user chưa tồn tại trong nhóm
// th2-1: user là student
// th2-2: user là teacher

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
    $user_role = userInformation('role', $user_id);
    if ($members_role) {
        $renderHTML .= '<a href="'.home_url('user').'?>user-id='.$user_id.' class="btn btn-info">View</a>';
    } else {
        if ($user_role == 'Student') {
            $renderHTML .= '<button type="submit" id="action-invite-student" class="btn btn-primary">Invite student</button>';
        } else {
            $renderHTML .= '<button type="submit" id="action-invite-student" class="btn btn-primary">Invite supervisor</button>';
        }
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
        case 2:
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
