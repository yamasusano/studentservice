<?php

define('MAX_LENGTH_TITLE', 200);
define('MAX_LENGTH_DESCRIPTION', 400);
function titleCheck($title)
{
    $title = formatText($title);
    $is_empty = validEmptyField($title);
    $is_over_length = validMaxLength($title, constant('MAX_LENGTH_TITLE'));
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => 'Title'.$is_empty['message']);
    } elseif (!$is_over_length['result']) {
        return array('result' => false, 'message' => 'Title'.$is_over_length['message']);
    }

    return array('result' => true);
}
function descriptionCheck($description)
{
    $description = formatText($description);
    $is_empty = validEmptyField($description);
    $is_over_length = validMaxLength($description, constant('MAX_LENGTH_DESCRIPTION'));
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => 'Description'.$is_empty['message']);
    } elseif (!$is_over_length['result']) {
        return array('result' => false, 'message' => 'Description'.$is_over_length['message']);
    }

    return array('result' => true);
}
function closeDateCheck($close_date)
{
    $close_date = new DateTime($close_date);
    $today = new DateTime(date('Y-m-d'));

    $diff = date_diff($today, $close_date);
    $check = (int) $diff->format('%r%a');
    if ($check < 2) {
        return array('result' => false, 'message' => 'Due Date must close at least 2 day from today.');
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
function validFormFinder($title, $description, $close_date)
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
    } elseif (!closeDateCheck($close_date)['result']) {
        $message = closeDateCheck($close_date)['message'];

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
