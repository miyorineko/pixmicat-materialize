<?php
class mod_showhide extends ModuleHelper {
	public function getModuleName(){
		return 'mod_showhide : 自由隱藏顯示討論串';
	}

	public function getModuleVersionInfo(){
		return '7th.Release.dev (v140606)';
	}

	public function autoHookHead(&$txt, $isReply){
		$txt .= '<script type="text/javascript">window.jQuery || document.write("\x3Cscript src=\"js/jquery-3.2.1.min.js\">\x3C/script>");</script> 
<script src="js/mod_showhide.js" type="text/javascript"></script>'."\n";
	}
}

