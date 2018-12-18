<?php

 if (!is_user_logged_in()) {
     wp_redirect(home_url());
     exit;
 }
