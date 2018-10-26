<?php

function userInfo($meta_key, $user_id)
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

function viewDetail($user_id)
{
    $disabled = 'disabled';
    $renderHTML = '';
    $renderHTML .= '
            <div class="col-lg-12 desciption">
            <div class="row">
                <div class="biography">
                    <textarea name="user-description" id="user-description" rows="10" style="width:99%" placeholder="" '.$disabled.' >'.userInfo('biography', $user_id).'</textarea>
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
                                <input type="text" name="user-name" id="user-name" value="'.userInfo('username', $user_id).'" '.$disabled.' >
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
                            <input type="text" name="gender" id="gender" value="'.userInfo('gender', $user_id).'" '.$disabled.' >
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
                            <a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.userInfo('email', $user_id).'</a>
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
                            <input type="text" name="major" id="major" value="'.userInfo('major', $user_id).'" '.$disabled.' >
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
                                <input type="text" name="phone" id="phone" value="'.userInfo('phone', $user_id).'" '.$disabled.' >
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
                                <textarea name="address" id="address" rows="3" style="width: 100%;"  '.$disabled.' >'.userInfo('address', $user_id).'</textarea>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    ';

    return $renderHTML;
}
