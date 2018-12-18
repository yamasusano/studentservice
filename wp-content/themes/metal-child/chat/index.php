<?php

// require 'DbConnection/user.php';
// function get_status_user_loged_in()
// {
//     if (is_user_logged_in()) {
//         $user_id = get_current_user_id();
//         $user_name = get_user_by('ID', $user_id)->user_login;
//         $objUser = new users();
//         $objUser->setName($user_name);
//         $objUser->setUser_id($user_id);
//         $objUser->setLoginStatus(1);
//         $user = $objUser->getUByID();
//         $objUser->setLastLogin(date('Y-m-d h:i:s'));
//         $userData = $objUser->getUserById();
//         if (is_array($userData) && count($userData) > 0) {
//             $objUser->setId($userData['id']);
//             $objUser->updateLoginStatus();
//         } else {
//             if ($objUser->save()) {
//             } else {
//                 echo 'failed..';
//             }
//         }
//     }
// }
