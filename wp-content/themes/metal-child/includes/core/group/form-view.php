<?php

function formView($form_id)
{
    $renderHTML = '';
    $renderHTML .= '
    <div class="form-detail">
    <h3>'.get_form_value($form_id, 'title').'</h3>
    <div class="description">
    '.get_form_value($form_id, 'description').'
    </div>
    <table>
        <tr>
            <th>Leader</th>
            <td><a href="'.home_url('user').'?user-id='.$members->member_id.'" class="btn btn-info btn-sm">'.get_form_value($form_id, 'user_id').'</a></td>
        </tr>
        <tr>
            <th>Members</th>
            <td>'.get_list_member($form_id).'</td>
        </tr>
        <tr>
            <th>Skill requice</th>
            <td>'.get_skills($form_id).'</td>
        </tr>
        <tr>
            <th>Other</th>
            <td>'.get_form_value($form_id, 'other_skill').'</td>
        </tr>
        <tr>
            <th>contact</th>
            <td>'.get_form_value($form_id, 'contact').'</td>
        </tr>
        <tr>
            <th>Suppervisor</th>
            <td>'.get_supervisor($form_id).'</td>
        </tr>
        <tr>
            <th>Open to</th>
            <td>'.get_form_value($form_id, 'expiry_date').'</td>
        </tr>
    </table>
    </div>';

    return $renderHTML;
}

function get_form_value($form_id, $field)
{
    global $wpdb;

    $value = $wpdb->get_var("
    SELECT $field 
    FROM {$wpdb->prefix}finder_form 
    WHERE ID = '".$form_id."'
    ");
    if ($field == 'user_id') {
        $value = get_userdata($value)->user_login;
    }

    return $value;
}
function get_list_member($form_id)
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
        $renderHTML .= '<a href="'.home_url('user').'?user-id='.$members->member_id.'" class="btn btn-info btn-sm">'.get_userdata($members->member_id)->user_login.'</a>';
    }

    return $renderHTML;
}

function get_supervisor($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $supervisor = $wpdb->get_var("
    SELECT member_id 
    FROM {$wpdb->prefix}members 
    WHERE form_id = '".$form_id."'
    AND member_role = 2
    ");
    $renderHTML .= '<a href="'.home_url('user').'?user-id='.$supervisor.'" class="btn btn-info btn-sm">'.get_userdata($supervisor)->user_login.'</a>';

    return $renderHTML;
}

function get_skills($form_id)
{
    global $wpdb;
    $renderHTML = '';
    $skills = $wpdb->get_results("
    SELECT s.name 
    FROM {$wpdb->prefix}skill_major as s 
    INNER JOIN {$wpdb->prefix}form_skill as f
    ON f.skill_id = s.ID 
    WHERE f.form_id = '".$form_id."'
    ");
    foreach ($skills as $skill) {
        $renderHTML .= $skill->name.' , ';
    }

    return $renderHTML;
}
