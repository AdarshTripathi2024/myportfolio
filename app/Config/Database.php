<?php

namespace Config;

use CodeIgniter\Database\Config;

class Database extends Config
{
    public $defaultGroup = 'default';

    public $default = [];

    public $tests = [
        'DBDriver' => 'SQLite3',
        'database' => ':memory:',
    ];
}
