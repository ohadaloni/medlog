<?php
/*------------------------------------------------------------*/
class Menu extends Mcontroller {
	/*------------------------------------------------------------*/
	public function index() {
			$this->Mview->showTpl("menuDriver.tpl", array(
				'menu' => $this->dd(),
			));
	}
	/*------------------------------------------------------------*/
	/*------------------------------------------------------------*/
	private function dd() {
		$tz = Mutils::getenv("tz");
		$loginName = MedLogLogin::loginName();
		if ( $tz )
			$tzTitle = "My Time Zone - $tz";
		else
			$tzTitle = "My Time Zone";
		$menu = array(
			'Medlog' => array(
				array(
					'title' => $tzTitle,
					'url' => "/medLog/myTimeZone",
				),
				array(
					'title' => 'Export CSV',
					'url' => "/medLog/export",
				),
				array(
					'title' => 'Lately',
					'url' => "/medLog/lately",
				),
				array(
					'title' => 'All',
					'url' => "/medLog?complete=complete",
				),
			),
			'admin' => array(
				array(
					'title' => 'Show Source Code',
					'url' => "/showSource",
				),
				array(
					'title' => 'Clone',
					'url' => "https://github.com/ohadaloni/medlog",
					'target' => "clone",
				),
			),
			$loginName => array(
				array(
					'title' => 'Change Password',
					'url' => "/medLog/changePasswd",
				),
				array(
					'title' => 'Log Off',
					'url' => "/?logOut=logOut",
				),
			),
		);
		return($menu);
	}
	/*------------------------------------------------------------*/
}
