<?php
class mod_csrf_prevent extends ModuleHelper {
	
	public function __construct($PMS) {
		parent::__construct($PMS);
	}

	public function getModuleName(){
		return 'mod_csrf_prevent : 防止偽造跨站請求 (CSRF)';
	}

	public function getModuleVersionInfo(){
		return '7th b140607';
	}

	public function autoHookRegistBegin(&$name, &$email, &$sub, &$com, $upfileInfo, $accessInfo, $isReply){
		$CSRFdetectd = false;
		/* 檢查 HTTP_REFERER (防止跨站 form)
		 *  1. 無 HTTP_REFERER
		 *  2. HTTP_REFERER 不是此網域
		 */
		if(!isset($_SERVER['HTTP_REFERER']) || strpos($_SERVER['HTTP_REFERER'], fullURL()) == 0)
			$CSRFdetectd = true;

		if($CSRFdetectd) error('Unknown error detected!');
	}
}//End-Of-Module

