<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'capstone_project');

/** MySQL database username */
define('DB_USER', 'admin');

/** MySQL database password */
define('DB_PASSWORD', 'Hoalac@123');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '3Mm+dK$EQLYpC3 9;ov-~eryL2#R7FQn^KmG-rzY([VO/xs;Ux)Qic<i/-C3?Wg_');
define('SECURE_AUTH_KEY',  'tML@j3PHI.zG3LO5-t`d+xNBKK}cJ:l#x|Z&IneY.29)%Ke38a@ype.V:jbKP#a^');
define('LOGGED_IN_KEY',    'w(*/^v4?e=]K-!)k`|EzI1BF15DUSc[Pd(qbUCEr&@5#8G*Z!:J)S%wd]2/u|wWK');
define('NONCE_KEY',        'b(8]#E%wcK0n9GY_1S%.aIc! aRKGPqn8:yBV~3)9$a%@M8(nR`^{Gv=/XJV.Ouw');
define('AUTH_SALT',        '<:ups1p_>zadjQ<`(I%BI/nKgxJgl{=kMx.,#_pMT:E-?&S<F@tc_Fs@eQl_wiuz');
define('SECURE_AUTH_SALT', 'Qj@$BxMsc]%r5K%MZdp%bLcT{J?un`lhM0HZ#Kv|j$s}otQ=)Lg=(M_CPVwUu7Wf');
define('LOGGED_IN_SALT',   'O `3*Sfq[z~i~e^3[y=!]NgluO}CzxYXS@{W`k,alj<=Kn1qs^GsL:~fK7&QnLha');
define('NONCE_SALT',       ' rZ{l(1;wEWzod#j[G}Kgi~kceIU, )n]~{%ON;G_?N@<[zs#!PPa,x(%Bm``!fM');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
// define('WP_DEBUG', false);
ini_set('display_errors','Off');
/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
