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
    $deadline = getDeadLine(); //20118-12-30.
    $is_validated_time = checkCloseDate($close_date, $deadline);
    if (!$is_validated_time['result']) {
        return array('result' => false, 'message' => 'Date to close form '.$is_validated_time['message']);
    }

    return array('result' => true);
}

// function checkCloseDate($close_date, $deadline)
// {
//     $date_format = '%H:%M:%S %d-%B-%Y';
//     $date_format_result = '%d-%B-%Y';
//     $deadline_result = strftime($date_format_result, $deadline);
//     $today = strftime($date_format);
//     $close_date = strftime($date_format, $close_date);
//     $deadline = strftime($date_format, $deadline);
//     if (strtotime($close_date) <= strtotime($deadline) &&
//         strtotime($close_date) - strtotime($today) >= 48 * 60 * 60) {
//         return array('result' => true);
//     }

//     return array('result' => false, 'message' => ' is before '.$deadline_result.' and after 48h from when the form opens.');
// }

function checkCloseDate($close_date, $deadline)
{
    $date_format = 'Y-m-d H:i:s';
    $today = date($date_format);
    if (strtotime($close_date) <= strtotime($deadline) &&
        strtotime($close_date) - strtotime($today) >= 48 * 60 * 60) {
        return array('result' => true);
    }

    return array('result' => false, 'message' => ' is before '.$deadline.' and after 48h from when the form opens');
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
    $deadline = getDeadLine();
    if (!titleCheck($title)['result']) {
        $message = titleCheck($title)['message'];

        return $message;
    } elseif (!descriptionCheck($description)['result']) {
        $message = descriptionCheck($description)['message'];

        return $message;
    } elseif (!closeDateCheck($close_date)['result']) {
        $message = closeDateCheck($close_date)['message'];

        return $message;
    } else {
        return true;
    }
}
function getDeadLine()
{
    global $wpdb;

    $deadline = $wpdb->get_var("
    SELECT end 
    FROM {$wpdb->prefix}semester 
    WHERE status = 1
    ");

    return $dead_line;
}
