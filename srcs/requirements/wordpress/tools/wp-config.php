<?php
define('WP_CACHE', true);
define('DB_NAME', 'mydb');
define('DB_USER', 'abdoullah');
define('DB_PASSWORD', 'wp_pwd');
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix = 'wp_';

define('WP_DEBUG', false);
define('WP_DEBUG_LOG', false);
define('WP_DEBUG_DISPLAY', false);

if ( ! defined('ABSPATH') ) {
    define('ABSPATH', dirname(__FILE__) . '/');
}

require_once ABSPATH . 'wp-settings.php';