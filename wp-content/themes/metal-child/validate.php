<?php
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
