<?php

include 'includes/core/profile/gpf-profile.php';
function get_average_mark_menu()
{
    if (info('role') == 'Student') {
        $render = '<div id="average mark" class="sub-menu-items">
    <i class="glyphicon glyphicon-hand-right"></i>
    <a>average mark</a>
</div>';
    }

    return $render;
}

function custom_update_avatar()
{
    $render .= '<div class="action-photo">';
    $render .= '<label for="upload-photo" >Browse...</label>';
    $render .= '<input type="file" name="photo" id="upload-photo"  accept="image/*"multiple="false" />';
    $render .= '<button type="submit" id="update-phote" class="btn btn-sm btn-primary">Save</button>';
    $render .= '<button type="button" id="update-phote"class="btn btn-sm btn-danger">Cancel</button>';
    $render .= '</div>';

    return $render;
}
