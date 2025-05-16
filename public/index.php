<?php

define('FCPATH', __DIR__ . DIRECTORY_SEPARATOR);
chdir(__DIR__);

// Load the paths config file
require realpath(FCPATH . '../app/Config/Paths.php');

$paths = new Config\Paths();
$bootstrap = realpath($paths->systemDirectory . '/bootstrap.php');
$app = require $bootstrap;

$app->run();
