<?php

/*
Plugin Name: Manage post
Description: Manage post to help admin manage semester.
Version: 1.0.0
Author: Huy Le
Author URI: www.facebook.com/huymasterle
 */
include 'core/filter.php';
include 'core/delete.php';
add_action('admin_init', 'manage_post_style');
function manage_post_style()
{
    wp_enqueue_style('post-css', plugins_url('assets/css/style.css', __FILE__));
    wp_enqueue_script('manage-post-js', plugins_url('assets/js/main.js', __FILE__), array('jquery'));
}

add_action('admin_menu', 'manage_post_plugin_menu');
function manage_post_plugin_menu()
{
    add_menu_page('Manage Posts', 'Manage Post', 'manage_options', 'manage-post', 'get_admin_post_list');
}

function get_admin_post_list()
{
    $semester = $_GET['semester'];
    $currPage = $_GET['pagin'];
    $HTML .= '<div class="wrap"> ';

    $HTML .= '<h1 class="wp-heading-inline">Manage Projects</h1>';
    $HTML .= '<div class="message">';
    if (isset($_GET['do-action'])) {
        $post = $_GET['save-post'];
        if ($post == 'delete') {
            $HTML .= delete_list_post();
        }
    }
    $HTML .= '</div>';
    $HTML .= '<form method="get">';
    $HTML .= '<input type="hidden" name="page" value="manage-post" /> ';
    $HTML .= '<input type="hidden" id="str" name="arr-id" value="" />';
    $HTML .= '<div class="post-wrap"> ';
    $HTML .= filter_post($semester);
    $HTML .= '<div class="pagination">';
    $HTML .= '<span>'.count(result_all_post($semester)).' items &nbsp;&nbsp;&nbsp;</span>';
    $HTML .= pagination_result_search_post($currPage, $semester);
    $HTML .= '</div>';
    $HTML .= '</div>';
    $HTML .= all_post_list($currPage, $semester);
    $HTML .= '</div>';
    $HTML .= '</form>';
    echo  $HTML;
}
function filter_post($semes)
{
    $semesters = semester_down_list();
    $HTML .= '<div class="filter-post"> ';
    $HTML .= action_save();
    $HTML .= '<div class="semester-box"> ';
    $HTML .= '<select id="semester" name="semester"> ';
    $HTML .= '<option value="">All</option>';
    foreach ($semesters as $semester) {
        if ($semes == $semester->semester) {
            $HTML .= '<option value="'.$semes.'" selected>'.$semes.'</option>';
        } else {
            $HTML .= '<option value="'.$semester->semester.'">'.$semester->semester.'</option>';
        }
    }

    $HTML .= '</select>';
    $HTML .= '<input type="submit" name="filter-semester" class="button action" value="search" />';
    $HTML .= '</div>';
    $HTML .= '</div>';

    return $HTML;
}
function pagination_post()
{
}
function action_save()
{
    $HTML .= '<div class="action-box">';
    $HTML .= '<select id="action" name="save-post"> ';
    $HTML .= '<option value="-1">Bulk Actions</option>';
    $HTML .= '<option value="delete">Delete</option>';
    $HTML .= '</select>';
    $HTML .= '<input type="submit" name="do-action" class="button action" value="Apply" />';
    $HTML .= '</div>';

    return $HTML;
}
function all_post_list($currPage, $semester)
{
    $post = result_each_post($currPage, $semester);
    $HTML = '';
    $HTML = '<table id="post-view" class="wp-list-table widefat fixed striped pages">';
    $HTML .= '<tr>';
    $HTML .= '<th><input type="checkbox" id="select-all"/><th>Role</th></th> <th>Title</th>  <th>Author</th> <th>Semester</th> <th>Status</th> <th>Date created</th> <th>Last modified</th>';
    $HTML .= '</tr>';
    foreach ($post as $post) {
        $author = get_user_by('ID', $post->user_id)->user_login;
        $type = get_form_type($post->user_id, 'role');
        $HTML .= '<tr>';
        $HTML .= '<input type="hidden" name="post-id" value="'.$post->ID.'"/>';
        $HTML .= '<td><input type="checkbox" name="check-item" id="check-'.$post->ID.'"/></td>';
        $HTML .= '<td>'.($type == 1 ? 'Student' : 'Teacher').'</td>';
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

function admin_get_status_post($status)
{
    switch ($status) {
        case 0:
        $HTML = 'Closed';
        break;
        case 1:
        $HTML = 'Opening';
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
    LIMIT 1,20
    ");

    return $post;
}
function get_form_type($user_id, $key)
{
    global $wpdb;
    $value = $wpdb->get_var("
    SELECT meta_value 
    FROM {$wpdb->prefix}usermetaData
    WHERE meta_key ='".$key."' 
    AND user_id = '".$user_id."'
    ");

    return $value;
}
