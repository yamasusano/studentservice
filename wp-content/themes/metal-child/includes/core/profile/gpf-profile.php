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

function overView()
{
    $disabled = 'disabled';
    $renderHTML = '';
    $renderHTML .= '
        <div class="col-lg-12 desciption">
        <div class="row">
            <div class="biography">
                <textarea name="user-description" id="user-description" rows="10" style="width:99%" placeholder="about me..." '.$disabled.' >'.info('biography').'</textarea>
            </div>    
        </div>
    </div>
    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-2" style="padding:0">
                        <label for="name">Full Name</label>
                    </div>
                     <div class="col-lg-10">    
                        <div class="name">
                            <input type="text" name="user-name" id="user-name" value="'.info('username').'" '.$disabled.' >
                        </div>     
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-2" style="padding:0">
                    <label for="gender">Gender</label>
                </div>
                 <div class="col-lg-10">    
                    <div class="gender">
                        <input type="text" name="gender" id="gender" value="'.info('gender').'" '.$disabled.' >
                    </div>     
                </div>
            </div>
        </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-2" style="padding:0">
                        <label for="email">Email</label>
                    </div>
                    <div class="col-lg-10 email">
                        <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.info('email').'</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-2" style="padding:0">
                    <label for="name">Major</label>
                </div>
                 <div class="col-lg-10">    
                    <div class="major">
                        <input type="text" name="major" id="major" value="'.info('major').'" '.$disabled.' >
                    </div>     
                </div>
            </div>
        </div>
        </div>
    </div>
    <div class="col-lg-12">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-2" style="padding:0">
                        <label for="phone">Phone</label>
                    </div>
                    <div class="col-lg-10">    
                        <div class="phone">
                            <input type="text" name="phone" id="phone" value="'.info('phone').'" '.$disabled.' >
                        </div>     
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-2" style="padding:0">
                        <label for="name">Address</label>
                    </div>
                    <div class="col-lg-10">    
                        <div class="address">
                            <textarea name="address" id="address" rows="3" style="width: 100%;"  '.$disabled.' >'.info('address').'</textarea>
                        </div>     
                    </div>
                </div>
             </div>   
        </div>
    </div>
<div class="col-lg-12">
    <div class="verify-input">
    </div>
</div>
    <div class="col-lg-12">
        <div id="edit-btn" class="form-group">
            <button  id="edit-profile" name="edit-profile" class="btn btn-success">Edit</button>
        </div>
    </div>

';

    return $renderHTML;
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
            $renderHTML .= '<option value="female">Female</option>';
        } else {
            $renderHTML .= '<option value="male">Male</option>';
        }
    } else {
        $renderHTML .=
        '<option value="Male">Male</option>
        <option value="Female">Female</option>';
    }
    $renderHTML .= '</select>';

    return $renderHTML;
}
function selectMajor()
{
    global $wpdb;
    $majors = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}major
    "
    );
    $is_major = info('major');
    $renderHTML = '';
    $renderHTML .= '<select name="major" id="major" required>';
    if (!empty($is_major)) {
        $renderHTML .= '<option value="'.$is_major.'" selected="selected" >'.$is_major.'</option>';
        foreach ($majors as $major) {
            if ($major->name != $is_major) {
                $renderHTML .= '<option value="'.$major->name.'">'.$major->name.'</option>';
            }
        }
    } else {
        $renderHTML .= '<option value="" disabled selected>Select a major</option>';
        foreach ($majors as $major) {
            $renderHTML .= '<option value="'.$major->name.'">'.$major->name.'</option>';
        }
    }
    $renderHTML .= '</select>';

    return $renderHTML;
}

//HUYLV
//can't know who current user know belong in form.
function has_form_id()
{
    global $wpdb;

    $form_id = $wpdb->get_var("
    SELECT form_id 
    FROM {$wpdb->prefix}members 
    WHERE member_id = '".get_current_user_id()."' 
    ");

    return $form_id;
}
//HUYLV
// can't check type of group is student or teacher .

function check_student_form()
{
    global $wpdb;

    $form_id = $wpdb->get_var("
    SELECT m.form_id
    FROM {$wpdb->prefix}members as m
    INNER JOIN {$wpdb->prefix}groups as g
    ON m.form_id = g.form_id
    WHERE member_id = '".get_current_user_id()."'
    AND g.type = 'Student'
    ");

    return $form_id;
}

//HUYLV
//Missing appear current semester
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

    return 'update information success!!';
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
