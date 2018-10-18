<?php

function get_list_form()
{
    global $wpdb;
    $form_view = $wpdb->get_results("
    SELECT *
    FROM {$wpdb->prefix}finder_form
    ");
}
function list_form()
{
    $renderHTML = '';
}
