<?php

function userInfo($meta_key, $user_id)
{
    global $wpdb;
    $values = $wpdb->get_var("
SELECT meta_value  
FROM {$wpdb->prefix}usermetaData
WHERE user_id = '".$user_id."'
AND meta_key = '".$meta_key."'
");

    return $values;
}

// function viewDetail($user_id)
// {
//     $disabled = 'disabled';
//     $renderHTML = '';
//     $renderHTML .= '<div class="col-lg-12">
//             <div class="user-profile">';
//     $renderHTML .= '<div class="profile-userpic">'.get_avatar($user_id).'</div>';
//     $renderHTML .= '<div class="user-name">'.userInfo('username', $user_id).'</div>';
//     $renderHTML .= '<div class="user-major">';
//     if (empty(userInfo('major', $user_id))) {
//         $renderHTML .= 'have not major';
//     } else {
//         $renderHTML .= userInfo('major', $user_id);
//     }
//     $renderHTML .= '
// <table class="table-info">
// <tr>
// <th>Biograph</th>
// <td>'.userInfo('biography', $user_id).'</td>
// </tr>
// <tr>
// <th>Account</th>
// <td>'.get_userdata($user_id)->user_login.'</td>
// </tr>
// <tr>
// <th>Birth date</th>
// <td></td>
// </tr>
// <tr>
// <th>Gender</th>
// <td>'.userInfo('gender', $user_id).'</td>
// </tr>
// <tr>
// <th>Email</th>
// <td><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.userInfo('email', $user_id).'</a></td>
// </tr>
// <tr>
// <th>Phone number</th>
// <td>'.userInfo('phone', $user_id).'</td>
// </tr>
// <tr>
// <th>Address</th>
// <td>'.userInfo('address', $user_id).'</td>
// </tr>
// </table>
// ';

//     return $renderHTML;
// }
    function userViewDetail($user_id)
    {
        $renderHTML = '';
        $renderHTML .= '<div class="col-lg-12">';
        $renderHTML .= '<div class="user-view-detail">';
        /*------view-block-head-----------------------------*/
        $renderHTML .= '<div class="view-block-head">';
        $renderHTML .= '<div class="col-lg-3"> ';
        $renderHTML .= user_view_ava($user_id);
        $renderHTML .= '</div>';
        $renderHTML .= '<div class="col-lg-9">';
        $renderHTML .= user_view_detail($user_id);
        $renderHTML .= '</div>';
        $renderHTML .= '</div>';
        /*---------end[view-block-head]----------------------*/
        /*------view-block-tail-----------------------------*/
        $renderHTML .= '<div class="view-block-tail">';
        $renderHTML .= '<div class="col-lg-6">';
        $renderHTML .= user_view_block_tail_left($user_id);
        $renderHTML .= '</div>';
        $renderHTML .= '<div class="col-lg-6">';
        $renderHTML .= user_view_block_tail_right($user_id);
        $renderHTML .= '</div>';
        $renderHTML .= '</div>';
        /*------end[view-block-tail]-----------------------------*/
        $renderHTML .= '</div></div>';
        $renderHTML .= '<div class="btn-chatting-block">';
        $renderHTML .= '<button id="chat-with-user" class="btn btn-primary">Chat me</button>';
        $renderHTML .= '</div>';

        return $renderHTML;
    }

function user_view_ava($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="view-ava"> ';
    $renderHTML .= '<div class="profile-userpic">'.get_avatar($user_id).'</div>';
    $renderHTML .= '<div class="user-name">'.userInfo('username', $user_id).'</div>';
    $renderHTML .= '<div class="user-major">';
    if (empty(userInfo('major', $user_id))) {
        $renderHTML .= 'Have not major';
    } else {
        $renderHTML .= userInfo('major', $user_id);
    }
    $renderHTML .= '</div></div>';

    return $renderHTML;
}
function user_view_detail($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="view-block-detail"> ';
    $renderHTML .= '<div class="user-bio"><h4>Biograph</h4><div class="user-bio-content">'.userInfo('biography', $user_id).'</div></div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function user_view_block_tail_left($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="form-groups">';
    $renderHTML .= '<div class="col-lg-4">Account</div>';
    $renderHTML .= '<div class="col-lg-8">'.get_userdata($user_id)->user_login.'</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="form-groups">';
    $renderHTML .= '<div class="col-lg-4">Gender</div>';
    $renderHTML .= '<div class="col-lg-8">'.userInfo('gender', $user_id).'</div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="form-groups">';
    $renderHTML .= '<div class="col-lg-4">Batch</div>';
    $renderHTML .= '<div class="col-lg-8">'.userInfo('phone', $user_id).'</div>';
    $renderHTML .= '</div>';

    return $renderHTML;
}
function user_view_block_tail_right($user_id)
{
    $renderHTML = '';
    $renderHTML .= '<div class="form-groups">';
    $renderHTML .= '<div class="col-lg-4">Email</div>';
    $renderHTML .= '<div class="col-lg-8"><a href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to='.info('email').'" target="_blank">'.userInfo('email', $user_id).'</a></div>';
    $renderHTML .= '</div>';
    $renderHTML .= '<div class="form-groups">';
    $renderHTML .= '<div class="col-lg-4">Address</div>';
    $renderHTML .= '<div class="col-lg-8">'.userInfo('address', $user_id).'</div>';
    $renderHTML .= '</div>';
    $renderHTML .= get_user_project($user_id);

    return $renderHTML;
}
function get_user_project($user_id)
{
    $is_lead = user_is_leader($user_id);
    if ($is_lead) {
        $form_id = get_user_form($user_id);
        $renderHTML .= '<div class="form-groups">';
        $renderHTML .= '<div class="col-lg-4">Project</div>';
        $renderHTML .= '<div class="col-lg-8"><a href="'.home_url('form-detail').'?form-id='.$form_id.'" class="title-form" target="_blank">'.wp_trim_words(get_form_detail($form_id, 'title'), 20, '..').'</a></div>';
        $renderHTML .= '</div>';
    }

    return $renderHTML;
}
function get_form_detail($form_id, $key)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT $key 
    FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
    ");

    return $value;
}
function user_is_leader($user_id)
{
    global $wpdb;
    $form_id = get_user_form($user_id);
    $is_leader = $wpdb->get_var("
    SELECT COUNT(*) FROM {$wpdb->prefix}members
    where form_id = '".$form_id."'
    and member_id = '".$user_id."'
    and member_role = 0
    ");
    if ($is_leader == 1) {
        return true;
    }

    return false;
}
function get_user_form($user_id)
{
    global $wpdb;

    $form_id = $wpdb->get_var("
    SELECT form_id 
    FROM {$wpdb->prefix}members 
    WHERE member_id = '".$user_id."' 
    ");

    return $form_id;
}
