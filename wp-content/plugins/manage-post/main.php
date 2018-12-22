<?php

/*
Plugin Name: Manage post
Description: Manage post to help admin manage semester.
Version: 1.0.0
Author: Huy Le
Author URI: www.facebook.com/huymasterle
 */
include 'core/post-add-new.php';
// add_action('admin_init', 'manage_post_style');
// function manage_post_style()
// {
//     wp_enqueue_style('post-css', plugins_url('assets/css/style.css', __FILE__));
//     wp_enqueue_script('manage-post-js', plugins_url('assets/js/main.js', __FILE__), array('jquery'));
// }

add_action('admin_menu', 'manage_post_plugin_menu');
function manage_post_plugin_menu()
{
    add_menu_page('Manage posts', 'Manage post', 'manage_options', 'post-settings', 'get_admin_post_list');
    add_submenu_page('post-settings', 'Add New', 'Add New', 'manage_options', 'add-new-post', 'form_post_add');
}

function get_admin_post_list()
{
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Manage Semester List</h1>';
    $HTML .= '<button class="btn btn-md page-title-action" id="add-new-semester">Add new</button>';
    $HTML .= '<div class="form-add-new"></div>';
    $HTML .= '<div class="message">';
    $HTML .= '</div>';
    $HTML .= admin_post_list();
    $HTML .= '</div>';
    echo  $HTML;
}

function admin_post_list()
{
    $HTML = '';
    $HTML = '<table class="post-view wp-list-table widefat fixed striped pages">';
    $HTML .= '<tr>';
    $HTML .= '<th>Title</th>  <th>Author</th> <th>Semester</th> <th>Status</th> <th>Date created</th> <th>Last modified</th>';
    $HTML .= '</tr>';
    $post = query_post();
    foreach ($post as $post) {
        $author = get_user_name($post->user_id);
        $HTML .= '<tr>';
        $HTML .= '<td>';
        $HTML .= '<a href="#" id="post_'.$post->ID.'">';
        $HTML .= '<div>'.$post->title.'</div>';
        $HTML .= '</a>';
        $HTML .= '</td>';
        $HTML .= '<td>';
        $HTML .= '<a href="#" id="user_'.$post->user_id.'">';
        $HTML .= '<div>'.$author.'</div>';
        $HTML .= '</a>';
        $HTML .= '</td>';
        $HTML .= '<td><input id="semester-view" type="text" class="editable-major" value="'.$post->semester.'" disabled/></td>';
        $HTML .= '<td><input value="'.admin_get_status_post($post->status).'" type="text" class="editable-major" disabled/></td>';
        $HTML .= '<td>'.$post->created_date_formated.'</td>';
        $HTML .= '<td>'.$post->updated_date_formated.'</td>';
        $HTML .= '</tr>';
    }
    $HTML .= '</table>';

    return $HTML;
}

function get_user_name($user_id)
{
    global $wpdb;
    $user_name = $wpdb->get_var("
    SELECT user_nicename 
    FROM {$wpdb->prefix}users 
    WHERE ID = '".$user_id."'
    ");

    return $user_name;
}

function admin_get_status_post($status)
{
    switch ($status) {
        case 0:
        $HTML .= 'Closed';
        break;
        case 1:
        $HTML .= 'Opening';
        break;
    }

    return $HTML;
}

function query_post()
{
    global $wpdb;
    $post = $wpdb->get_results("
    SELECT *,
    DATE_FORMAT(created_date, '%d-%m-%Y') as created_date_formated,
    DATE_FORMAT(updated_date, '%d-%m-%Y') as updated_date_formated 
    FROM {$wpdb->prefix}finder_form
    ");

    return $post;
}
