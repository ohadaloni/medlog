<?php
/*------------------------------------------------------------*/
error_reporting(E_ALL | E_NOTICE | E_STRICT );
/*------------------------------------------------------------*/
define('M_DIR', "/var/www/vhosts/M.theora.com");
define('TAS_DIR', "/var/www/vhosts/tas.theora.com");
require_once(TAS_DIR."/conf/dbCredentials.php");
require_once(TAS_DIR."/conf/reCaptchaKeys.php");
define('M_DBNAME', 'medlog');
/*------------------------------------------------------------*/
