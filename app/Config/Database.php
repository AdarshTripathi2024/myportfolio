<?php

namespace Config;

use CodeIgniter\Database\Config;

class Database extends Config
{
    public $defaultGroup = 'default';
    public $default;

    public function __construct()
    {
        parent::__construct();

        $this->default = [
            'DSN'      => '',
            'hostname' => env('database.default.hostname', '127.0.0.1'),
            'username' => env('database.default.username', 'root'),
            'password' => env('database.default.password', ''),
            'database' => env('database.default.database', ''),
            'DBDriver' => env('database.default.DBDriver', 'MySQLi'),
            'DBPrefix' => '',
            'pConnect' => false,
            'DBDebug'  => (ENVIRONMENT !== 'production'),
            'charset'  => 'utf8',
            'DBCollat' => 'utf8_general_ci',
            'swapPre'  => '',
            'encrypt'  => false,
            'compress' => false,
            'strictOn' => false,
            'failover' => [],
            'port'     => env('database.default.port', 3306),
        ];
    }
}
