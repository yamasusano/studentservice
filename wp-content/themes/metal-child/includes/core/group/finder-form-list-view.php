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
        $renderHTML .= '<td class="col-lg-1"><p>'.get_userdata($view->user_id)->user_login.'</p></td>';
        $renderHTML .= '<td class="col-lg-4"><b>'.$view->title.'</b><div class="col-lg-12">'.$view->description.'</div></td>';
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
    SELECT member_id FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    AND member_role = 1
    ");
    foreach ($members_id as $member_id) {
        $renderHTML .= get_userdata($view->user_id)->user_login.'<br>';
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
        $check_user_exist = $wpdb->get_var("
            SELECT COUNT(*)
            FROM {$wpdb->prefix}members
            WHERE form_id = '".$form_id."'
            AND member_id = '".$current_user."'
            ");
        $check_user_status = $wpdb->get_var("
    SELECT status
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_id = '".$current_user."'
    ");

        if ($is_student == 'Student') {
            if ($check_user_exist == 0) {
                $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
            } elseif ($check_user_status == 1) {
                $renderHTML .= 'Pending';
            }
        } else {
            $renderHTML .= 'Opening';
        }
    } else {
        $renderHTML .= '<button type="submit" id="btn-join" name="btn-join" class="btn btn-info" >Join</button>';
    }

    return $renderHTML;
}
