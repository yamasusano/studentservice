<?php

function current_user_major_id()
{
    global $wpdb;
    $major_id = $wpdb->get_var("
    SELECT ID
    FROM {$wpdb->prefix}major
    WHERE name = '".info('major')."'
    ");

    return $major_id[0];
}

function major_skill()
{
    global $wpdb;
    $skills = $wpdb->get_results("
    SELECT name
    FROM {$wpdb->prefix}skill_major
    WHERE major_id = '".current_user_major_id()."'
    ");

    return $skills;
}

function info($meta_key)
{
    global $wpdb;
    $user_id = get_current_user_id();
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
function get_user_bio($disabled)
{
    $renderHTML .= '<div class="col-lg-12 desciption"><div class="row"><div class="biography">';
    $renderHTML .= '<textarea name="user-description" id="user-description" rows="10" placeholder="about me..." '.$disabled.' >'.info('biography').'</textarea>';
    $renderHTML .= '</div></div></div>';

    return $renderHTML;
}
function get_user_group_name($disabled)
{
    $renderHTML .= '<div class="col-lg-12"><div class="row">';
    $renderHTML .= '<div class="col-lg-6"><div class="row">';
    $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="name">Full Name</label></div>';
    $renderHTML .= ' <div class="col-lg-10"><div class="name"><input type="text" name="user-name" id="user-name" value="'.info('username').'" '.$disabled.' ></div>';
    $renderHTML .= '</div></div></div>';
    $renderHTML .= '<div class="col-lg-6"><div class="row">';
    $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="gender">Gender</label></div>';
    $renderHTML .= '<div class="col-lg-10"><div class="gender"><input type="text" name="gender" id="gender" value="'.checkGender(info('gender'), 'Select gender').'" '.$disabled.' ></div>';
    $renderHTML .= '</div></div></div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function get_user_group_mail($disabled)
{
    $value = checkGender(info('major'), 'Select your batch');
    $renderHTML .= '<div class="col-lg-12"><div class="row">';
    $renderHTML .= '<div class="col-lg-6"><div class="row">';
    $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="email">Email</label></div>';
    $renderHTML .= '<div class="col-lg-10 email"><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.info('email').'</a></div></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="col-lg-6"><div class="row">';
    $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="name">Major</label></div>';
    $renderHTML .= '<div class="col-lg-10"><div class="major"><input type="text" name="major" id="major" value="'.$value.'" '.$disabled.' ></div>';
    $renderHTML .= '</div></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}

function get_student_block($disabled)
{
    $renderHTML .= '<div class="col-lg-12"><div class="row">';
    if (is_student()) {
        $renderHTML .= '<div class="col-lg-6"><div class="row">';
        $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="phone">Batch</label></div>';
        $renderHTML .= '<div class="col-lg-10"><div class="semester-level"><input type="text" name="user-level" id="user-level" value="'.checkGender(info('phone'), 'Select your batch').'" '.$disabled.' ></div></div>';
        $renderHTML .= '</div></div>';
    }
    $renderHTML .= '<div class="col-lg-6"><div class="row">';
    $renderHTML .= '<div class="col-lg-2" style="padding:0"><label for="name">Address</label></div>';
    $renderHTML .= '<div class="col-lg-10"><div class="address"><textarea name="address" id="address" rows="3" style="width: 100%;"  '.$disabled.' >'.info('address').'</textarea></div>';
    $renderHTML .= '</div></div>';
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function get_block_button()
{
    $renderHTML .= '<div class="col-lg-12"><div class="verify-input"></div></div>';
    $renderHTML .= '<div class="col-lg-12"><div id="edit-btn" class="form-group"><button id="edit-profile" name="edit-profile" class="btn btn-success">Edit</button>';
    $renderHTML .= '</div></div> ';

    return $renderHTML;
}
function overView()
{
    $disabled = 'disabled';
    $renderHTML = '';
    $renderHTML .= get_user_bio($disabled);
    $renderHTML .= get_user_group_name($disabled);
    $renderHTML .= get_user_group_mail($disabled);
    $renderHTML .= get_student_block($disabled);
    $renderHTML .= get_block_button();

    return $renderHTML;
}
function is_student()
{
    global $wpdb;
    $is_student = info('role');
    if ($is_student == 'Student') {
        return true;
    } else {
        return false;
    }
}
function checkGender($value, $message)
{
    if (empty($value)) {
        return $message;
    } else {
        return $value;
    }
}
function btnChangeEdit()
{
    $renderHTML .= '<button type="submit" id="update-profile" name="update-profile" class="btn btn-info btn-sm">Save</button>
            <a href="'.home_url('profile').'" class="btn btn-danger btn-sm">Cancel</a>
            ';

    return $renderHTML;
}
function selectGender()
{
    $gender = info('gender');
    $renderHTML .= '<select name="gender" id="gender">';
    if (!empty($gender)) {
        $renderHTML .= '<option value="'.$gender.'" selected="selected" >'.$gender.'</option>';
        if ($gender == 'male') {
            $renderHTML .= '<option value="female">female</option>';
        } else {
            $renderHTML .= '<option value="male">male</option>';
        }
    } else {
        $renderHTML .= '<option value="male">male</option>
        <option value="female">female</option>';
    }
    $renderHTML .= '</select>';

    return $renderHTML;
}
function selectMajor()
{
    global $wpdb;
    $has_form = user_have_form_exist();
    $majors = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}major
    "
    );
    $is_major = info('major');
    $renderHTML = '';
    if ($has_form) {
        $renderHTML .= '<input type="text" name="major" id="major" value="'.$is_major.'" disabled>';
    } else {
        $renderHTML .= '<select name="major" id="major" required>';
        if (!empty($is_major)) {
            $renderHTML .= '<option value="'.$is_major.'" selected="selected" >'.$is_major.'</option>';
            foreach ($majors as $major) {
                if ($major->name != $is_major) {
                    $renderHTML .= '<option value="'.$major->name.'">'.$major->name.'</option>';
                }
            }
        } else {
            $renderHTML .= '<option value="" disabled selected>Select your batch</option>';
            foreach ($majors as $major) {
                $renderHTML .= '<option value="'.$major->name.'">'.$major->name.'</option>';
            }
        }

        $renderHTML .= '</select>';
    }

    return $renderHTML;
}
function select_semester_level()
{
    global $wpdb;
    $user_level = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}semester_level
    "
    );
    $has_level = info('phone');
    $renderHTML = '';
    $renderHTML .= '<select name="user-level" id="user-level" required>';
    if (!empty($has_level)) {
        $renderHTML .= '<option value="'.$has_level.'" selected="selected" >'.$has_level.'</option>';
        foreach ($user_level as $level) {
            if ($level->level != $has_level) {
                $renderHTML .= '<option value="'.$level->level.'">'.$level->level.'</option>';
            }
        }
    } else {
        $renderHTML .= '<option value="" disabled selected>Select your batch</option>';
        foreach ($user_level as $level) {
            $renderHTML .= '<option value="'.$level->level.'">'.$level->level.'</option>';
        }
    }
    $renderHTML .= '</select>';

    return $renderHTML;
}
function has_form_id()
{
    global $wpdb;

    $form_id = $wpdb->get_var("
    SELECT m.form_id FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id 
    WHERE m.member_id = '".get_current_user_id()."' 
    AND  g.type = 'Student'
    ");

    return $form_id;
}

function check_student_form()
{
    global $wpdb;

    $form_id = $wpdb->get_var("
    SELECT m.form_id
    FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id
    WHERE m.member_id = '".get_current_user_id()."'
    AND g.type = 'Student'
    ");

    return $form_id;
}
function user_have_form_exist()
{
    global $wpdb;
    $form_id = $wpdb->get_var("
    SELECT m.form_id
    FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id
    WHERE m.member_id = '".get_current_user_id()."'
    ");
    if ($form_id) {
        return true;
    }

    return false;
}
function getSemester()
{
    global $wpdb;
    $semester = $wpdb->get_var("
    SELECT name 
    FROM {$wpdb->prefix}semester 
    where status = 1
    ");

    return $semester;
}

function updateUserProfile($username, $gender, $address, $phone, $biography, $major)
{
    updateFieldProfile('username', $username);
    updateFieldProfile('gender', $gender);
    updateFieldProfile('major', $major);
    updateFieldProfile('address', $address);
    updateFieldProfile('phone', $phone);
    updateFieldProfile('biography', $biography);

    return 'Update information success';
}

function updateFieldProfile($key, $value)
{
    global $wpdb;
    $user_id = get_current_user_id();
    $update = $wpdb->update(
    "{$wpdb->prefix}usermetaData",
    [
        'meta_value' => $value,
    ],
    [
        'meta_key' => $key,
        'user_id' => $user_id,
    ]
);
}
