<?php

function delete_list_post()
{
    global $wpdb;
    $posts = json_decode(stripslashes_deep($_GET['arr-id']), true);
    $count = 0;
    $data = array();
    foreach ($posts as $form_id) {
        $title = export_form_info($form_id, 'title');
        $description = html_entity_decode(export_form_info($form_id, 'description'), ENT_NOQUOTES, 'UTF-8');
        $description = trim(preg_replace('/\s\s+/', ' ', $description));
        $data[] = array(
            'title' => $title,
            'description' => $description,
            'members' => export_members_port($form_id),
            'semester' => export_form_info($form_id, 'semester'),
            'supervisor' => export_suppervisor_port($form_id),
        );
        ++$count;
    }
    $export = json_encode($data, JSON_UNESCAPED_UNICODE);
    $directory = realpath(dirname(__FILE__).'/..').'/data/';
    $file_name = 'GPF_project_'.time().'_'.date('y-m-Y').'.json';
    if (file_put_contents($directory.$file_name, $export)) {
        foreach ($posts as $form_id) {
            delete_project($form_id);
        }

        return '<div class="message-success"> exported <b>'.$file_name.'</b> success</div>';
    } else {
        return '<div class="message-fail">export fail</div>';
    }

    return '<div class="message-error"><b>'.$count.'</b> Form has been deleted </div>';

    return $export;
}

function export_members_port($form_id)
{
    global $wpdb;
    $name = array();
    $members = $wpdb->get_results("
    SELECT member_id 
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_id != 2
    ");
    foreach ($members as $member) {
        $name[] = array(
            'name' => get_user_by('ID', $member->member_id)->user_login,
        );
    }

    return $name;
}

function export_suppervisor_port($form_id)
{
    global $wpdb;
    $supper = $wpdb->get_results("
    SELECT member_id 
    FROM {$wpdb->prefix}members
    WHERE form_id = '".$form_id."'
    AND member_id = 2
    ");

    $name = get_user_by('ID', $supper)->user_login;

    return $name;
}
function export_form_info($form_id, $key)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT $key FROM {$wpdb->prefix}finder_form
    WHERE ID = '".$form_id."'
    ");

    return $value;
}

function delete_project($form_id)
{
    global $wpdb;
    $request = $wpdb->delete(
        "{$wpdb->prefix}request",
        [
            'form_id' => $form_id,
        ]
    );
    $members = $wpdb->delete(
        "{$wpdb->prefix}members",
        [
            'form_id' => $form_id,
        ]
    );
    $group_chat = $wpdb->delete(
        "{$wpdb->prefix}group_chat",
        [
            'form_id' => $form_id,
        ]
    );
    $form_skill = $wpdb->delete(
        "{$wpdb->prefix}form_skill",
        [
            'form_id' => $form_id,
        ]
    );
    $group_chat = $wpdb->delete(
        "{$wpdb->prefix}groups",
        [
            'form_id' => $form_id,
        ]
    );
    $finder_form = $wpdb->delete(
        "{$wpdb->prefix}finder_form",
        [
            'ID' => $form_id,
        ]
    );
}
