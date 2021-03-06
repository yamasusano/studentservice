<?php

function get_admin_batch_list()
{
    $last_batch = substr(get_last_batch(), 0, strlen() - 2) + 1;
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Manage Batch List</h1>';
    $HTML .= '<button class="btn btn-md page-title-action" id="add-new-batch">Add new</button>';
    $HTML .= '<form id="form-add-new-batch" method="POST" >';
    $HTML .= '<b class="wp-heading-inline"> Do you want to add batch '.$last_batch.'_A ,'.$last_batch.'_B ,'.$last_batch.'_C ?</b>';
    // $HTML .= '<div>';
    $HTML .= '<button type="submit" id="add-new-batch" name="add-new-batch" class= "btn btn-sm edit-major">OK</button>';
    $HTML .= '<button type="button" id="cancel-add-new-batch" class= "btn btn-sm edit-major">Cancel</button>';
    // $HTML .= '</div>';
    $HTML .= '</form>';
    $HTML .= '<div class="message">';
    if (isset($_POST['add-new-batch'])) {
        $HTML .= insert_batch($last_batch);
    }
    if (isset($_POST['save-batch'])) {
        $HTML .= update_batch();
    }
    $HTML .= '</div>';
    $HTML .= admin_batch_list();
    echo  $HTML;
}
function insert_batch($last_batch)
{
    global $wpdb;
    $insert = $wpdb->insert(
        "{$wpdb->prefix}semester_level",
        [
            'level' => $last_batch.'_A',
        ]
    );
    $insert = $wpdb->insert(
        "{$wpdb->prefix}semester_level",
        [
            'level' => $last_batch.'_B',
        ]
    );
    $insert = $wpdb->insert(
        "{$wpdb->prefix}semester_level",
        [
            'level' => $last_batch.'_C',
        ]
    );
    if ($insert) {
        echo '<div class="message-success">Insert batch successful</div>';
    } else {
        echo '<div class="message-error">Insert batch fail</div>';
    }
}

function get_last_batch()
{
    global $wpdb;
    $last_batch = $wpdb->get_var("
    SELECT level 
    FROM {$wpdb->prefix}semester_level
    ORDER BY ID DESC limit 1
    ");

    return $last_batch;
}

function admin_batch_list()
{
    $HTML = '';
    $HTML = '<table class="batch-view wp-list-table widefat fixed striped pages">';
    $HTML .= '<tr><th>ID</th> <th>Batch</th></tr>';
    $batch = query_batch();
    foreach ($batch as $batch) {
        $HTML .= '<tr>';
        $HTML .= '<td><input id="id-view" type="text" class="editable-major"  value="'.$batch->ID.'" disabled/></td>';
        $HTML .= '<td><input id="level-view" type="text" class="editable-major" value="'.$batch->level.'" disabled/></td>';
        $HTML .= '</tr>';
    }
    $HTML .= '</table>';

    return $HTML;
}

function query_batch()
{
    global $wpdb;
    $batch = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}semester_level
    order by ID DESC
    ");

    return $batch;
}

function check_duplicate_batch_name($batch_name)
{
    global $wpdb;
    $batch = $wpdb->get_var("
    SELECT * 
    FROM {$wpdb->prefix}semester_level
    WHERE level like '".$batch_name."'
    ");

    return $batch ? true : false;
}

function update_batch()
{
    global $wpdb;
    $batch_name = $_POST['batch-name'];
    if (check_duplicate_batch_name($batch_name)) {
        return '<div class="message-success">Batch name already exist</div>';
    } else {
        $updated = $wpdb->update(
            "{$wpdb->prefix}semester_level",
            [
                'level' => $batch_name,
            ],
            [
                'ID' => $_POST['batch-id'],
            ]
        );

        return '<div class="message-success">Update batch successful</div>';
    }
}
