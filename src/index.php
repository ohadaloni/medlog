<?php
/*------------------------------------------------------------*/
require_once("medLogConfig.php");
require_once(M_DIR."/mfiles.php");
require_once("medLogFiles.php");
require_once("MedLog.class.php");
/*------------------------------------------------------------*/
date_default_timezone_set("UTC");
global $Mview;
global $Mmodel;
$Mview = new Mview;
$Mmodel = new Mmodel;
$Mview->holdOutput();
/*------------------------------------------------------------*/
$medLogLogin = new MedLogLogin;
if ( isset($_REQUEST['logOut']) ) {
	$medLogLogin->logOut();
} else {
	$medLogLogin->enterSession();
}
$medLog = new MedLog;
$medLog->control();
$Mview->flushOutput();
/*------------------------------------------------------------*/
/*------------------------------------------------------------*/
