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
