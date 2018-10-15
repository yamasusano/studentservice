<?php
	session_start();
	require_once "GoogleAPI/vendor/autoload.php";
	$gClient = new Google_Client();
	$gClient->setClientId("240255635054-06ug9lmt0v0d8elbln1i9alvabjgoj9b.apps.googleusercontent.com");
	$gClient->setClientSecret("1yJu0Vj5SCTIWK_k5wMkXySh");
	$gClient->setApplicationName("Graduation Project Finder");
	$gClient->setRedirectUri("http://localhost/studentservice/callback/");
	$gClient->addScope("https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email");
?>
