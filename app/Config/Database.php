<?php namespace Config;

use CodeIgniter\Database\Config;

class Database extends Config
{
    public $defaultGroup = 'default';

    public $default = [];

    public function __construct()
    {
        parent::__construct();

        $url = getenv('DATABASE_URL');

        if ($url) {
            $parts = parse_url($url);

            $this->default = [
                'DSN'      => '',
                'hostname' => $parts['host'],
                'username' => $parts['user'],
                'password' => $parts['pass'],
                'database' => ltrim($parts['path'], '/'),
                'DBDriver' => 'MySQLi',
                'port'     => $parts['port'] ?? 3306,
                'charset'  => 'utf8',
                'DBPrefix' => '',
                'DBDebug'  => (ENVIRONMENT !== 'production'),
                'cacheOn'  => false,
                'cacheDir' => '',
                'encrypt'  => false,
                'compress' => false,
                'strictOn' => false,
                'failover' => [],
            ];
        }
    }
}
