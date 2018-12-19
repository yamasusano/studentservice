<?php

include 'includes/core/group/menu-group.php';
include 'includes/core/group/finder-form-action.php';
function is_teacher($form_id)
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
function get_action_form_teacher($form_id)
{
    $renderHTML = '';
    $is_leader = is_teacher($form_id);
    $renderHTML .= '<h5 style="text-transform:uppercase";>'.get_form_teacher_info($form_id, 'title').'</h5>';
    $renderHTML .= '<div class="menu-lists">';
    $renderHTML .= '<div class="group-menu-item">';
    $renderHTML .= '<input type="hidden" id="form-id" value="'.$form_id.'" />';
    if ($is_leader) {
        $renderHTML .= '<button id="finder-form-teacher" class="btn btn-info">Finder Form</button>';
    }
    $renderHTML .= '<button id="group-chat" class="btn btn-info">Chating</button>';
    $renderHTML .= '<button id="members-list" class="btn btn-info">Members</button>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function genarate_semester()
{
    $renderHTML = '<div class="project-semester">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Semester</label></div>';
    $renderHTML .= '<div class="col-lg-9"><select name="semester" id="semester">'.semesterSelect().'</select></div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function genarate_major()
{
    $user_id = get_current_user_id();
    $major = teacher_info_detail($user_id, 'major');
    $renderHTML = '<div class="leader-major">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Major</label></div>';
    $renderHTML .= '<div class="col-lg-9">'.(isset($major) ? $major : 'Unset').'</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function genarate_title($form_id)
{
    $title = get_form_teacher_info($form_id, 'title');
    $renderHTML .= '<div class="title-form">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Title</label></div>';
    $renderHTML .= '<div class="col-lg-9"><input type="text" id="title" value="'.$title.'" ></div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function genarate_desc($form_id)
{
    $desc = get_form_teacher_info($form_id, 'description');
    $renderHTML .= '<div class="description-form">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Description</label></div>';
    $renderHTML .= '<div class="col-lg-9"><textarea name="description" id="description" rows="6" cols=107>'.($form_id ? $desc : '').'</textarea></div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function genarate_members($form_id)
{
    $renderHTML .= '<div class="member-avaiable-form">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Members</label></div>';
    $renderHTML .= '<div class="col-lg-9">'.($form_id ? set_member_to_form($form_id) : '').'</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function genarate_skill()
{
    $skills = major_skill();
    $renderHTML .= '<div class="skill-form">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Responsibilities</label></div>';
    $renderHTML .= '<div class="col-lg-9"><dl class="dropdown">';
    $renderHTML .= '<dt><a id="skill"><span class="hida">Select Skill</span><p class="multiSel"></p></a></dt>';
    $renderHTML .= '<dd><div class="mutliSelect"><ul>';
    foreach ($skills as $skill) {
        $renderHTML .= ' <li><input type="checkbox" value="'.$skill->name.'"/>'.$skill->name.'</li>';
    }
    $renderHTML .= '</ul></div></dd></dl>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function genarate_other_skill($form_id)
{
    $other_skill = get_form_teacher_info($form_id, 'other_skill');
    $renderHTML .= '<div class="prefix-element"><div class="skill-other">';
    $renderHTML .= '<div class="col-lg-3"><label for="title">Other requirements</label></div>';
    $renderHTML .= '<div class="col-lg-9"><input type="text" id="skill-other" value="'.($form_id ? $other_skill : '').'"></div>';
    $renderHTML .= '</div></div></div>';

    return $renderHTML;
}
function genarate_message_form()
{
    $renderHTML .= '<div id="group-message"></div>';

    return $renderHTML;
}
function generate_teacher_form($form_id)
{
    $renderHTML = '<h3>Finder Form</h3><div class="finder-form"><div class="row">';
    $renderHTML .= genarate_semester();
    $renderHTML .= genarate_major();
    $renderHTML .= genarate_title($form_id);
    $renderHTML .= genarate_desc($form_id);
    $renderHTML .= genarate_members($form_id);
    $renderHTML .= genarate_skill();
    $renderHTML .= genarate_other_skill($form_id);
    $renderHTML .= genarate_message_form();
    $renderHTML .= genarate_group_button($form_id);
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function genarate_group_button($form_id)
{
    global $wpdb;
    $check_special = $wpdb->get_var("
    SELECT special
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'      
    ");
    $check_status = $wpdb->get_var("
    SELECT status
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'      
    ");
    $renderHTML .= '';
    $renderHTML .= '<div class="col-lg-12  form-btn">';
    $renderHTML .= '<input type="hidden" name="get-description" id="get-description" /> ';

    if ($check_special == 1) {
        $renderHTML .= '<button id="save-form-finder-teach" class="btn btn-info">Public</button>';
        $renderHTML .= '<a href="'.home_url('profile').'" class="btn btn-danger">Cancel</a>';
    } elseif ($check_status == 0) {
        $renderHTML .= '<button id="reopen-form-finder-teach" class="btn btn-info">Re-Open</button>';
    } elseif ($check_status == 1) {
        $renderHTML .= '<button id="save-form-finder-teach" class="btn btn-info">Public</button>';
        $renderHTML .= '<button id="close-form-finder-teach" class="btn btn-danger">Close</button>';
    }

    $renderHTML .= '</div>';

    return $renderHTML;
}
function get_form_teacher_info($form_id, $key)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT $key 
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'
    ");

    return $value;
}
function teacher_info_detail($user_id, $key)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT meta_value
    FROM {$wpdb->prefix}usermetaData
    WHERE user_id = '".$user_id."'
    AND meta_key = '".$key."'
    ");

    return $value;
}
function updateFinderFormTeacher($form_id, $title, $description, $other, $contact, $semester, $skill)
{
    global $wpdb;
    $skills = explode(',', $skill);
    $update_form_finder = $wpdb->update(
        "{$wpdb->prefix}finder_form",
        [
            'title' => $title,
            'description' => $description,
            'other_skill' => $other,
            'contact' => $contact,
            'semester' => $semester,
            'status' => 1,
            'special' => 0,
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

function teacher_has_major()
{
    $user_id = get_current_user_id();
    $current_major = teacher_info_detail($user_id, 'major');
    if (empty($current_major)) {
        return array('result' => false, 'message' => '<div class="message-fail">You need to have a major to post Finder form, go to profile to update your major.</div>');
    }

    return array('result' => true);
}
function get_skill_teacher_form($form_id)
{
    global $wpdb;
    $skill_names = $wpdb->get_results("
    SELECT s.name 
    FROM {$wpdb->prefix}skill_major as s
    INNER JOIN {$wpdb->prefix}form_skill as fs
    ON fs.skill_id = s.ID 
    WHERE fs.form_id = '".$form_id."'
    ");
    $renderHTML = '';
    foreach ($skill_names as $names) {
        $renderHTML .= '<button name="skill" class="btn btn-primary btn-xs ">'.$names->name.'</button>';
    }

    return $renderHTML;
}
function teacher_form_view($form_id)
{
    $members = set_member_to_form($form_id);
    $status = get_form_teacher_info($form_id, 'status');
    if ($form_id) {
        $renderHTML .= '<div class="form-view" style="position:relative;">';
        $renderHTML .= '<button id="edit-form-teach" class="btn btn-primary btn-edit-form">Edit</button>';
        $renderHTML .= '<h3 style="text-transform: uppercase;">'.get_form_teacher_info($form_id, 'title').'</h3>';
        $renderHTML .= '<h5 style="padding-left: 40px;">Semester  <b>'.get_form_teacher_info($form_id, 'semester').'</b></h5>';
        $renderHTML .= '<hr class="style-four">';
        $renderHTML .= '<div class="form-view-detail">';
        $renderHTML .= '<div class="desc-view"><div class="col-lg-3 col">Description</div><div class="col-lg-9 col">'.get_form_teacher_info($form_id, 'description').'</div></div>';
        $renderHTML .= '<div class="members"><div class="col-lg-3 col">Members</div><div class="col-lg-9 col">'.$members.'</div></div>';
        $renderHTML .= '<div class="skill-set"><div class="col-lg-3">Skill Set</div><div class="col-lg-9">'.get_skill_teacher_form($form_id).'</div></div>';
        $renderHTML .= '<div class="Others"><div class="col-lg-3">Others</div><div class="col-lg-9">'.get_form_teacher_info($form_id, 'other_skill').'</div></div>';
        $renderHTML .= '<div class="status"><div class="col-lg-3">Status</div><div class="col-lg-9">'.(($status == 1) ? 'Opening' : 'Closed').'</div></div>';

        $renderHTML .= '</div></div>';
    }

    return $renderHTML;
}

function closeFormTeach($form_id)
{
    global $wpdb;
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
function reOpenFormTeach($form_id)
{
    global $wpdb;
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
function get_request_form_id()
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
function get_request_list()
{
    global $wpdb;
    $renderHtml = '';
    $renderHtml .= '<div class="member-message"></div>';
    $renderHtml .= '<table class="table-striped">';
    $renderHtml .= '<tr><th>Receiver/Sender</th> <th>Project Name</th> <th>Message</th> <th>Date Created</th> <th>Status</th></tr>';
    $get_request = get_request_form_id();
    foreach ($get_request as $request) {
        if (is_teacher($request->form_id)) {
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
