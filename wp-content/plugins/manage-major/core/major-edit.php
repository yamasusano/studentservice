<?php

function get_major_detail()
{
    $major_id = $_GET['major-id'];
    $major = majorDetail($major_id);
    $HTML = '';
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Major - '.$major->name.'</h1>';
    $HTML .= '<div class="message">';
    $HTML .= submit_update_major();
    $HTML .= '</div>';
    $HTML .= '<div class="major-content">';
    $HTML .= '<div class="col-md-6">';
    $HTML .= majorInfo($major_id);
    $HTML .= '</div>';
    $HTML .= '<div class="col-md-6">';
    $HTML .= get_major_skill($major_id);
    $HTML .= '</div>';
    $HTML .= '</div></div>';

    echo $HTML;
}
function majorInfo($major_id)
{
    $major = majorDetail($major_id);
    $HTML .= '<form id="major-edit" method="POST" enctype="multipart/form-data">';
    $HTML .= '<input id="major-id" name="major-id" type="hidden" value="'.$major_id.'"/>';
    $HTML .= '<div class="edit-new-major">';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Code</div>';
    $HTML .= '<div class="col-md-8"><input id="major-code" name="major-code" type="text" value="'.$major->code.'" required/></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Name</div>';
    $HTML .= '<div class="col-md-8"><input id="major-name" name="major-name" type="text" value="'.$major->name.'" required/></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Icon</div>';
    $HTML .= '<div class="col-md-8"><img id="img-view" src="'.$major->url_image.'" height="92" width="92"/></br>';
    $HTML .= '<input type="file" name="my_image_upload" id="my_image_upload" accept="image/*" multiple="false" style="margin-bottom:10px;"/></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Comment</div>';
    $HTML .= '<div class="col-md-8"><textarea name="major-comment" id="major-comment" cols="65" rows="5">'.$major->comment.'</textarea></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Status</div>';
    $HTML .= '<div class="col-md-8">'.select_major_status($major->status).'</div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group-button">';
    $HTML .= '<button type="submit" name="edit-major">Update</button>';
    $HTML .= '</div>';
    $HTML .= '</div>';
    $HTML .= '</form>';

    return $HTML;
}
function update_major()
{
    global $wpdb;
    $MAX_SIZE = 3000000;
    $directory = dirname(__FILE__).'/major_images/';
    $get_path = content_url('plugins/manage-major/major_images/');
    $major_id = $_POST['major-id'];
    $code = $_POST['major-code'];
    $name = $_POST['major-name'];
    $status = $_POST['major-status'];
    $comment = $_POST['major-comment'];
    $img_path = $_FILES['my_image_upload']['tmp_name'];
    $img_type = $_FILES['my_image_upload']['type'];
    $img_name = $name.'_'.$code.'_'.$major_id.'.'.substr($img_type, 6);
    $image_name = $name.'_'.$code.'_'.$major_id;
    if ($_FILES['my_image_upload']['size'] > $MAX_SIZE) {
        echo '<div class="message-error"> Image maximum size is 3Mb</div>';
    } else {
        //update usermetadata
        $major_before_update = get_major_before_update($major_id);
        $user = get_list_user_need_update($major_before_update);
        foreach ($user as $user) {
            update_major_usermetadata($user->ID, $name);
        }

        //update major
        if (!empty($img_path)) {
            $img_t = $wpdb->get_var("
            SELECT image_type 
            FROM {$wpdb->prefix}major 
            WHERE ID = '".$major_id."'
            ");
            if ($img_t) {
                unlink($directory.$image_name.'.'.$img_t);
            }
            $result = move_uploaded_file($img_path, $directory.$img_name);
            if (isset($major_id)) {
                $updated = $wpdb->update(
                    "{$wpdb->prefix}major",
                    [
                        'code' => $code,
                        'name' => $name,
                        'comment' => $comment,
                        'url_image' => $get_path.$img_name,
                        'status' => $status,
                    ],
                    [
                        'ID' => $major_id,
                    ]
                );
            }
            echo '<div class="message-error">Update major fail</div>';
        } else {
            if (isset($major_id)) {
                $updated = $wpdb->update(
                    "{$wpdb->prefix}major",
                    [
                        'code' => $code,
                        'name' => $name,
                        'comment' => $comment,
                        'image_type' => substr($img_type, 6),
                        'status' => $status,
                    ],
                    [
                        'ID' => $major_id,
                    ]
                );
            }
        }
        echo '<div class="message-success">Update major success</div>';
    }
}
function get_major_skill($major_id)
{
    $skills = set_major_skill($major_id);
    $HTML .= '<div class="major-skill-list">';
    $HTML .= '<h4>Responsibility</h4>';
    $HTML .= '<table id="skill-list" class="wp-list-table widefat fixed striped pages">';

    $HTML .= '<tr><th>Code</th><th>Name</th><th>status</th></tr>';
    foreach ($skills as $skill) {
        $HTML .= '<tr>';
        $HTML .= '<input type="hidden" class="skill-id" value="'.$skill->ID.'" />';
        $HTML .= '<td><input type="text" class="skill-code" value="'.$skill->subject_code.'" required/></td>';
        $HTML .= '<td><input type="text" class="skill-name" value="'.$skill->name.'"/></td>';
        $HTML .= '<td>';
        $HTML .= '<button name="save" class="save-skill btn"><i class="fa fa-floppy-o" aria-hidden="true"></i></button>';
        $HTML .= '<button name="remove" class="remove-skill btn"><i class="fa fa-trash" aria-hidden="true"></i></button>';
        $HTML .= '</td>';
        $HTML .= '</tr>';
    }
    $HTML .= '<tr><td colspan="3"><button id="add-new-skill"><i class="fa fa-plus-square" aria-hidden="true"></i></button></td></tr>';
    $HTML .= '</table>';
    $HTML .= '<div id="message"></div>';
    $HTML .= '</div>';

    return $HTML;
}
function set_major_skill($major_id)
{
    global $wpdb;
    $skills = $wpdb->get_results("
    SELECT * FROM {$wpdb->prefix}skill_major
    WHERE major_id = '".$major_id."'
    ");

    return $skills;
}
function majorDetail($major_id)
{
    global $wpdb;
    $result = $wpdb->get_results("
        SELECT *  FROM {$wpdb->prefix}major
        WHERE ID  = '".$major_id."'
        ");

    return $result[0];
}
function submit_update_major()
{
    if (isset($_POST['edit-major'])) {
        update_major();
    }
}

function get_major_before_update($major_id)
{
    global $wpdb;
    $major = $wpdb->get_var("
    SELECT name
    FROM {$wpdb->prefix}major
    WHERE ID = '".$major_id."'
    ");

    return $major;
}

function get_list_user_need_update($major_name)
{
    global $wpdb;
    $users = $wpdb->get_results("
    SELECT * 
    FROM {$wpdb->prefix}usermetaData
    WHERE meta_key ='major' AND meta_value like '".$major_name."'
    ");

    return $users;
}

function update_major_usermetadata($id, $major_new_name)
{
    global $wpdb;
    $updated = $wpdb->update(
        "{$wpdb->prefix}usermetaData",
        [
            'meta_value' => $major_new_name,
        ],
        [
            'ID' => $id,
        ]
    );
}

function select_major_status($major_status)
{
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

    return $HTML;
}

function delete_major_skill($id)
{
    global $wpdb;
    $delete = $wpdb->delete(
    "{$wpdb->prefix}skill_major",
    [
        'ID' => $id,
    ]
    );
    if ($delete) {
        return '<div class="message-error"> delete responsibility success</div>';
    } else {
        return '<div class="message-error">delete responsibility fail</div>';
    }
}
function add_new_major_skill($major_id, $name, $code)
{
    global $wpdb;
    $insert = $wpdb->insert(
        "{$wpdb->prefix}skill_major",
        [
            'major_id' => $major_id,
            'subject_code' => $code,
            'name' => $name,
        ]
        );
    if ($update) {
        return '<div class="message-success">Add new responsibility success</div>';
    } else {
        return '<div class="message-error">Add new responsibility fail</div>';
    }
}
function update_major_skill($id, $name, $code)
{
    global $wpdb;
    $update = $wpdb->update(
        "{$wpdb->prefix}skill_major",
        [
            'subject_code' => $code,
            'name' => $name,
        ],
        [
            'ID' => $id,
        ]
        );
    if ($update) {
        return '<div class="message-success"> update responsibility success</div>';
    } else {
        return '<div class="message-error">update responsibility fail</div>';
    }
}

add_action('wp_ajax_nopriv_get_action_skill', 'get_action_skill');
add_action('wp_ajax_get_action_skill', 'get_action_skill');
function get_action_skill()
{
    $type = $_POST['type'];
    $id = $_POST['id'];
    $name = $_POST['name'];
    $code = $_POST['code'];
    $message = '';
    switch ($type) {
        case 'save':
        $message = update_major_skill($id, $name, $code);
            break;
        case 'remove':
        $message = delete_major_skill($id);
            break;
        default:
            break;
    }
    echo wp_send_json(['message' => $message]);
    die();
}
add_action('wp_ajax_nopriv_add_new_skill_major', 'add_new_skill_major');
add_action('wp_ajax_add_new_skill_major', 'add_new_skill_major');
function add_new_skill_major()
{
    $major_id = $_POST['major-id'];
    $name = $_POST['name'];
    $code = $_POST['code'];
    $message = add_new_major_skill($major_id, $name, $code);
    $reload = get_major_skill($major_id);
    echo wp_send_json(['message' => $message, 'reload' => $reload]);
    die();
}
