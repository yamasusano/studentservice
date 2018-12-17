<?php

/*
Plugin Name: Manage semester
Description: Manage semester to help admin manage semester.
Version: 1.0.0
Author: Huy Le
Author URI: www.facebook.com/huymasterle
 */
include 'core/semester-add-new.php';
add_action('admin_init', 'manage_semester_style');
function manage_semester_style()
{
    wp_enqueue_style('semester-css', plugins_url('assets/css/style.css', __FILE__));
    wp_enqueue_script('manage-semester-js', plugins_url('assets/js/main.js', __FILE__), array('jquery'));
}

add_action('admin_menu', 'manage_semester_plugin_menu');
function manage_semester_plugin_menu()
{
    add_menu_page('Manage semesters', 'Manage Semester', 'manage_options', 'semester-settings', 'get_admin_semester_list');
    add_submenu_page('semester-settings', 'Add New', 'Add New', 'manage_options', 'add-new-semester', 'form_semester_add');
}

function get_admin_semester_list()
 {
     $HTML = '<div class="wrap"> ';
     $HTML .= '<h1 class="wp-heading-inline">Manage Semester List</h1>';
     $HTML .= '<button class="btn btn-md page-title-action" id="add-new-semester">Add new</button>';
     $HTML .= '<div class="form-add-new"></div>';
     $HTML .= '<div class="message">';
     if (isset($_POST['save-semester'])) {
     $HTML .= update_semester();
     }
     $HTML .= '</div>';
     $HTML .= admin_semester_list();
     $HTML .= '</div>';
     $HTML .= call_ajax_via_admin();
     echo  $HTML;
    } 

function call_ajax_via_admin(){
    $HTML .= '<script type="text/javascript">';
    $HTML .= 'var ajaxurl= "'.admin_url('admin-ajax.php').'"';
    $HTML .= '</script>';
    return $HTML;
}
function admin_semester_list()
{
    $HTML = '';
    $HTML = '<table class="semester-view wp-list-table widefat fixed striped pages">';
    $HTML .= '<tr>';
    $HTML .= '<th>Name</th>  <th>Start date</th> <th>End date</th> <th>Status</th> <th>Action</th>';
    $HTML .= '</tr>';
    $semester = query_semester();
    foreach ($semester as $semester) {
        $HTML .= '<tr>';
        $HTML .= '<td><input id="name-view" type="text" class="editable-major"  value="'.$semester->name.'" disabled/></td>';
        $HTML .= '<td><input id="start-date-view" type="date" class="editable-major" value="'.$semester->start.'" disabled/></td>';
        $HTML .= '<td><input id="end-date-view" type="date" class="editable-major" value="'.$semester->end.'" disabled/></td>';
        $HTML .= '<td><input value="'.get_semester_status($semester->status).'" type="text" class="editable-major" disabled/></td>';
        $HTML .= '<td>'.action_semester_item($semester).'</td>';
        $HTML .= '</tr>';
    }
    $HTML .= '</table>';
    return $HTML;
}

function get_semester_status($status)
{
    switch ($status) {
        case 2:
        $HTML .= 'Not yet';
        break;
        case 1:
        $HTML .= 'Available';
        break;
    }
    return $HTML;
}

function action_semester_item($semester)
{
    $HTML = '';
    $HTML .= '<form method="POST" style="padding:20px 0px">';
    $HTML .= '<input type="hidden" name="semester-id" value="'.$semester->ID.'"/>'; 
    $HTML .= '<input type="hidden" name="semester-name" class="editable-major"  value="'.$semester->name.'" />';
    $HTML .= '<input name="semester-start-date" type="hidden" class="editable-major" value="'.$semester->start.'" />';
    $HTML .= '<input name="semester-end-date" id="semester-end-date" type="hidden" class="editable-major" value="'.$semester->end.'"/>';
    $HTML .= '<button type="button" id="edit-semester" class= "btn btn-sm edit-major">Edit</button>';
    $HTML .= '</form>';
    return $HTML;
}

function query_semester()
{
    global $wpdb;
    $semester = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}semester
    WHERE status != 0
    ");
    return $semester;
}

function check_semester_end_date($name_semester, $end_date){
    $name_semester = trim($name_semester); 
    $season = substr($name_semester,0,2);
    $year = substr($name_semester, -4);
    $check_date;
    switch($season) {
        case 'SP':
            $check_date = $year.""."-05-01";
        break;

        case 'SU':
            $check_date = $year.""."-09-01";
        break;

        case 'FA':
            $year += 1;
            $check_date = $year.""."-01-01";
        break;
    }
    $check_date = DateTime::createFromFormat('Y-m-d', $check_date);
    $end_date = new DateTime($end_date);
    $diff = date_diff($end_date, $check_date);
    return (int) $diff->format('%r%a');
}

function update_semester()
{
    global $wpdb;
    $name_semester = $_POST['semester-name'];
    $end_date = $_POST['semester-end-date'];
    $check = check_semester_end_date($name_semester, $end_date);
    if ($check > 0) {
        $updated = $wpdb->update(
            "{$wpdb->prefix}semester",
            [
                'name' => $_POST['semester-name'],
                'end' => $_POST['semester-end-date'],
                'status' => 1,
            ],
            [
                'ID' => $_POST['semester-id'],
            ]
        );
        return '<div class="message-success">Update semester success</div>';
    } else {
        return '<div class="message-fail">The end date must be before the start date of next semester</div>';
    }
}
