<?php
session_start();
session_destroy();
header('Location: ../apps/view/student/index.php');
exit;