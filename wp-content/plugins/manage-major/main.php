<?php

/*
Plugin Name: Manage major
Description: Manage major to help admin manage major in semester.
Version: 1.0.0
Author: Huy Le
Author URI: www.facebook.com/huymasterle
 */
include 'core/major-add-new.php';
add_action('admin_init', 'manage_major_style');
function manage_major_style()
{
    wp_enqueue_style('myStyleSheet', plugins_url('assets/css/style.css', __FILE__));
    wp_enqueue_script('manage-major-js', plugins_url('assets/js/main.js', __FILE__), array('jquery'));
}

add_action('admin_menu', 'manage_major_plugin_menu');
 function manage_major_plugin_menu()
 {
     add_menu_page('Manage majors', 'Manage Major', 'manage_options', 'major-settings', 'get_admin_major_list');
     add_submenu_page('major-settings', 'Add New', 'Add New', 'manage_options', 'add-new-major', 'form_major_add');
 }

function get_admin_major_list()
{
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Major List</h1>';
    $HTML .= '<a href="'.admin_url('admin.php').'?page=add-new-major" class="btn btn-md page-title-action" id="add-new-major">Add new</a>';
    $HTML .= '<div class="form-add-new"></div>';
    $HTML .= '<div class="message"></div>';
    $HTML .= admin_major_list();
    $HTML .= '</div>';
    $HTML .= '<script type="text/javascript">';
    $HTML .= 'var ajaxurl= "'.admin_url('admin-ajax.php').'"';
    $HTML .= '</script>';
    echo  $HTML;
    if (isset($_POST['save-major'])) {
        update_major();
    }
    if (isset($_POST['add-new-major'])) {
        createNewMajor();
    }
}

function admin_major_list()
{
    $HTML = '';
    $HTML = '<table class="major-view wp-list-table widefat fixed striped pages">';
    $HTML .= '<tr>';
    $HTML .= '<th>Code</th> <th>Name</th>  <th>Icon</th> <th><span class="vers comment-grey-bubble"></span></th> <th>Date modified</th> <th>Status</th> <th>Action</th>';
    $HTML .= '</tr>';
    $majors = query_major();
    foreach ($majors as $major) {
        $HTML .= '<tr>';
        $HTML .= '<td><input id="code-view" type="text" class="editable-major" value="'.$major->code.'" disabled/></td>';
        $HTML .= '<td><input id="name-view" type="text" class="editable-major" value="'.$major->name.'" disabled/></td>';
        $HTML .= '<td><img src="'.$major->url_image.'" height="92" width="92"/></td>';
        if (empty($major->comment)) {
            $HTML .= '<td>-</td>';
        } else {
            $HTML .= '<td id="major-comment">'.$major->comment.'</td>';
        }
        $HTML .= '<td>'.$major->date_created.'</td>';
        $HTML .= '<td id="'.$major->status.'" >'.get_major_status($major->status).'</td>';
        $HTML .= '<td>'.action_major_item($major).'</td>';
        $HTML .= '</tr>';
    }
    $HTML .= '</table>';
    return $HTML;
}

function get_major_status($status)
{
    switch ($status) {
        case 0:
        $HTML .= 'Closed';
        break;
        case 1:
        $HTML .= 'Openning';
        break;
    }

    return $HTML;
}

function action_major_item($major)
{
    $HTML = '';
    $HTML .= '<form method="POST" enctype="multipart/form-data" style="padding:20px 0px">';
    $HTML .= '<button type="button" id="edit-major" class= "btn btn-sm edit-major">Edit</button>';
    $HTML .= '<input type="hidden" name="major-id" value="'.$major->ID.'"/>';
    $HTML .= '<input type="hidden" name="major-code" id="major-code" value="'.$major->code.'"/>';
    $HTML .= '<input type="hidden" name="major-name" id="major-name" value="'.$major->name.'"/>';
    $HTML .= '<input type="hidden" name="major-status-value" id="major-status-value" value="'.$major->status.'"/>';
    $HTML .= '<textarea name="major-comment" id="major-comment-edit" style="display:none;"></textarea>';
    $HTML .= '</form>';

    return $HTML;
}

function query_major()
{
    global $wpdb;
    $majors = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}major
    ");
    return $majors;
}

function get_major_before_update($major_id){
    global $wpdb;
    $major = $wpdb->get_var("
    SELECT name 
    FROM {$wpdb->prefix}major
    WHERE ID = '".$major_id."'
    ");
    return $major;
}

function get_list_user_need_update($major_name){
    global $wpdb;
    $users = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}usermetaData
    WHERE meta_key ='major' AND meta_value like '".$major_name."'
    ");
    return $users;
}

function update_major_usermetadata($id, $major_new_name){
    global $wpdb;
    $updated = $wpdb->update(
        "{$wpdb->prefix}usermetaData",
        [
            'meta_value' => $major_new_name
        ],
        [
            'ID' => $id,
        ]
    );
}

function update_major()
{
    global $wpdb;
    $MAX_SIZE = 3000000;
    $directory = dirname(__FILE__).'/major_images/';
    $get_path = content_url('plugins/manage-major/major_images/');
    $img_path = $_FILES['my_image_upload']['tmp_name'];
    $img_type = $_FILES['my_image_upload']['type'];
    $img_name = $_POST['major-name'].'_'.$_POST['major-code'].'_'.$_POST['major-id'].'.'.substr($img_type, 6);
    $image_name = $_POST['major-name'].'_'.$_POST['major-code'].'_'.$_POST['major-id'];
    if ($_FILES['my_image_upload']['size'] > $MAX_SIZE) {
        echo '<div class="message-error"> Image maximum size is 3Mb</div>';
    } else {
        //update usermetadata
        $major_before_update = get_major_before_update($_POST['major-id']);
        $user = get_list_user_need_update($major_before_update);
        foreach ($user as $user){
            update_major_usermetadata($user->ID, $_POST['major-name']);
        }

        //update major
        if (!empty($img_path)) {
            $img_t = $wpdb->get_var("
            SELECT image_type 
            FROM {$wpdb->prefix}major 
            WHERE ID = '".$_POST['major-id']."'
            ");
            if ($img_t) {
                unlink($directory.$image_name.'.'.$img_t);
            }
            $result = move_uploaded_file($img_path, $directory.$img_name);
            if (isset($_POST['major-id'])) {
                $updated = $wpdb->update(
                    "{$wpdb->prefix}major",
                    [
                        'code' => $_POST['major-code'],
                        'name' => $_POST['major-name'],
                        'comment' => $_POST['major-comment'],
                        'url_image' => $get_path.$img_name,
                        'image_type' => substr($img_type, 6),
                        'status' => $_POST['major-status-value'],
                    ],
                    [
                        'ID' => $_POST['major-id'],
                    ]
                );
            }
        } else {
            if (isset($_POST['major-id'])) {
                $updated = $wpdb->update(
                    "{$wpdb->prefix}major",
                    [
                        'code' => $_POST['major-code'],
                        'name' => $_POST['major-name'],
                        'comment' => $_POST['major-comment'],
                        'image_type' => substr($img_type, 6),
                        'status' => $_POST['major-status-value'],
                    ],
                    [
                        'ID' => $_POST['major-id'],
                    ]
                );
            }
        }
        echo '<div class="message-success">Update major success</div>';
    }
}

add_action('wp_ajax_nopriv_select_major_status', 'select_major_status');
add_action('wp_ajax_select_major_status', 'select_major_status');

function select_major_status()
{
    $major_status = $_POST['status'];
    $HTML = '';
    $HTML .= '<select name="major-status" id="major-status">';
    switch ($major_status) {
    case 0:
        $HTML .= '<option value="0" seleted>Close</option>';
        $HTML .= '<option value="1" >Open</option>';
        break;
    case 1:
        $HTML .= '<option value="1" seleted>Open</option>';
        $HTML .= '<option value="0" >Close</option>';
        break;
}
    $HTML .= '</select>';

    echo wp_send_json(['content' => $HTML]);
    die();
}

add_action('wp_ajax_nopriv_add_new_major', 'add_new_major');
add_action('wp_ajax_add_new_major', 'add_new_major');
function add_new_major()
{
    echo wp_send_json(['content' => submit_new_major()]);
    die();
}

function get_image($image, $name, $code, $id)
{
    global $wpdb;
    $MAX_SIZE = 3000000;
    $directory = dirname(__FILE__).'/major_images/';
    $get_path = content_url('plugins/manage-major/major_images/');
    $img_path = $image['tmp_name'];
    $img_type = $image['type'];
    $img_size = $image['size'];
    $img_name = $name.'_'.$code.'_'.$id.'.'.substr($img_type, 6);
    $image_name = $name.'_'.$code.'_'.$id;
    if ($image['size'] > $MAX_SIZE) {
        return array('result' => false, 'message' => '<div class="message-error"> Image maximum size is 3Mb</div>');
    }
    return array('result' => true);
}
