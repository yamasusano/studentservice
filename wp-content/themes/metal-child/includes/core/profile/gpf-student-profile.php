<?php

function custom_update_avatar()
{
    $avatar = get_avatar(get_current_user_id());
    $renderHTML .= '<div id="show-avatar">';
    $renderHTML .= $avatar;
    $renderHTML .= '</div>';
    $renderHTML .= '<div id="avatar-box">';
    $renderHTML .= do_shortcode('[avatar_upload]');
    $renderHTML .= '</div>';
    echo $renderHTML;
}
