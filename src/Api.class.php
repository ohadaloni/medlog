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
}
/*------------------------------------------------------------*/