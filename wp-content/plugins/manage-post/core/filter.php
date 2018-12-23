<?php

function semester_down_list()
{
    global $wpdb;
    $semester = $wpdb->get_results("
    SELECT DISTINCT semester 
    FROM {$wpdb->prefix}finder_form
    ");

    return $semester;
}

function pagination_result_search_post($currPage, $semester)
{
    $count = count(result_all_post($semester));
    if (is_null($currPage)) {
        $paged = 1;
    } else {
        $paged = (int) $currPage;
    }
    $total_page = ceil($count / 20);
    $start = $paged - 2;
    $end = $paged + 2;
    if ($start < 1) {
        $start = 1;
    }

    if ($end > $total_page) {
        $end = $total_page;
    }
    $render = '';
    for ($i = $start; $i <= $end; ++$i) {
        if ($i === $paged) {
            $render .= '<a class="active">'.$i.'</a>';
        } else {
            $render .= '<a href='.admin_url('admin.php').'?page=manage-post&pagin='.$i.'&semester='.urlencode($semester).'>'.$i.'</a>';
        }
    }

    return $render;
}

function result_each_post($currPage, $semester)
{
    global $wpdb;
    $result = '';
    if (is_null($currPage)) {
        $paged = 1;
    } else {
        $paged = (int) $currPage;
    }
    $start = ($paged - 1) * 20;
    $get_results = $wpdb->get_results("
        SELECT *,
    DATE_FORMAT(created_date, '%d-%m-%Y') as created_date_formated,
    DATE_FORMAT(updated_date, '%d-%m-%Y') as updated_date_formated 
        FROM {$wpdb->prefix}finder_form
        WHERE semester LIKE '%".$semester."%'
        LIMIT $start , 20");

    return $get_results;
}
function result_all_post($semester)
{
    global $wpdb;
    $get_results = $wpdb->get_results("
        SELECT * 
        FROM {$wpdb->prefix}finder_form
        WHERE semester LIKE '%".$semester."%'
        ");

    return $get_results;
}
