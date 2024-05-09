<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'lsadiq' );

/** Database password */
define( 'DB_PASSWORD', 'wordpress' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_HOST', 'redis' );
/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'uDp+C;^+g~pi=.s!)__s|L +SJNA]td-~Ar^/Q.)7!*oDQj^J8-dgExf(`+W,7nk');
define('SECURE_AUTH_KEY',  'kGw,bO6(*+:(wEcP+CL`F^mC<K:*yQGoALM$(4%55L~h=OS*AIf^us_.i]Ux|CG4');
define('LOGGED_IN_KEY',    '@j:Mi&+N|GAnE`|:$&|W50H?+lxGPj@l1}EwQf=TE`2ev|MxM8`^!L/XZY^6k;mW');
define('NONCE_KEY',        '~=]sy/`,qi+(?+jJ-6-*QsaJinVlf nhG;j+)<,In,f@j6_ZoALi;,>!jCGYsw|z');
define('AUTH_SALT',        '7jarnDC?=m1gMQe0j>zG?@V2&c0k6+R?+9ix+9`n9,h:d/)#AsY4.m FzI|o9h~G');
define('SECURE_AUTH_SALT', 't9@IL@pgWs`bDqcfka_^$IrE.T|hRZ?22fq;Q4i{7 XP!<Ukq_x-9ktC}61{K`Op');
define('LOGGED_IN_SALT',   '`Q~p%T{dNuK|=ZUY>]c6DS]dntO`[U>Oy*hY$g_S~9_-{]0mYDdP16;_dIp=.KU*');
define('NONCE_SALT',       '28U_~@s|`-,cJyH t*M-3#@d;J@U!BGff|CEF?DL6(uF=F_^NVrOJY=AJ, DIu6]');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';