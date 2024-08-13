<?php
/*------------------------------------------------------------*/
class MedLogUtils extends Mcontroller {
	/*------------------------------------------------------------*/
	public function alarms() {
		$alarms = array();
		$loginName = MedLogLogin::loginName();
		if ( ! $loginName )
			return(null);
		$myCond = "user = '$loginName'";
		$ago = date("Y-m-d", time() - 31*24*3600);
		$agoCond = "date > '$ago'";
		$sql = "select description from noAlerts where user = '$loginName'";
		$noAlerts = $this->Mmodel->getStrings($sql);
		if ( $noAlerts ) {
			$noAlertsInList = "'".implode($noAlerts, "', '")."'";
			$alertsCond = "description not in ( $noAlertsInList )";
			$conds = "$myCond and $agoCond and $alertsCond";
		} else {
			$conds = "$myCond and $agoCond";
		}
		$fields = "description, max(id) as id";
		$groupBy = "group by 1";
		$sql = "select $fields from medLog where $conds $groupBy";
		$rows = $this->Mmodel->getRows($sql);
		foreach ( $rows as $row ) {
			$alarm = $this->alarm($row['description'], $loginName);
			if ( $alarm )
				$alarms[] = $alarm;
		}
		return($alarms);
	}
	/*------------------------------*/
	private function alarm($description, $loginName) {
		$myCond = "user = '$loginName'";
		$dCond = "description = '$description'";
		$conds = "$myCond and $dCond";
		$sql = "select datetime from medLog where $conds order by datetime desc limit 2";
		$times = $this->Mmodel->getStrings($sql);
		if ( count($times) != 2 )
			return(null);
		$now = time();
		$time0 = strtotime($times[1]);
		$time1 = strtotime($times[0]);
		$diff = $time1 - $time0;
		$time2take = $time1 + $diff;
		$timeLeft = $time2take - $now;

		// discontinued, or over-missed
		if ( $timeLeft < ( - 2*24*3600 ) )
			return(null);

		// not yet
		if ( $timeLeft > $diff * 0.5 || $timeLeft > 3*3600 )
			return(null);

		$missed = $timeLeft < 0;
		$date2take = date("Y-m-d", $time2take);
		$today = date("Y-m-d");
		if ( $today == $date2take )
			$time =  date("G:i", $time2take);
		else
			$time =  date("j G:i", $time2take);
		$alarm = array(
			'description' => $description,
			'time' => $time,
			'missed' => $missed,
		);
		return($alarm);
	}
	/*------------------------------------------------------------*/
	public function history($description) {
		$loginName = MedLogLogin::loginName();
		$myCond = "user = '$loginName'";
		$dCond = "description = '$description'";
		$conds = "$myCond and $dCond";
		$orderBy = "order by datetime desc";
		$sql = "select * from medLog where $conds $orderBy";
		$rows = $this->Mmodel->getRows($sql);
		return($rows);
	}
	/*------------------------------------------------------------*/
}
