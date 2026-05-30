<?php
session_start();
session_destroy();
header('Location: ../views/auth/login-signup.php#login');
exit;