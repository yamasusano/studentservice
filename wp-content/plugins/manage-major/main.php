<?php

/*
Plugin Name: Manage major
Description: Manage major to help admin manage major in semester.
Version: 1.0.0
Author: Huy Le
Author URI: www.facebook.com/huymasterle
 */
include 'core/major-add-new.php';
include 'core/major-edit.php';
add_action('admin_init', 'manage_major_style');
function manage_major_style()
{
    wp_enqueue_style('myStyleSheet', plugins_url('assets/css/style.css', __FILE__));
    wp_enqueue_style('load-fa', 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');
    wp_enqueue_script('majors-js', plugins_url('assets/js/main.js', __FILE__));
}

add_action('admin_menu', 'manage_major_plugin_menu');
 function manage_major_plugin_menu()
 {
     add_menu_page(null, 'Manage Major', 'manage_options', 'major-settings', 'get_admin_major_list');
     add_submenu_page('major-settings', 'Add New', 'Add New', 'manage_options', 'add-new-major', 'form_major_add');
     add_submenu_page(null, '', '', 'administrator', 'major-edit', 'get_major_detail');
 }

function get_admin_major_list()
{
    $HTML = '<div class="wrap"> ';
    $HTML .= '<script type="text/javascript">';
    $HTML .= 'var ajaxurl= "'.admin_url('admin-ajax.php').'"';
    $HTML .= '</script>';
    echo  $HTML;
    $HTML .= '<h1 class="wp-heading-inline">Major List</h1>';
    $HTML .= '<a href="'.admin_url('admin.php').'?page=add-new-major" class="btn btn-md page-title-action" id="add-new-major">Add new</a>';
    $HTML .= '<div class="form-add-new"></div>';
    $HTML .= '<div class="message"></div>';
    $HTML .= admin_major_list();
    $HTML .= '</div>';
    echo  $HTML;
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
        $HTML .= '<td>'.$major->format_date_created.'</td>';
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
    $HTML .= '<form action="'.admin_url('admin.php').'" method="GET" style="padding:20px 0px">';
    $HTML .= '<button type="submit" id="edit-major" class= "btn btn-sm edit-major">Edit</button>';
    $HTML .= '<input type="hidden" name="page" value="major-edit"/>';
    $HTML .= '<input type="hidden" name="major-id" value="'.$major->ID.'"/>';
    $HTML .= '</form>';

    return $HTML;
}
add_action('wp_ajax_nopriv_select_major_status', 'select_major_status');
add_action('wp_ajax_select_major_status', 'select_major_status');
function query_major()
{
    global $wpdb;
    $majors = $wpdb->get_results("
    SELECT *, DATE_FORMAT(date_created, '%d-%m-%Y') as format_date_created
    FROM {$wpdb->prefix}major
    ");

    return $majors;
}
