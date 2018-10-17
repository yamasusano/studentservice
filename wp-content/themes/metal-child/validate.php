<?php
define("TITLE_MAX_LENGTH",200);
define("_MAX_LENGTH",200);
function titleCheck($title)
{
    $is_empty = validEmptyField($title);
    if (!$is_empty['result']) {
        return array('result' => false, 'message' => $is_empty['message']);
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
    if (!empty($value)) {
        return array('result' => true);
    }
    return array('result' => false, 'message' => 'Title is not over ... characters');
}

// function validEmptyField($value)
// {
//     if (!empty($value)) {
//         return ar0ray('result' => true);
//     }
//     return array('result' => false, 'message' => ' field cannot empty.Please try again!!!');
// }
