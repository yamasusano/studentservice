<?php

define('MAX_LENGTH_TITLE', 200);
function titleCheck($title)
{
    $title = formatText($title);
    $is_empty = validEmptyField($title);
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => 'Title'.$is_empty['message']);
    }

    return array('result' => true);
}
function descriptionCheck($description)
{
    $description = formatText($description);
    $is_empty = validEmptyField($description);
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => 'Description'.$is_empty['message']);
    }

    return array('result' => true);
}
function check_end_semester($close_date)
{
    $close_date = new DateTime($close_date);
    $deadline = new DateTime(getDeadLine());
    $diff = date_diff($close_date, $deadline);
    $check = (int) $diff->format('%r%a');
    if ($check < 0) {
        return array('result' => false, 'message' => 'Due Date must close before '.$deadline.'');
    }

    return array('result' => true);
}
function get_time_close_form($semester)
{
    global $wpdb;
    $time_close = $wpdb->get_var("
    SELECT close_form FROM {$wpdb->prefix}semester
    WHERE status = 0
    ");
    $semester_check = $wpdb->get_var("
    SELECT * FROM {$wpdb->prefix}semester
    WHERE status = 0
    AND name = '".$semester."'
    ");
    $close_date = new DateTime(date());
    $deadline = new DateTime($time_close);
    $diff = date_diff($deadline, $close_date);
    $check = (int) $diff->format('%r%a');
    if ($semester_check) {
        return array('result' => false, 'message' => 'Semester &nbsp;<b>'.$semester.'</b>&nbsp; started.You can\'t publish or edit group.');
    }

    return array('result' => true);
}

function validEmptyField($value)
{
    if (!empty($value)) {
        return array('result' => true);
    }

    return array('result' => false, 'message' => ' cannot empty. Please try again!!!');
}

function validMaxLength($value, $length)
{
    if (strlen($value) <= $length) {
        return array('result' => true);
    }

    return array('result' => false, 'message' => ' is not over '.$length.' characters.');
}

function formatText($value)
{
    return trim($value);
}
function validFormFinder($title, $description)
{
    $message = '';
    if (!titleCheck($title)['result']) {
        $message = titleCheck($title)['message'];

        return array('result' => false, 'message' => $message);
    } elseif (!descriptionCheck($description)['result']) {
        $message = descriptionCheck($description)['message'];

        return array('result' => false, 'message' => $message);
    } elseif (!check_end_semester($close_date)['result']) {
        $message = check_end_semester($close_date)['message'];

        return array('result' => false, 'message' => $message);
    }

    return array('result' => true);
}
function getDeadLine()
{
    global $wpdb;

    $deadline = $wpdb->get_var("
    SELECT end 
    FROM {$wpdb->prefix}semester 
    WHERE status = 1
    ");

    return $deadline;
}
