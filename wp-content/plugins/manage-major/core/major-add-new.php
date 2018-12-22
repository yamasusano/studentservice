<?php

function createNewMajor()
{
    global $wpdb;
    $insert = $wpdb->insert(
        "{$wpdb->prefix}major",
        [
            'code' => $_POST['major-code'],
            'name' => $_POST['major-name'],
            'comment' => $_POST['major-comment'],
            'status' => 1,
        ]
    );
    if ($insert) {
        echo '<div class="message-success">Insert major success</div>';
    } else {
        echo '<div class="message-error">Insert major fail</div>';
    }
}

function form_major_add()
{
    $HTML = '';
    $HTML = '<div class="wrap"> ';
    $HTML .= '<h1 class="wp-heading-inline">Add New Major</h1>';
    $HTML .= '<div class="message">';
    $HTML .= submit_form();
    $HTML .= '</div>';
    $HTML .= '<div class="add-new-major">';
    $HTML .= '<form id="form-add-new" method="POST" enctype="multipart/form-data">';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Code</div>';
    $HTML .= '<div class="col-md-8"><input id="major-code" name="major-code" type="text" /></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Name</div>';
    $HTML .= '<div class="col-md-8"><input id="major-name" name="major-name" type="text" /></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Icon</div>';
    $HTML .= '<div class="col-md-8"><input type="file" name="my_image_upload" id="my_image_upload" accept="image/*" multiple="false" style="margin-bottom:10px;"/></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group">';
    $HTML .= '<div class="col-md-4 title">Comment</div>';
    $HTML .= '<div class="col-md-8"><textarea name="major-comment" id="major-comment" cols="65" rows="5"></textarea></div>';
    $HTML .= '</div>';
    $HTML .= '<div class="form-group-button">';
    $HTML .= '<button type="submit" name="add-new">Publish</button>';
    $HTML .= '</div>';
    $HTML .= '</form>';
    $HTML .= '</div>';
    $HTML .= '</div>';

    echo $HTML;
}
function submit_form()
{
    if (isset($_POST['add-new'])) {
        createNewMajor();
    }
}
