<?php
/*------------------------------------------------------------*/
require_once("medLogConfig.php");
require_once(M_DIR."/mfiles.php");
require_once("medLogFiles.php");
require_once("MedLog.class.php");
/*------------------------------------------------------------*/
$startTime = microtime(true);
/*------------------------------------------------------------*/
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
$medLog->setStartTime($startTime);
$medLog->control();
$Mview->flushOutput();
/*------------------------------------------------------------*/
/*------------------------------------------------------------*/
