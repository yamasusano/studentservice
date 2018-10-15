<?php 
function getAccountName($email)
{
    $user_mail = $email;
    $user = substr(strrev($email), 11);
    $account = strrev($user);
    return $account;
}