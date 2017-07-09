<?php
$dat='
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=yes" />
<title>{$TITLE}</title>
<link href="../css/materialicon.css" rel="stylesheet"/>
<link href="../css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<script src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../mainscript.js"></script>
<!--[if lt IE 8]><script type="text/javascript" src="iedivfix.js"></script><![endif]-->
<script src="../js/materialize.min.js"></script>
<script type="text/javascript">
// <![CDATA[
var msgs=[\'{$JS_REGIST_WITHOUTCOMMENT}\',\'{$JS_REGIST_UPLOAD_NOTSUPPORT}\',\'{$JS_CONVERT_SAKURA}\'];
var ext="{$ALLOW_UPLOAD_EXT}".toUpperCase().split("|");
// ]]>
  $(document).ready(function() {
    $(\'select\').material_select();
  });
</script>
</head>
<body>
  <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo"><i class="large material-icons">portable_wifi_off</i>PerryPerryFun</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="../">Back</a></li>
      </ul>
    </div>
  </nav>
  <div class="container">
  <div class="card hoverable">
  <div class="card-content">
  <span class="card-title">Archive</span>
  <div class="divider"></div>
';
//$dat.=$PTE->ParseBlock('HEAD');

/* 取出 XML 檔案討論串資訊 */
function getSubjectAndName($file){
	if(!$xml = simplexml_load_file($file, NULL, LIBXML_COMPACT))
		return false;

	$name = $xml->name;
	if($xml->name->span) $name .= $xml->name->span; // for Trip
	if($xml->name->span->span) $name .= $xml->name->span->span; // for Trip of AdminCap
	return array('sub' => $xml->subject, 'name' => $name);
}

/* 取得靜態庫存頁面列表 */
$fileList = Array();
function GetArchives($sPath){
	global $fileList;
	// 打開目錄逐個搜尋XML檔案並加入陣列
	$handle = opendir($sPath);
	while($file = readdir($handle)){
        if($file != '..' && $file != '.' && is_file($sPath.'/'.$file)) // 為檔案
			if(strpos($file, '.xml')) $fileList[] = $file;
    }
	// 排序陣列
	closedir($handle);
	@sort($fileList);
    @reset($fileList);
}

GetArchives('.');
$t = array(); $infobar = '';

// 列出檔案連結
$dat.="<ul>\n";
if($fileList_count = count($fileList)){ // 有列表
	for($i = 0; $i < $fileList_count; $i++){
		$infobar = ($t = getSubjectAndName($fileList[$i])) ? $t['name'].' - '.$t['sub'] : '';
		$dat.='	<li><a href="'.$fileList[$i].'">'.$fileList[$i]."</a> $infobar</li>\n";
	}
}else{
	$dat.= '<li>目前還沒有靜態庫存頁面可供瀏覽</li>';
}
$dat.='</ul>
</div>
</div>
</div>
</div>
</body>
<footer class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
              <h5 class="white-text">Footer Content</h5>
              <p class="grey-text text-lighten-4">footer footer</p>
            </div>
            <div class="col l4 offset-l2 s12">
              <h5 class="white-text">Links</h5>
              <ul>
                <li><a class="grey-text text-lighten-3" href="/">Organization Homepage</a></li>
                <li><a class="grey-text text-lighten-3" href="#!">Link 2</a></li>
                <li><a class="grey-text text-lighten-3" href="#!">Link 3</a></li>
                <li><a class="grey-text text-lighten-3" href="#!">Link 4</a></li>
              </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2017 Peirrie LTD.
            <a class="grey-text text-lighten-4 right" href="#!">- Ripei -</a>
        </div>
    </div>
</footer>
</html>
';

//foot($dat);

echo $dat;
?>