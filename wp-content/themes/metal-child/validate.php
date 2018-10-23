<?php
define("MAX_LENGTH_TITLE",200);
define("MAX_LENGTH_DESCRIPTION",400);
function titleCheck($title)
{
    $title = formatText($title);
    $is_empty = validEmptyField($title);
    $is_over_length = validMaxLength($title, constant("MAX_LENGTH_TITLE"));
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => $is_empty['message']);
    } else if (!$is_over_length['result']){
        return array('result' => false, 'message' => $is_over_length['message']);
    }
    return array('result' => true);
}

function formatText($value)
{
    return trim($value);
}

function descriptionCheck($description)
{
    $description = formatText($description);
    $is_empty = validEmptyField($description);
    $is_over_length = validMaxLength($description, constant("MAX_LENGTH_DESCRIPTION"));
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => $is_empty['message']);
    } else if (!$is_over_length['result']){
        return array('result' => false, 'message' => $is_over_length['message']);
    }
    return array('result' => true);
}

function validEmptyField($value)
{
    if (!empty($value)) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' field cannot empty. Please try again!!!');
}

function validMaxLength($value, $length)
{
    if (strlen($value) <= $length) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' field is not over '.$length.' characters');
}

function closeDateCheck($close_date)
{
    $deadline = "10-09-2018";
    $is_validated_time = validCloseDate($close_date, $deadline);
    if (!$is_validated_time['result']) {
        return array('result' => false, 'message' => $is_validated_time['message']);
    }
    return array('result' => true);
}

function checkCloseDate($close_date, $deadline)
{
    $date_format = "%H:%M:%S %d-%B-%Y";
    $date_format_result = "%d-%B-%Y";
    $deadline_result = strftime($date_format_result, $deadline);
    $today = strftime($date_format);
    $close_date = strftime($date_format, $close_date);
    $deadline = strftime($date_format, $deadline);
    if (strtotime($close_date) <= strtotime($deadline) &&
        strtotime($close_date) - strtotime($today) >= 48*60*60) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' is before '.$deadline_result.' and after 48h from when the form opens');
}