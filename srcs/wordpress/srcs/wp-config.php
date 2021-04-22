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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', '10.96.0.3' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'tBxwmTe66TIQg-0LVrec5,t}zRuJ5S[*j6V89[c j*B53z#dKrnJvghsP5`t,:xl' );
define( 'SECURE_AUTH_KEY',  'f8`#1t;>P~8NCY;gjo)ZBsS:U5k <{2:L+c4(^PsGRvfJffQb ;V}~C|(:Z[+p?f' );
define( 'LOGGED_IN_KEY',    '-Ji5ksM$.u#j%mi08[r~ng%e.hov3#t96gd[kXd-E},g9U+9OX*^h^<wh*cV_oeL' );
define( 'NONCE_KEY',        'T>5[-=a]I]`_LH1mS@en6Qi2c}[D2<W`K_mT56W:$#bKf6_W596.6MK)%S<`y^pt' );
define( 'AUTH_SALT',        'j_6vZfvv1OWOdD35$4$L/,j-EF7;yV=m]zmz#:[~JOtr;r>S.ib~$R9K1OAlsL^;' );
define( 'SECURE_AUTH_SALT', 'V9{hoByBwE0J emlroNb[6-7P& Jx!2X6N@omb|Dbq;R*NfP*xF?hOjVRhe*R}I#' );
define( 'LOGGED_IN_SALT',   'Ula>o$,#3dpQ$!W^R&V!%Cgls8_DO176`US&9[>.-)[My#(lHea-NDt-~Mp<z|mx' );
define( 'NONCE_SALT',       'Fs!9p$)=^#l<L#C.Gx{>Zq&yBU6V3ooP{<a{}RHGHR T#J+-Cv<LSBYt}u0AQ!@N' );

/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
