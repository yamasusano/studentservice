<?php

function post_new_finder_form()
{
    global $wpdb;
    $count_current_form = $wpdb->get_var("
    SELECT COUNT(*) 
    FROM {$wpdb->prefix}finder_form
    ");
}
