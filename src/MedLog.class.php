<?php
/*------------------------------------------------------------*/
class MedLog extends Mcontroller {
	/*------------------------------*/
	protected $loginName;
	protected $loginId;
	/*------------------------------*/
	protected $medLogUtils;
	/*------------------------------*/
	protected $loginRec;
	/*------------------------------------------------------------*/
	public function __construct() {
		parent::__construct();

		$medLogLogin = new MedLogLogin;
		$this->loginId = MedLogLogin::loginId();
		$this->loginName = MedLogLogin::loginName();

		$this->medLogUtils = new MedLogUtils;
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
		ini_set('max_execution_time', 10);
		ini_set("memory_limit", "30M");
		$this->Mview->register_modifier("makeLinks", array("Mutils", "makeLinks",));

		if ( $this->loginId ) {
			$this->loginRec = $this->Mmodel->getById("users", $this->loginId);
			$timezone = $this->loginRec['timezone'];
			if ( $timezone ) {
				Mutils::setenv("tz", $timezone);
				date_default_timezone_set($timezone);
			}
		}
		if ( $this->showMargins()) {
			$datetime = date("D Y-m-d G:i T");
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
			$this->Mview->showMsgs();
			$this->alarms();
		}
	}
	/*------------------------------------------------------------*/
	protected function after() {
		if ( ! $this->showMargins())
			return;
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
		$email = @$_REQUEST['email'];
		if ( ! $email ) {
			error_log("forgotPass: email: eh?");
			return;
		}
		if ( ! filter_var($email, FILTER_VALIDATE_EMAIL)) {
			$this->Mview->msg("forgotPass: '$email': Not an email");
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
		$this->Mview->tell("registration successful", array(
			'url' => "http://medlog.theora.com",
		));
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
		$this->dbUpdate("users", $loginRow['id'], array(
			'passwd' => $newDbPasswd,
		));
		$this->Mview->msg("Password changed");
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
			'max(datetime) as datetime',
		);
		$fields = implode(", ", $fields);
		$groupBy = "group by 2";
		$orderBy = "order by 4 desc";
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		if ( @$_REQUEST['complete'] ) {
			$timeCond = "true";
		} else {
			$ago = date("Y-m-d", time() - 183*24*3600);
			$timeCond = "date >= '$ago'";
		}
		$conds = "$myCond and $timeCond";
		$sql = "select $fields from medLog where $conds $groupBy $orderBy";
		$rows = $this->Mmodel->getRows($sql);
		foreach ( $rows as $key => $row ) {
			$description = $row['description'];
			$history = $this->medLogUtils->history($description);
			$historyText = "";
			foreach ( $history as $item ) {
				$datetime = $item['datetime'];
				$quantity = $item['quantity'];
				$historyText .= "$datetime $quantity\n";
			}
			$rows[$key]['cnt'] = count($history);;
			$rows[$key]['historyText'] = $historyText;

			$id = $row['id'];
			$sql = "select quantity from medLog where id = $id";
			$quantity = $this->Mmodel->getString($sql);
			$rows[$key]['quantity'] = $quantity;
			$rows[$key]['weekday'] = Mdate::weekDayStr(Mdate::wday($row['date']));
		}
		$this->Mview->showTpl("medLog/summary.tpl", array(
			'row0' => $rows[0],
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
		$this->_history($row['description'], $row);
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
		$this->dbUpdate("medLog", $id, array(
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

		$data = array(
			'user' => $this->loginName,
			'quantity' => $quantity,
			'description' => $description,
			'date' => $date,
			'datetime' => $datetime,
			'comments' => $comments,
		);
		$strtotime = strtotime($datetime);
		$time = date("G:i", $strtotime);
		$descr = "$description: $quantity on $date @ $time";
		if ( $comments )
			$descr = "$descr - $comments";
		$id = $this->dbInsert("medLog", $data);
		if ( $id )
			$this->Mview->msgLater("Taken: $descr");
		else
			$this->Mview->error("insert failed: $descr");
		$this->redir($id);
	}
	/*------------------------------------------------------------*/
	public function myTimeZone() {
		$tz = @$_REQUEST['tz'];
		if ( $tz ) {
			$this->dbUpdate("users", $this->loginId, array(
				'timezone' => $tz,
			));
			$this->Mview->msgLater("Timezone set to $tz");
			$this->redir();
		}
		$tz = Mutils::getenv("tz");
		$sql = "select tz from timezones order by 1";
		$tzs = $this->Mmodel->getStrings($sql, 24*3600);
		$this->Mview->showTpl("setTz.tpl", array(
			'tzs' => $tzs,
			'tz' => $tz,
		));
	}
	/*------------------------------------------------------------*/
	public function lately() {
		$loginName = $this->loginName;
		$myCond = "user = '$loginName'";
		$aWeekAgo = date("Y-m-d", time() - 7*24*3600);
		$dateCond = "date >= '$aWeekAgo'";
		$conds = "$myCond and $dateCond";
		$orderBy = "order by date desc, datetime";
		$sql = "select * from medLog where $conds $orderBy";
		$rows = $this->Mmodel->getRows($sql);
		$sql = "select * from medLog where $conds order by date desc, datetime desc limit 1";
		$row0 = $this->Mmodel->getRow($sql);
		foreach ( $rows as $key => $row ) {
			$rows[$key]['weekday'] = Mdate::weekDayStr(Mdate::wday($row['date']));
			$description = $row['description'];
			$history = $this->medLogUtils->history($description);
			$historyText = "";
			foreach ( $history as $item ) {
				$datetime = $item['datetime'];
				$quantity = $item['quantity'];
				$historyText .= "$datetime $quantity\n";
			}
			$rows[$key]['historyText'] = $historyText;
			$rows[$key]['cnt'] = count($history);
		}
		$this->Mview->showTpl("medLog/lately.tpl", array(
			'rows' => $rows,
			'row0' => $row0,
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
		$alarms = $this->medLogUtils->alarms();
		if ( ! $alarms )
			return;
		foreach ( $alarms as $alarm ) {
			$description = $alarm['description'];
			$time = $alarm['time'];
			$missed = $alarm['missed'];
			if ( $missed )
				$msg = "Missed $time?";
			else
				$msg = "Due @ $time?";
			$descriptionEncoded = urlencode($description);
			$this->Mview->tell("$description: $msg", array(
				'url' => "/medlog/history?description=$descriptionEncoded",
			));
		}
	}
	/*------------------------------------------------------------*/
	private function add() {
		$this->Mview->showTpl("medLog/add.tpl");
	}
	/*------------------------------------------------------------*/
	private function _history($description, $currentRow = null) {
		$rows = $this->medLogUtils->history($description);
		$this->Mview->br();
		foreach ( $rows as $key => $row )
			$rows[$key]['weekday'] = Mdate::weekDayStr(Mdate::wday($row['date']));
		$this->Mview->showTpl("medLog/history.tpl", array(
			'description' => $description,
			'rows' => $rows,
			'row0' => $rows[0],
			'currentRow' => $currentRow,
		));
	}
	/*------------------------------------------------------------*/
	protected function dbInsert($tableName, $data) {
		if ( $this->loginName )
			return($this->Mmodel->dbInsert($tableName, $data));
		$this->Mview->msg("Not logged in. insert ignored");
		return(null);
	}
	/*------------------------------*/
	protected function dbUpdate($tableName, $id, $data) {
		if ( $this->loginName )
			return($this->Mmodel->dbUpdate($tableName, $id, $data));
		$this->Mview->error("Not logged in. Update ignored");
		return(null);
	}
	/*------------------------------*/
	protected function dbDelete($tableName, $id) {
		if ( $this->loginName )
			return($this->Mmodel->dbDelete($tableName, $id));
		$this->Mview->error("Not logged in. delete ignored");
		return(null);
	}
	/*------------------------------*/
	protected function sql($sql) {
		if ( $this->loginName )
			return($this->Mmodel->sql($sql));
		$this->Mview->error("Not logged in. db change ignored");
		return(null);
		
	}
	/*------------------------------------------------------------*/
	private function redir($id = null) {
		if ( $id ) {
			$this->redirect("/medLog/edit?id=$id");
			return;
		}
		$description = @$_REQUEST['description'];
		$description = urlencode($description);
		if ( $description )
			$this->redirect("/medLog/history?description=$description");
		else
			$this->redirect("/medLog");
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	private function showMargins() {
		$nots = array(
			'medlog' => array(
				'export',
			),
			'api' => array(
				'any',
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
}
