<?php
/*------------------------------------------------------------*/
class MedLogUtils extends Mcontroller {
	/*------------------------------------------------------------*/
	public static function alarms() {
		$alrms = array();
		$loginName = MedLogLogin::loginName();
		if ( ! $loginName )
			return;
		$myCond = "user = '$loginName'";
		$ago = date("Y-m-d", time() - 31*24*3600);
		$agoCond = "date > '$ago'";
		$conds = "$myCond and $agoCond";
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
		$sql = "select datetime from medLog where $conds order by datetime desc limit 3";
		$times = $this->Mmodel->getStrings($sql);
		if ( count($times) != 3 )
			return(null);
		$now = time();
		$time0 = strtotime($times[2]);
		$time1 = strtotime($times[1]);
		$time2 = strtotime($times[0]);
		$diff1 = $time1 - $time0;
		$diff2 = $time2 - $time1;
		$diff2now = $now - $time2;

		// diff1 & diff2 must be resonably the same
		$d12 = $diff1 / $diff2 ;
		if ( $d12 < 0.75 || $d12 > 1.25 ) {
			// for debugging only:
			/*	$this->Mview->msg("alarm($description): recent history too caotic");	*/
			return(null);
		}
		$avg = round(( $diff1 + $diff2) / 2) ;

		// discontinued
		if ( $diff2now > ( $avg * 2 ) )
			return(null);

		// not yet
		if ( $diff2now < ( $avg * 0.9 ) )
			return(null);
		$time2take = $time2 + $avg;
		if( date("D") == date("D", $time2take) )
			$day = "Today";
		else
			$day = date("D", $time2take);
		$missed = $time2take < $now;
		$alarm = array(
			'description' => $description,
			'day' => $day,
			'time' => date("G:i", $time2take),
			'missed' => $missed,
		);
		return($alarm);
	}
	/*------------------------------------------------------------*/
}
