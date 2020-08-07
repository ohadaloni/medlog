<?php
/*------------------------------------------------------------*/
class MedLog extends Mcontroller {
	/*------------------------------*/
	protected $loginName;
	protected $loginId;
	/*------------------------------*/
	protected $Mmemcache;
	/*------------------------------*/
	protected $loginRec;
	/*------------------------------*/
	private $startTime;
	/*------------------------------------------------------------*/
	public function __construct() {
		parent::__construct();

		$medLogLogin = new MedLogLogin;
		$this->loginId = MedLogLogin::loginId();
		$this->loginName = MedLogLogin::loginName();

		$this->Mmemcache = new Mmemcache;
		Mutils::setenv("debugLevel", 1);
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	protected function permit() {
		$ok = Mrecaptcha::ok();
		if ( ! $ok )
			return(false);
		$action = $this->action;
		if ( in_array($action, array('index', 'register', 'forgotpass', 'registration', ) ) )
			return(true);
		$loginId = $this->loginId;
		if ( $loginId )
			return(true);
		 return(false);
	}
	/*------------------------------*/
	protected function before() {
		parent::before();
		$this->startTime = microtime(true);
		ini_set('max_execution_time', 10);
		ini_set("memory_limit", "30M");

		if ( $this->loginId ) {
			$this->loginRec = $this->Mmodel->getById("users", $this->loginId);
			$timezone = $this->loginRec['timezone'];
			if ( $timezone ) {
				Mutils::setenv("tz", $timezone);
				date_default_timezone_set($timezone);
			}
		}
		if ( $this->showMargins()) {
			$datetime = date("Y-m-d G:i T");
			if ( $this->loginId ) {
				$loginName = $this->loginName;
				$title = "Medlog - $loginName - $datetime";
			} else {
				$title = "Medlog - $datetime";
			}
			$this->Mview->showTpl("head.tpl", array(
				'title' => $title,
			));
			$this->Mview->showTpl("header.tpl", array(
				'datetime' => $datetime,
			));
			$this->Mview->assign("RE_CAPTACH_SITE_KEY", RE_CAPTACH_SITE_KEY);
			if ( $this->loginId ) {
				$menu = new Menu;
				$menu->index();
			}
			$this->showMsgs();
			$this->alarms();
		}
	}
	/*------------------------------------------------------------*/
	protected function after() {
		if ( ! $this->showMargins())
			return;
		$endTime = microtime(true);
		$time = $endTime - $this->startTime ;
		$millis = $time * 1000;
		$millis = round($millis, 3);
		$this->Mview->msg("Running Time: $millis milliseconds");
		$this->Mview->showTpl("footer.tpl");
		$this->Mview->showTpl("foot.tpl");
	}
	/*------------------------------------------------------------*/
	public function index() {
		$loginName = $this->loginName;
		if ( $this->loginId ) {
			if ( $this->loginRec['timezone'] ) {
				$this->summary();
				$this->add();
			} else {
				$this->redirect("/medlog/myTimeZone");
			}
		} else {
			$this->Mview->showTpl("login.tpl");
		}
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	public function forgotPass() {
		$email = $_REQUEST['email'];
		if ( ! filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$this->Mview->msg("register: '$email': Not an email");
			return;
		}
		$str = $this->Mmodel->str($email);
		$sql = "select * from users where loginName = '$str'";
		$loginRow = $this->Mmodel->getRow($sql);
		if ( ! $loginRow ) {
			$this->Mview->error("No such email");
			return;
		}
		$rnd = rand(100, 1000);
		$sha1 = sha1($rnd);
		$passwd = substr($sha1, 17, 6);
		$dbPasswd = sha1($passwd);
		$this->Mmodel->dbUpdate("users", $loginRow['id'], array(
			'passwd' => $dbPasswd,
		));
		require_once(M_DIR."/MmailJet.class.php");
		$m = new MmailJet;
		$httpCode = null;

		$message = $this->Mview->render("forgotPassEmail.tpl", array(
			'passwd' => $passwd,
		));
		$m->mail($email, "New password @ medlog.theora.com", $message, $httpCode);
		if ( $httpCode == 200 )
			$this->Mview->msg("New password sent to email");
		else
			$this->Mview->error("Email error");
	}
	/*------------------------------------------------------------*/
	public function register() {
		$email = $_REQUEST['email'];
		if ( ! filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$this->Mview->msg("register: '$email': Not an email");
			return;
		}
		require_once(M_DIR."/MmailJet.class.php");
		$m = new MmailJet;
		$httpCode = null;

		$key = sha1(rand(1000, 1000000));
		$cr = sha1($email);
		$mkey = "RegisterEmail-$key";
		$ttl = 900;
		$this->Mmemcache->set($mkey, $email, $ttl);
		$message = $this->Mview->render("registerEmail.tpl", array(
			'key' => $key,
			'cr' => $cr,
		));
		$m->mail($email, "Create Account @ medlog.theora.com", $message, $httpCode);
		if ( $httpCode == 200 )
			$this->Mview->msg("Please click the link in the email to complete the registration");
		else
			$this->Mview->error("Email error");
	}
	/*------------------------------*/
	public function registration() {
		$key = @$_REQUEST['key'];
		$cr = @$_REQUEST['cr'];
		if ( ! $key || ! $cr ) {
			$this->Mview->error("No key&cr");
			return;
		}
		$mkey = "RegisterEmail-$key";
		$email = $this->Mmemcache->get($mkey);
		if ( ! $email ) {
			$this->Mview->error("Expired");
			return;
		}
		$crcr = sha1($email);
		if ( $cr != $crcr ) {
			$this->Mview->error("Wrong email");
			return;
		}
		$str = $this->Mmodel->str($email);
		$sql = "select loginName from users where loginName = '$str'";
		$dbEmail = $this->Mmodel->getString($sql);
		if ( $dbEmail ) {
			$this->Mview->error("Email $email exists");
			return;
		}
		$rnd = rand(100, 1000);
		$sha1 = sha1($rnd);
		$passwd = substr($sha1, 17, 6);
		$dbPasswd = sha1($passwd);
		$id = $this->Mmodel->dbInsert("users", array(
			'loginName' => $email,
			'passwd' => $dbPasswd,
		));
		if ( ! $id ) {
			$err = $this->Mmodel->lastError();
			if ( stristr($err, "duplicate") ) {
				$this->Mview->error("Clicked twice? Please use 'Forgot Password' if you forgot your password.");
				Mlogin::logout();
			} else {
				$this->Mview->error("insert failed");
			}
			return;
		}
		$this->Mview->urlMsg("registration successful", "http://medlog.theora.com");
		$this->Mview->msg("password is $passwd");
	}
	/*------------------------------------------------------------*/
	public function changePasswd() {
		$this->Mview->showTpl("admin/changePasswd.tpl");
	}
	/*------------------------------*/
	public function updatePasswd() {
		$loginName = $this->loginName;
		$oldPasswd = @$_REQUEST['oldPasswd'];
		$newPasswd = @$_REQUEST['newPasswd'];
		$newPasswd2 = @$_REQUEST['newPasswd2'];
		if ( ! $oldPasswd || ! $newPasswd || ! $newPasswd2 ) {
			$this->Mview->error("updatePasswd: please fill in all 3 fields");
			return;
		}
		if ( $newPasswd != $newPasswd2 ) {
			$this->Mview->error("updatePasswd: new passwords are not the same");
			return;
		}
		$sql = "select * from users where loginName = '$loginName'";
		$loginRow = $this->Mmodel->getRow($sql);
		if ( ! $loginRow ) {
			$this->Mview->error("updatePasswd: no login row");
			return;
		}
		$dbPasswd = $loginRow['passwd'];
		if ( $dbPasswd != $oldPasswd && $dbPasswd != sha1($oldPasswd) ) {
			$this->Mview->error("updatePasswd: old password incorrect");
			return;
		}
		$newDbPasswd = sha1($newPasswd);
		$this->Mmodel->dbUpdate("users", $loginRow['id'], array(
			'passwd' => $newDbPasswd,
		));
		$this->Mview->msg("Pawword changed");
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	public function history() {
		$description = $_REQUEST['description'];
		$this->_history($description);
	}
	/*------------------------------------------------------------*/
	public function summary() {
		$fields = array(
			'max(id) as id',
			'description',
			'max(date) as date',
			'count(*) as cnt',
			'max(datetime) as datetime',
		);
		$fields = implode(", ", $fields);
		$groupBy = "group by 2";
		$orderBy = "order by 5 desc";
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		$sql = "select $fields from medLog where $myCond $groupBy $orderBy";
		$rows = $this->Mmodel->getRows($sql);
		foreach ( $rows as $key => $row ) {
			$id = $row['id'];
			$sql = "select quantity from medLog where id = $id";
			$quantity = $this->Mmodel->getString($sql);
			$rows[$key]['quantity'] = $quantity;
		}
		$this->Mview->showTpl("medLog/summary.tpl", array(
			'rows' => $rows,
		));
	}
	/*------------------------------------------------------------*/
	public function edit() {
		$row = $this->Mmodel->getById("medLog", $_REQUEST['id']);
		$hm = substr($row['datetime'], 11, 5);
		$row['hm'] = $hm;
		$this->Mview->showTpl("medLog/edit.tpl", array(
			'row' => $row,
		));
		$this->_history($row['description']);
	}
	/*------------------------------------------------------------*/
	public function update() {
		$id = $_REQUEST['id'];
		$date = $_REQUEST['date'];
		$time = $_REQUEST['time'];
		$comments = $_REQUEST['comments'];
		$datetime = "$date $time";
		$description = @$_REQUEST['description'];
		$quantity = @$_REQUEST['quantity'];
		$this->Mmodel->dbUpdate("medLog", $id, array(
			'date' => $date,
			'datetime' => $datetime,
			'comments' => $comments,
			'description' => $description,
			'quantity' => $quantity,
		));
		$this->redir();
	}
	/*------------------------------------------------------------*/
	public function remove() {
		$id = $_REQUEST['id'];
		$ok = @$_REQUEST['ok'];
		if ( $ok == "on" )
			$this->Mmodel->dbDelete("medLog", $id);
		else
			$this->Mview->error("remove: box not checked. ignoring.");
		$this->redir();
	}
	/*------------------------------------------------------------*/
	public function insert() {
		$description = @$_REQUEST['description'];
		$comments = @$_REQUEST['comments'];
		$date = @$_REQUEST['date'];
		if ( ! $date )
			$date = date("Y-m-d");
		$datetime = @$_REQUEST['datetime'];
		if ( ! $datetime )
			$datetime = date("Y-m-d H:i:s");
		
		$quantity = @$_REQUEST['quantity'];

		$id = $this->Mmodel->dbInsert("medLog", array(
			'user' => $this->loginName,
			'quantity' => $quantity,
			'description' => $description,
			'date' => $date,
			'datetime' => $datetime,
			'comments' => $comments,
		));
		$this->redir(@$_REQUEST['date'] ? $id : null);
	}
	/*------------------------------------------------------------*/
	public function myTimeZone() {
		$tz = @$_REQUEST['tz'];
		if ( $tz ) {
			$this->Mmodel->dbUpdate("users", $this->loginId, array(
				'timezone' => $tz,
			));
			$this->redir();
		}
		$sql = "select tz from timezones order by 1";
		$tzs = $this->Mmodel->getStrings($sql, 24*3600);
		$this->Mview->showTpl("setTz.tpl", array(
			'tzs' => $tzs,
		));
	}
	/*------------------------------------------------------------*/
	public function export() {
		$fields = "description, quantity, datetime, comments";
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		$orderBy = "order by description, date, datetime";
		$sql = "select $fields from medLog where $myCond $orderBy";
		$rows = $this->Mmodel->getRows($sql);
		$date = date("Y-m-d");
		$this->exportToExcel($rows, "MedLog.$loginName.$date");
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	private function alarms() {
		$loginName = $this->loginName;
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
		foreach ( $rows as $row )
			$this->alarm($row['description']);
	}
	/*------------------------------*/
	private function alarm($description) {
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		$dCond = "description = '$description'";
		$conds = "$myCond and $dCond";
		$sql = "select datetime from medLog where $conds order by datetime desc limit 3";
		$times = $this->Mmodel->getStrings($sql);
		if ( count($times) != 3 )
			return;
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
			return;
		}
		$avg = round(( $diff1 + $diff2) / 2) ;

		// discontinued
		if ( $diff2now > ( $avg * 2 ) )
			return;

		// not yet
		if ( $diff2now < ( $avg * 0.8 ) )
			return;
		$time2take = $time2 + $avg;
		$datetime2take = date("G:i", $time2take);
		if ( $time2take < $now )
			$msg = "Missed $datetime2take?";
		else
			$msg = "Due at $datetime2take";
		$this->Mview->urlMsg("$description: $msg", "/medlog/history?description=$description");
	}
	/*------------------------------------------------------------*/
	private function add() {
		$this->Mview->showTpl("medLog/add.tpl");
	}
	/*------------------------------------------------------------*/
	private function _history($description) {
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		$dCond = "description = '$description'";
		$conds = "$myCond and $dCond";
		$orderBy = "order by datetime desc";
		$limit = "limit 1000";
		$sql = "select * from medLog where $conds $orderBy $limit";
		$rows = $this->Mmodel->getRows($sql);
		$this->br();
		$this->Mview->showTpl("medLog/history.tpl", array(
			'description' => $description,
			'rows' => $rows,
		));
	}
	/*------------------------------------------------------------*/
	private function br($howMany = 1) {
		for($i=0;$i<$howMany;$i++)
			$this->Mview->pushOutput("<br />\n");
	}
	/*------------------------------------------------------------*/
	private function redir($id = null) {
		if ( $id ) {
			$this->redirect("/medLog/edit?id=$id");
			return;
		}
		$description = @$_REQUEST['description'];
		if ( $description )
			$this->redirect("/medLog/history?description=$description");
		else
			$this->redirect("/medLog");
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	private function showMargins() {
		$nots = array(
			'medLog' => array(
				'export',
			),
		);
		foreach( $nots as $notClassName => $notClass )
			foreach( $notClass as $notAction )
				if ( strcasecmp($notClassName, $this->controller) == 0
						&& 
						( strcasecmp($notAction, $this->action) == 0 || $notAction == 'any' )
					) {
						return(false);
					}
		return(true);
	}
	/*------------------------------------------------------------*/
	private function showMsgs() {
		$msgs = Msession::get('msgBuf');
		$this->Mview->showTpl("msgs.tpl", array(
			'msgs' => $msgs,
		));
	}
	/*------------------------------------------------------------*/
}
