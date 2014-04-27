<?php

session_start();

$inc_path = '../inc';
set_include_path(get_include_path() . PATH_SEPARATOR . $inc_path);

include 'sprinklerpi.php';

$spkpi_dir = '../../sprinklerpi';
?>
