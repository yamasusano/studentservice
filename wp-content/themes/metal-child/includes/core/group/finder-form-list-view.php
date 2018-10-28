<?php

include 'includes/core/profile/gpf-profile.php';
include 'includes/core/group/finder-form-action.php';
function get_list_form()
{
    global $wpdb;
    $currPage = get_query_var('page', 1);
    if ($currPage === 0) {
        $paged = 1;
    } else {
        $paged = $currPage;
    }
    $start = ($paged - 1) * 10;
    $count = $start + 1;

    $list_view = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}finder_form 
    ORDER BY status DESC
    LIMIT $start, 10 ");
    $suppervisor = '';
    $renderHTML = '';
    $renderHTML .= '<table>
    <tr>
        <th class="col-lg-1">Poster</th>
        <th class="col-lg-4">Title</th>
        <th class="col-lg-1">Members avaialbe</th>
        <th class="col-lg-2">Skill</th>
        <th class="col-lg-2">Contact</th>
        <th class="col-lg-1">Close</th>
        <th class="col-lg-1">Status</th>
    </tr>';
    $renderHTML .= '</table>';
    foreach ($list_view as $view) {
        $renderHTML .= '<form action="#" method="POST"><table>';
        $renderHTML .= '<input type="hidden" id="form-id" name="form-id" value="'.$view->ID.'" />';
        $renderHTML .= '<input type="hidden" id="user-id" name="user-id" value="'.$view->user_id.'" />';
        $renderHTML .= '<tr>';
        $renderHTML .= '<td class="col-lg-1"><p><a href="'.home_url('user').'?user-id='.$view->user_id.'"> '.get_userdata($view->user_id)->user_login.'</a></p></td>';
        $renderHTML .= '<td class="col-lg-4"><a href="'.home_url('form-detail').'?form-id='.$view->ID.'" >'.$view->title.'</a><div class="col-lg-12">'.$view->description.'</div></td>';
        $renderHTML .= '<td class="col-lg-1"><p>'.get_members($view->ID).'</p></td>';
        $renderHTML .= '<td class="col-lg-2">'.get_list_skill($view->ID, $view->other_skill).'</td>';
        $renderHTML .= '<td class="col-lg-2"><p>'.$view->contact.'</p></td>';
        $renderHTML .= '<td class="col-lg-1"><p>'.$view->expiry_date.'</p></td>';
        $renderHTML .= '<td class="col-lg-1">'.statusForm($view->ID, $view->status).'</td>';
        $renderHTML .= '</tr></table></form>';
    }

    return $renderHTML;
}

function get_list_skill($form_id, $other_skill)
{
    global $wpdb;
    $renderHTML = '';
    $define = array(',', '.', ';');
    $skills = $wpdb->get_results("
    SELECT name FROM {$wpdb->prefix}skill_major as s 
    INNER JOIN {$wpdb->prefix}form_skill as f 
    ON s.ID = f.skill_id 
    WHERE f.form_id = '".$form_id."'

    ");

    foreach ($skills as $skill) {
        $renderHTML .= $skill->name.'<br>';
    }
    $check = false;
    foreach ($define as $char) {
        if (strpos($other_skill, $char)) {
            $skills = explode($char, $other_skill);
            foreach ($skills as $skill) {
                if (isset($skill)) {
                    $renderHTML .= $skill.'<br>';
                }
            }
        } else {
            $check = false;
        }
    }
    if ($check) {
        $renderHTML .= $other_skill;
    }

    return $renderHTML;
}
function get_members($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $members_id = $wpdb->get_results("
    SELECT member_id 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    AND member_role = 1 
    ");
    foreach ($members_id as $members) {
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" >'.get_userdata($members->member_id)->user_login.'</a><br>';
    }

    return $renderHTML;
}

function statusForm($form_id, $status)
{
    $renderHTML = '';
    switch ($status) {
        case 0:
            $renderHTML .= 'Closed';
        break;
        case 1:
        $renderHTML .= currentUserPost($form_id);
        break;
        default:
            $renderHTML = '';
        break;
    }

    return $renderHTML;
}
function currentUserPost($form_id)
{
    global $wpdb;
    $rennderHTML = '';
    if (is_user_logged_in()) {
        $current_user = get_current_user_id();
        $is_student = info('role');
        $has_form = check_student_form();
        $is_request = $wpdb->get_var("
        SELECT COUNT(*) 
        FROM {$wpdb->prefix}request 
        WHERE form_id = '".$form_id."' 
        AND member_id = '".$current_user."'
        ");

        if ($is_student == 'Student') {
            if (isset($has_form)) {
                $renderHTML .= '<a href="'.home_url('form-detail').'?form-id='.$form_id.'" class="btn btn-info">View</a>';
            } else {
                if ($is_request >= 1) {
                    $renderHTML .= '<button type="submit" id="reject-action-join" name="reject-action-join" class="btn btn-danger" >Cancel request</button>';
                } else {
                    $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
                }
            }
        } else {
            $renderHTML .= '<a href="'.home_url('form-detail').'?form-id='.$form_id.'" class="btn btn-info">View</a>';
        }
    } else {
        $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
    }

    return $renderHTML;
}
