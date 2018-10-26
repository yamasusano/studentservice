<?php

include 'includes/core/profile/gpf-profile.php';
function groupMenu()
{
    $renderHTML = '';
    $is_leader = is_leader(check_student_form());
    $renderHTML .= '
<div class="col-lg-12">
    <div class="row">
        <div class="menu-lists">
            <div class="group-menu-item">';
    if ($is_leader) {
        $renderHTML .= '<button id="finder-form" class="btn btn-info">Finder Form</button>';
    }
    $renderHTML .= '<button id="group-chat" class="btn btn-info">Chating</button>
                <button id="member-list" class="btn btn-info">Members</button>

                </div>
            <div class="invite-members">
                <input type="text" name="user-name" placeholder="search student,suppervisor here...">
                <button class="btn btn-info" name="search-user">Search</button>
            </div>

         </div>
	</div>
</div>
<div class="col-lg-12">
    <div class="row">
        <div id="group-contents">
        </div>
    </div>
</div>
<div class="col-lg-12" style="text-align:right;margin-top:20px;">
    <button name="leave-group" class="btn btn-info">Leave</button>
</div>
';

    return $renderHTML;
}
function finderForm()
{
    $skills = major_skill();
    $finder_form = check_student_form();
    $renderHTML = '<h3>Finder Form</h3><div class="finder-form">
        <div class="row">
            <div class="title-form">
                <div class="col-lg-3">
                    <label for="title">title</label>
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
                <textarea name="description" id="description" rows="3" style="resize:none;width:100%">'.($finder_form ? form_data('description') : '').'</textarea>
                </div>
            </div>
            <div class="member-avaiable-form">
                <div class="col-lg-3">
                    <label for="title">member</label>
                </div>
                <div class="col-lg-9">'.($finder_form ? set_member_to_form($finder_form) : '').'</div>
            </div>
            <div class="skill-form">
                <div class="col-lg-3">
                    <label for="title">skill</label>
                </div>
                <div class="col-lg-9">
                    <dl class="dropdown">
                        <dt>
                            <a id="skill">
                            <span class="hida">Select skill</span>
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
                        <label for="title">other</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="text" id="skill-other" value="'.($finder_form ? form_data('other_skill') : '').'">
                    </div>
                </div>
                <div class="contact-form">
                    <div class="col-lg-3">
                        <label for="title">Contact</label>
                    </div>
                    <div class="col-lg-9">
                        <input type="text" id="contact-form"value="'.($finder_form ? form_data('contact') : '').'">
                    </div>
                </div>
                <div class="supervisor-form">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">Supervisor</label>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">Close date</label>
                            <input type="date"  id="close-date" value="'.($finder_form ? form_data('expiry_date') : date('Y-m-d')).'">
                        </div>
                    </div>
                </div>
             </div>
        </div>
        <div id="group-message">
        </div>
        <div class="col-lg-12  form-btn">';
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
        $renderHTML .= '<button id="edit-form-finder" class="btn btn-info">Edit</button>';
    } else {
        $renderHTML .= '<button id="post-form" class="btn btn-info">Post</button>';
        $renderHTML .= '<a href="'.home_url('profile').'" class="btn btn-danger">cancel</a>';
    }

    return $renderHTML;
}
function actionEditForm()
{
    $renderHTML = '';
    $renderHTML .= '<button id="save-form-finder" class="btn btn-info">Post</button>';
    $renderHTML .= '<a href="'.home_url('profile').'" class="btn btn-danger">cancel</a>';

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
        $renderHTML .= '<a href="#" class="btn btn-sm btn-info" >'.$member_name.'</a>';
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
    AND status = 0
    ");

    return $get_member;
}
