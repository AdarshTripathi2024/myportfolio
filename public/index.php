<?php

// Path to the front controller (this file)
define('FCPATH', __DIR__ . DIRECTORY_SEPARATOR);

/*
 *---------------------------------------------------------------
 * BOOTSTRAP THE APPLICATION
 *---------------------------------------------------------------
 */

// Ensure the current directory is pointing to the front controller's directory
chdir(__DIR__);

// Load our paths config file
$pathsConfig = realpath(FCPATH . '../app/Config/Paths.php');
require $pathsConfig;

$paths = new Config\Paths();

// Adjust paths relative to public/
$paths->systemDirectory = realpath(FCPATH . '../system');
$paths->writableDirectory = realpath(FCPATH . '../writable');
$paths->appDirectory = realpath(FCPATH . '../app');

// Location of the framework bootstrap file
$bootstrap = realpath($paths->systemDirectory . '/bootstrap.php');
$app = require $bootstrap;

/*
 *---------------------------------------------------------------
 * LAUNCH THE APPLICATION
 *---------------------------------------------------------------
 */
$app->run();
