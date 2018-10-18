<?php
define("MAX_LENGTH_TITLE",3);
define("MAX_LENGTH_DESCRIPTION",400);
function titleCheck($title)
{
    $title = formatText($title);
    $is_empty = validEmptyField($title);
    $is_over_length = validCloseDate($title, constant("MAX_LENGTH_TITLE"));
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
    $is_empty = validEmptyField($description);
    $is_over_length = validCloseDate($description, constant("MAX_LENGTH_DESCRIPTION"));
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => $is_empty['message']);
    } else if (!$is_over_length['result']){
        return array('result' => false, 'message' => $is_over_length['message']);
    }
    return array('result' => true);
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

function validEmptyField($value)
{
    if (!empty($value)) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' field cannot empty.Please try again!!!');
}

function validMaxLength($value, $length)
{
    if (strlen($value) <= $length) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' field is not over'.$length.'characters');
}

function validCloseDate($close_date, $deadline)
{
    $today = date('Y-d-m h:m:s');
    if (strtotime($close_date) <= strtotime($deadline) &&
        strtotime($close_date) - strtotime($today) >= 48*60*60) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => ' is before '.$deadline.' and after 48h from when the form opens');
}