<?php
define('WP_CACHE', true);
define('DB_NAME', getenv('MARIADB_DATABASE'));
define('DB_USER', getenv('MARIADB_USER'));
define('DB_PASSWORD', getenv('MARIADB_PWD'));
define('DB_HOST', getenv('MARIADB_HOST'));
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix = 'wp_';

define('WP_DEBUG', false);
define('WP_DEBUG_LOG', false);
define('WP_DEBUG_DISPLAY', false);

// define('WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST']);
// define('WP_HOME', 'http://' . $_SERVER['HTTP_HOST']);

if ( ! defined('ABSPATH') ) {
    define('ABSPATH', dirname(__FILE__) . '/');
}

require_once ABSPATH . 'wp-settings.php';