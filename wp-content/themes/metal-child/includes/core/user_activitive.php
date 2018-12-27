<?php

function get_list_email()
{
    global $wpdb;
    $list_email = $wpdb->get_results("
    SELECT email FROM {$wpdb->prefix}users_status
    ");

    return $list_email;
}

function action_user_online()
{
    global $wpdb;
    $check = false;
    $email = $_SESSION['email'];
    foreach (get_list_email() as $mail) {
        if ($email == $mail->email) {
            $check = true;
        }
    }
    if ($check) {
        $update = $wpdb->update(
                "{$wpdb->prefix}users_status",
                [
                   'status' => 1,
                ],
                [
                    'email' => $email,
                ]
                );
    } else {
        $insert = $wpdb->insert(
                "{$wpdb->prefix}users_status",
                [
                    'email' => $email,
                    'status' => 1,
                ]
                );
    }
}
function action_user_offline()
{
    global $wpdb;
    $email = $_SESSION['email'];
    $update = $wpdb->update(
        "{$wpdb->prefix}users_status",
        [
           'status' => 0,
        ],
        [
            'email' => $email,
        ]
        );
}
function is_user_online($user_id)
{
    global $wpdb;
    $user_email = get_user_by('ID', $user_id)->user_email;
    $status = $wpdb->get_var("
    SELECT status FROM {$wpdb->prefix}users_status
    WHERE email = '".$user_email."' 
    ");
    if ($status == 1) {
        return true;
    }

    return false;
}

function get_user_link($user_id)
{
    $user_name = userInformation('username', $user_id);
    $renderHTML .= '<a href="'.home_url('user').'?user-id='.$user_id.'" >'.$user_name.'</a>';

    return $renderHTML;
}
//Notification
function get_value_finder_form($form_id, $key)
{
    global $wpdb;
    $title = $wpdb->get_var("
    SELECT $key FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
    ");

    return $title;
}
function user_link_detail($user_id, $user_name)
{
    $link = '<a href="'.home_url('user').'?user-id='.$user_id.'" >'.$user_name.'</a>';

    return $link;
}
function project_link_detail($form_id)
{
    $link = '<a href="'.home_url('form-detail').'?form-id='.$form_id.'">'.get_value_finder_form($form_id, 'title').'</a>';

    return $link;
}
function check_leader_of_form($user_id)
{
    global $wpdb;
    $form = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}finder_form
    WHERE user_id ='".$user_id."'
    ");

    return $form;
}
function analys_request($user_id)
{
    $forms = check_leader_of_form($user_id);

    foreach ($forms as $form) {
        $request = select_all_request($form->ID);
    }
    foreach ($request as $rq) {
        $status = $rq->request;
        $user_name = get_user_by('ID', $rq->member_id)->user_login;
        $title = get_value_finder_form($rq->form_id, 'title');
        if ($status == 1) {
            $renderHTML .= '<div class="notice-request-show">';
            $renderHTML .= '<input type="hidden" id="redirect-link" value="'.home_url('profile').'?mode=request">';
            $renderHTML .= user_link_detail($rq->member_id, $user_name).'&nbsp;';
            $renderHTML .= 'has send request to project &nbsp;<b>'.$title.'</b>';
            $renderHTML .= '<div>'.$rq->time_request.'</div>';
            $renderHTML .= '</div>';
        }
    }
    $request_via_invited = notice_via_invited($user_id);
    foreach ($request_via_invited as $request) {
        $createDate = new DateTime($request->time_request);
        $user_name = get_user_by('ID', $request->member_id)->user_login;
        $title = project_link_detail($request->form_id);
        $leader_name = get_user_by('ID', get_value_finder_form($request->form_id, 'user_id'))->user_login;
        $renderHTML .= '<div class="notice-request-show">';
        $renderHTML .= '<input type="hidden" id="redirect-link" value="'.home_url('profile').'?mode=request">';
        $renderHTML .= $createDate->format('Y-m-d').'&nbsp;&nbsp;';
        $renderHTML .= user_link_detail(get_value_finder_form($request->form_id, 'user_id'), $leader_name).'&nbsp;';
        $renderHTML .= 'have invited you to join project &nbsp;<b>'.$title.'</b>';
        $renderHTML .= '</div>';
    }

    return $renderHTML;
}
function count_numb_request($user_id)
{
    global $wpdb;
    $forms = check_leader_of_form($user_id);
    foreach ($forms as $form) {
        $request = $wpdb->get_results("
        SELECT * FROM {$wpdb->prefix}request
        WHERE form_id = '".$form->ID."' 
        AND request = 1
        ");
    }
    $count = count($request) + count(notice_via_invited($user_id));

    return $count;
}
function select_all_request($form_id)
{
    global $wpdb;
    $request = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}request
    WHERE form_id = '".$form_id."'
    ");

    return $request;
}

function notice_via_invited($user_id)
{
    global $wpdb;
    $request = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}request
    WHERE member_id = '".$user_id."'
    AND request = 0
    ");

    return $request;
}
