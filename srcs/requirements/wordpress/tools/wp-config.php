<?php

define('WP_CACHE', true);

define( 'DB_NAME', 'mydb' );

define( 'DB_USER', 'abdoullah' );

define( 'DB_PASSWORD', 'Joueur11' );

define( 'DB_HOST', 'mariadb' );

define('AUTH_KEY',         'DR3Rhr&z8#EbP!b7qfaDRi?xEx$FhEqfX496idEQ');
define('SECURE_AUTH_KEY',  '5$S?yoDnSopXhr$HbtT!aM$R8zjMo584HEQAEcDF');
define('LOGGED_IN_KEY',    '6Ba4A545qJ78h#jQNDn?znYMoa@xM4TGyE@RQ@$6');
define('NONCE_KEY',        'oG@p3a7!aeT6iEnEt79eet5jp!Pq5rc$E&@f8A7a');
define('AUTH_SALT',        'aB&izSR#tiA&b6d&AgDzt$Jr5g!?5Q#AP8zdik$r');
define('SECURE_AUTH_SALT', '6Bq&HcP8T6cfJL!a!&Db#kay6@GgM6ytNxefbJ3K');
define('LOGGED_IN_SALT',   'qqgq3FipXDn8iQY6qiJaLNzER69Kfc8$!qbE&tfg');
define('NONCE_SALT',       'FD5$4Rde@sD6o@SRBfghaeeY?mc3cn@D8dX3M?Rk');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false);

define('WP_AUTO_UPDATE_CORE', false);

define('DISALLOW_FILE_MODS', true);

if ( !defined('ABSPATH') )
        define('ABSPATH', '/var/www/html');

require_once(ABSPATH . 'wp-settings.php');