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
		$menu = array(
			'admin' => array(
				array(
					'name' => 'showSource',
					'title' => 'Show Source Code',
					'url' => "/showSource",
				),
				array(
					'name' => 'clone',
					'title' => 'Clone',
					'url' => "https://github.com/ohadaloni/medlog",
					'target' => "clone",
				),
			),
		);
		$loginName = MedLogLogin::loginName();
		if ( $loginName ) {
			$tz = Mutils::getenv("tz");
			if ( $tz )
				$tzTitle = "My Time Zone - $tz";
			else
				$tzTitle = "My Time Zone";
			$menu[$loginName] = array(
				array(
					'name' => 'tz',
					'title' => $tzTitle,
					'url' => "/medLog/myTimeZone",
				),
				array(
					'name' => 'export',
					'title' => 'Export CSV',
					'url' => "/medLog/export",
				),
				array(
					'name' => 'chpass',
					'title' => 'Change Password',
					'url' => "/medLog/changePasswd",
				),
				array(
					'name' => 'logout',
					'title' => 'Log Off',
					'url' => "/?logOut=logOut",
				),
			);
		}
		return($menu);
	}
	/*------------------------------------------------------------*/
}
