<?php

include 'includes/core/profile/gpf-profile.php';
function get_groups()
{
    $renderHTML = '';
    $user_role = info('role');
    if ($user_role == 'Student') {
        $renderHTML .= '<div id="my-group" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>My Group</a></div>';
        $renderHTML .= '<div id="teacher-group" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>Teacher Groups</a></div>';
        $renderHTML .= '<div id="manage-request" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>My request</a></div>';
    } else {
        $renderHTML .= '<div id="my-groups" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>My Groups</a></div>';
        $renderHTML .= '<div id="student-groups" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>Student groups</a></div>';
        $renderHTML .= '<div id="manage-teacher-request" class="sub-menu-items"><i class="glyphicon glyphicon-hand-right"></i><a>My request</a></div>';
    }

    return $renderHTML;
}

function groupMenu()
{
    $renderHTML = '';
    $form = check_student_form();
    $is_leader = is_leader(check_student_form());
    $renderHTML .= '<div class="col-lg-12"><div class="row">';
    $renderHTML .= '<div class="menu-lists"><div class="group-menu-item">';
    $renderHTML .= '<input type="hidden" id="form-id" value="'.$form.'" />';
    if (!$form) {
        $renderHTML .= '<button id="finder-form" class="btn btn-info">Finder Form</button>';
    } else {
        if ($is_leader) {
            $renderHTML .= '<button id="finder-form" class="btn btn-info">Finder Form</button>';
        }
    }
    $renderHTML .= '<button id="group-chat" class="btn btn-info">Chating</button><button id="member-list" class="btn btn-info">Members</button></div>';
    $renderHTML .= '<div class="invite-members"><input type="text" name="user-name" id="user-names" placeholder="search student,suppervisor here...">';
    $renderHTML .= '<button class="btn btn-info" name="search-users" id="search-users" >Search</button></div>';
    $renderHTML .= '</div></div></div>';
    $renderHTML .= '<div class="col-lg-12"><div class="row"><div id="group-contents">';
    $renderHTML .= finderFormView();
    $renderHTML .= '</div></div></div>';
    $renderHTML .= leaveGroup();

    return $renderHTML;
}

function semesterSelect()
{
    global $wpdb;
    $semsters = $wpdb->get_results("
    SELECT name 
    FROM {$wpdb->prefix}semester 
    ORDER BY start ASC
    ");
    $renderHTML = '';
    foreach ($semsters as $semster) {
        $renderHTML .= '<option value= "'.$semster->name.'">'.$semster->name.'</option>';
    }

    return $renderHTML;
}
function get_skill_set()
{
    global $wpdb;
    $finder_form = check_student_form();
    $skill_names = $wpdb->get_results("
    SELECT s.name 
    FROM {$wpdb->prefix}skill_major as s
    INNER JOIN {$wpdb->prefix}form_skill as fs
    ON fs.skill_id = s.ID 
    WHERE fs.form_id = '".$finder_form."'
    ");
    $renderHTML = '';
    foreach ($skill_names as $name) {
        $renderHTML .= '<button name="skill" class="btn btn-primary btn-xs ">'.$name->name.'</button>';
    }

    return $renderHTML;
}
function finderFormView()
{
    $renderHTML = '';
    $finder_form = check_student_form();
    $members = set_member_to_form($finder_form);
    if ($finder_form) {
        $renderHTML .= '<div class="form-view">';
        $renderHTML .= '<h3 style="text-transform: uppercase;">'.form_data('title').'</h3>';
        $renderHTML .= '<h5 style="padding-left: 40px;">Semester  <b>'.form_data('semester').'</b></h5>';
        $renderHTML .= '<hr class="style-four">';
        $renderHTML .= '<div class="form-view-detail">';
        $renderHTML .= '<div class="members"><div class="col-lg-3 col">Members</div><div class="col-lg-9 col">'.$members.'</div></div>';
        $renderHTML .= '<div class="skill-set"><div class="col-lg-3">Responsibilities</div><div class="col-lg-9">'.get_skill_set().'</div></div>';
        $renderHTML .= '<div class="Others"><div class="col-lg-3">Other requirements</div><div class="col-lg-9">'.form_data('other_skill').'</div></div>';
        $renderHTML .= '<div class="Supervisor"><div class="col-lg-3">Supervisor</div><div class="col-lg-9">'.get_suppervisor($finder_form).'</div></div>';
        $renderHTML .= '<div class="desc-view"><div class="col-lg-3 col">Description</div><div class="col-lg-9 col">'.form_data('description').'</div></div>';
        $renderHTML .= '</div></div>';
    }

    return $renderHTML;
}
function finderForm()
{
    $skills = major_skill();
    $major = info('major');
    $finder_form = check_student_form();

    $renderHTML = '<h3>Finder Form</h3><div class="finder-form">
        <div class="row">
            <div class="project-semester">
                <div class="col-lg-3">
                    <label for="title">Semester</label>
                </div>
                <div class="col-lg-9">
                    <select name="semester" id="semester">
                        '.semesterSelect().'
                    </select>
                </div>
            </div>
            <div class="leader-major">
                <div class="col-lg-3">
                    <label for="title">Major</label>
                </div>
                <div class="col-lg-9">
                 '.(isset($major) ? $major : 'unset').'
                </div>
            </div>
            <div class="title-form">
                <div class="col-lg-3">
                    <label for="title">Title</label>
                </div>
                <div class="col-lg-9">
                    <input type="text" id="title" value="'.($finder_form ? form_data('title') : '').'" >
                </div>
            </div>
            <div class="description-form">
                <div class="col-lg-3">
                    <label for="title">Description</label>
                </div>
                <div class="col-lg-9">
                <textarea name="description" id="description" rows="6" cols=107>'.($finder_form ? form_data('description') : '').'</textarea>';
    $renderHTML .= '</div>
            </div>
            <div class="member-avaiable-form">
                <div class="col-lg-3">
                    <label for="title">Members</label>
                </div>
                <div class="col-lg-9">'.($finder_form ? set_member_to_form($finder_form) : '').'</div>
            </div>
            <div class="skill-form">
                <div class="col-lg-3">
                    <label for="title">Responsibilities</label>
                </div>
                <div class="col-lg-9">
                    <dl class="dropdown">
                        <dt>
                            <a id="skill">
                            <span class="hida">Select Skill</span>
                            <p class="multiSel"></p>
                            </a>
                        </dt>
                        <dd>
                            <div class="mutliSelect">
                                <ul>';
    foreach ($skills as $skill) {
        $renderHTML .= ' <li>
                                        <input type="checkbox" value="'.$skill->name.'"/>'.$skill->name.'</li>';
    }
    $renderHTML .= '</ul>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="prefix-element">
                <div class="skill-other">
                    <div class="col-lg-3">
                        <label for="title">Other requirements</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="text" id="skill-other" value="'.($finder_form ? form_data('other_skill') : '').'">
                    </div>
                </div>
                <div class="supervisor-form">
                    <div class="col-lg-6">
                        <div class="col-lg-6">
                            <label for="title">Supervisor</label>
                        </div>
                        <div class="col-lg-6">
                        '.get_suppervisor($finder_form).'
                        </div>
                    </div>  
                </div>
             </div>
        </div>
        <div id="group-message">
        </div>
        <div class="col-lg-12  form-btn">';
    $renderHTML .= '<input type="hidden" name="get-description" id="get-description" /> ';
    $renderHTML .= is_form_exist();
    $renderHTML .= ' </div></div>';

    return $renderHTML;
}
function is_form_exist()
{
    global $wpdb;

    $finder_form = check_student_form();
    $renderHTML .= '';
    if ($finder_form) {
        $check_status = $wpdb->get_var("
        SELECT status 
        FROM {$wpdb->prefix}finder_form 
        WHERE ID = '".$finder_form."'
        ");
        if ($check_status == 1) {
            $renderHTML .= '<button id="save-form-finder" class="btn btn-info">Public</button>';
            $renderHTML .= '<button id="close-form-finder" class="btn btn-danger">Close</button>';
        } else {
            $renderHTML .= '<button id="reopen-form-finder" class="btn btn-info">Re-Open</button>';
        }
    } else {
        $renderHTML .= '<button id="post-form" class="btn btn-info">Public</button>';
        $renderHTML .= '<a href="'.home_url('profile').'" class="btn btn-danger">cancel</a>';
    }

    return $renderHTML;
}
function form_data($key)
{
    global $wpdb;
    $form_id = check_student_form();
    $value = $wpdb->get_var("
    SELECT $key 
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'
    ");

    return $value;
}
function set_member_to_form($form_id)
{
    $renderHTML = '';
    $members = get_members_to_form($form_id);
    foreach ($members as $member) {
        $member_name = get_userdata($member->member_id)->user_login;
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$member->member_id.'" class="btn btn-sm btn-info" >'.$member_name.'</a>';
    }

    return $renderHTML;
}
function get_suppervisor($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $suppervisor = $wpdb->get_var("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."' 
    AND member_role = 2
    ");
    if ($suppervisor) {
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$suppervisor.'" class="btn btn-sm btn-info btn-sm" >'.get_userdata($suppervisor)->user_login.'</a>';
    }

    return $renderHTML;
}
function get_members_to_form($form_id)
{
    global $wpdb;
    $get_member = $wpdb->get_results("
    SELECT member_id
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."' 
    AND member_role = 1
    ");

    return $get_member;
}
function leaveGroup()
{
    global $wpdb;

    $renderHTML = '';
    $user_id = get_current_user_id();
    if (isFormExist($user_id)) {
        $renderHTML .= '<div class="col-lg-12" style="text-align:right;margin-top:20px;">
        <button name="leave-group" id="leave-group" class="btn btn-danger">Leave</button>
    </div>';
    }

    return $renderHTML;
}
function actionLeaveGroup()
{
    $form_id = check_student_form();
    $is_leader = is_leader($form_id);

    if ($is_leader) {
        if (has_member_in_group($form_id)) {
            return array('result' => false, 'message' => 'Before leave group, you must asign leader for other members in group.');
        } else {
            return array('result' => true, 'message' => 'Do you want to do this ? Data group will be deleted');
        }
    } else {
        return array('result' => true, 'message' => 'Do you want to leave group ?');
    }
}

function studentLeaveGroup($form_id, $user_id)
{
    global $wpdb;
    $delete_members = $wpdb->delete(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
            'member_id' => $user_id,
        ]
        );
    $delete_groups = $wpdb->delete(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
        ]
        );
    $delete_skill = $wpdb->delete(
        "{$wpdb->prefix}form_skill",
        [
            'form_id' => $form_id,
        ]
        );
    if (isset($delete_groups) && isset($delete_members) && isset($delete_skill)) {
        $delete_form = $wpdb->delete(
            "{$wpdb->prefix}finder_form",
           [
            'ID' => $form_id,
            'user_id' => $user_id,
           ]
        );
    }
}

function has_member_in_group($form_id)
{
    global $wpdb;
    $count = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."' 
    AND member_role = 1
    ");
    if ($count >= 1) {
        return true;
    }

    return false;
}
