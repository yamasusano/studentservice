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
    $renderHTML .= '<div class="col-lg-12">
                 <div class="user-profile">';
    $renderHTML .= '<div class="profile-userpic">'.get_avatar($user_id->user_email).'</div>';
    $renderHTML .= '<div class="user-name">'.userInfo('username', $user_id).'</div>';
    $renderHTML .= '<div class="user-major">';
    if (empty(userInfo('major', $user_id))) {
        $renderHTML .= 'have not major';
    } else {
        $renderHTML .= userInfo('major', $user_id);
    }
    $renderHTML .= '
    <table class="table-info">
    <tr>
        <th>Biograph</th>
        <td>'.userInfo('biography', $user_id).'</td>
    </tr>
    <tr>
        <th>Account</th>
        <td>'.get_userdata($user_id)->user_login.'</td>
    </tr>
    <tr>
        <th>Birth date</th>
        <td></td>
    </tr>
    <tr>
        <th>Gender</th>
        <td>'.userInfo('gender', $user_id).'</td>
    </tr>
    <tr>
        <th>Email</th>
        <td><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.userInfo('email', $user_id).'</a></td>
    </tr>
    <tr>
        <th>Phone number</th>
        <td>'.userInfo('phone', $user_id).'</td>
    </tr>
    <tr>
        <th>Address</th>
        <td>'.userInfo('address', $user_id).'</td>
    </tr>
</table>
    ';

    return $renderHTML;
}
