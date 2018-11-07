<?php

function get_teacher_group()
{
    $renderHTML = '';
    $user_role = info('role');
    if ($user_role == 'Student') {
        $renderHTML .= '<div id="my-group" class="sub-menu-items">
        <i class="glyphicon glyphicon-hand-right"></i>
        <a>My Group</a>
    </div>
    <div id="other-group" class="sub-menu-items">
        <i class="glyphicon glyphicon-hand-right"></i>
        <a>Other</a>
    </div>';
    } else {
        $renderHTML .= '<div id="my-groups" class="sub-menu-items">
        <i class="glyphicon glyphicon-hand-right"></i>
        <a>My Groups</a>
        </div>
        <div id="student-groups" class="sub-menu-items">
        <i class="glyphicon glyphicon-hand-right"></i>
        <a>Student groups</a>
        </div>';
    }
    $renderHTML .= '<div id="manage-request" class="sub-menu-items"><a>Manage request</a></div>';

    return $renderHTML;
}
