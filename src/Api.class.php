<?php
/*------------------------------------------------------------*/
class Api extends MedLog {
	/*------------------------------------------------------------*/
	public function alarms() {
		$alarms = $this->medLogUtils->alarms();
		$json = json_encode($alarms);
		echo $json;
	}
	/*------------------------------------------------------------*/
	public function history() {
		$description = $_REQUEST['description'];
		$history = $this->medLogUtils->history($description);
		$json = json_encode($history);
		echo $json;
	}
	/*------------------------------------------------------------*/
}
/*------------------------------------------------------------*/
