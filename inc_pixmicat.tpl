<!--&THEMENAME-->futaba Theme<!--/&THEMENAME-->
<!--&THEMEVER-->v20140603<!--/&THEMEVER-->
<!--&THEMEAUTHOR-->Pixmicat! Development Team<!--/&THEMEAUTHOR-->
<!--&HEADER--><!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=yes" />
<title>{$TITLE}</title>
<link href="css/materialicon.css" rel="stylesheet"/>
<link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        

<!--/&HEADER-->

<!--&JSHEADER-->
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="mainscript.js"></script>
<!--[if lt IE 8]><script type="text/javascript" src="iedivfix.js"></script><![endif]-->
<script src="js/materialize.min.js"></script>
<script type="text/javascript">
// <![CDATA[
var msgs=['{$JS_REGIST_WITHOUTCOMMENT}','{$JS_REGIST_UPLOAD_NOTSUPPORT}','{$JS_CONVERT_SAKURA}'];
var ext="{$ALLOW_UPLOAD_EXT}".toUpperCase().split("|");
// ]]>
  $(document).ready(function() {
    $('select').material_select();
  });
</script>
<!--/&JSHEADER-->

<!--&TOPLINKS-->
  <nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo"><i class="large material-icons">portable_wifi_off</i>{$TITLE}</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li>{$HOME}</li>
        <li>{$SEARCH}</li>
        <li>{$HOOKLINKS}</li>
		<li>{$TOP_LINKS}</li>
		<li>{$STATUS}</li>
		<li>{$ADMIN}</li>
		<li>{$REFRESH}</li>
      </ul>
    </div>
  </nav>
<!--/&TOPLINKS-->

<!--&BODYHEAD-->
<body>

<div id="header">
<!--&TOPLINKS/-->
<br />


</div>

<div class="container">

<!--/&BODYHEAD-->

<!--&POSTFORM-->
<form action="{$SELF}" method="post" enctype="multipart/form-data" onsubmit="return c();" id="postform_main">
<!--&IF($FORMTOP,'{$FORMTOP}','')-->
<div class="card hoverable" id="postcard">
<div class="card-content">
<span class="card-title">POST</span>

<div id="postform">

<input type="hidden" name="mode" value="{$MODE}" />
<input type="hidden" name="MAX_FILE_SIZE" value="{$MAX_FILE_SIZE}" />
<input type="hidden" name="upfile_path" value="" />
<!--&IF($RESTO,'{$RESTO}','')-->
<div class="col s12">
<div class="row"><div class="input-field col s6">{$FORM_NAME_FIELD}<label for="fname">{$FORM_NAME_TEXT}</label></div>
<div class="input-field col s6">{$FORM_EMAIL_FIELD}<label for="femail">{$FORM_EMAIL_TEXT}</label></div></div>
<div class="row"><div class="input-field col s12"><label for="fsub">{$FORM_TOPIC_TEXT}</label>{$FORM_TOPIC_FIELD}</div></div>
<div class="row"><div class="input-field col s12"><label for="fcom">{$FORM_COMMENT_TEXT}</label>{$FORM_COMMENT_FIELD}</div></div>
<!--&IF($FORM_ATTECHMENT_FIELD,'<div class="row"><div class="file-field col s8"><div class="btn"><span>{$FORM_ATTECHMENT_TEXT}</span>{$FORM_ATTECHMENT_FIELD}</div><div class="file-path-wrapper"><input class="file-path validate" type="text"></div></div><div class="col s4">{$FORM_NOATTECHMENT_FIELD}<label for="noimg">{$FORM_NOATTECHMENT_TEXT}</label></div></div>','')-->
<!--&IF($FORM_CONTPOST_FIELD,'<div class="row"><div class="col s12">{$FORM_CONTPOST_FIELD}<label for="up_series">{$FORM_CONTPOST_TEXT}</label></div></div>','')-->
<!--&IF($FORM_ATTECHMENT_FIELD,'','')-->
<!--&IF($FORM_CATEGORY_FIELD,'<div class="row"><div class="input-field col s12"><label for="category">{$FORM_CATEGORY_TEXT}</label>{$FORM_CATEGORY_FIELD}<small>{$FORM_CATEGORY_NOTICE}</small></div></div>','')-->
<div class="row"><div class="input-field col s12"><label for="pwd">{$FORM_DELETE_PASSWORD_TEXT}</label>{$FORM_DELETE_PASSWORD_FIELD}<small>{$FORM_DELETE_PASSWORD_NOTICE}</small></div></div>
{$FORM_EXTRA_COLUMN}
<div class="row">
<div id="postinfo" class="col s12">
<ul>{$FORM_NOTICE}
<!--&IF($FORM_NOTICE_STORAGE_LIMIT,'{$FORM_NOTICE_STORAGE_LIMIT}','')-->
{$HOOKPOSTINFO}
{$ADDITION_INFO}
</ul>
<noscript><div>{$FORM_NOTICE_NOSCRIPT}</div></noscript>
</div>
</div>
</div>
<script type="text/javascript">l1();</script>

</div>
</div>
<div class="card-action">
{$FORM_SUBMIT}
</div>
</div>
</form>
<!--&IF($FORMBOTTOM,'{$FORMBOTTOM}','')-->

<!--/&POSTFORM-->

<!--&FOOTER-->
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
            <a class="grey-text text-lighten-4 right" href="#!">{$FOOTER}</a>
        </div>
    </div>
</footer>
<script type="text/javascript">preset();</script>
</div>

</html>
<!--/&FOOTER-->

<!--&ERROR-->
<div id="error" class="card hoverable">
<div class="card-content">
<span class="card-title">{$MESG}<div class="divider"></div></span>
<a class="waves-effect waves-teal" href="{$SELF2}">{$RETURN_TEXT}</a>　<a class="waves-effect waves-teal" href="javascript:history.back();">{$BACK_TEXT}</a>
</div>
</div>
<!--/&ERROR-->


<!--&THREAD-->
<div class="threadpost card hoverable" id="r{$NO}">
<div class="card-content">
<div class="row"><span class="card-title"><input type="checkbox" class="filled-in" name="{$NO}" value="delete" id="delchk{$NO}"/><label for="delchk{$NO}"></label>{$SUB}</span></div>
<!--&IF($IMG_BAR,'<div class="row">','')-->{$IMG_BAR}<!--&IF($IMG_BAR,'<br />','')-->{$IMG_SRC}<!--&IF($IMG_BAR,'</div>','')-->
<div class="row">{$NAME_TEXT}<span class="name">{$NAME}</span> [{$NOW}] {$QUOTEBTN}&#160;{$REPLYBTN}</div>
<div class="row"><div class="quote">{$COM}</div>
<!--&IF($CATEGORY,'<div class="category">{$CATEGORY_TEXT}{$CATEGORY}</div>','')--></div>
<div class="row">{$WARN_OLD}{$WARN_BEKILL}{$WARN_ENDREPLY}{$WARN_HIDEPOST}</div>
</div>
</div>
<!--/&THREAD-->

<!--&REPLY-->
<div class="reply" id="r{$NO}"><div class="replywrap">
<input type="checkbox" name="{$NO}" value="delete" /><span class="title">{$SUB}</span> {$NAME_TEXT}<span class="name">{$NAME}</span> [{$NOW}] {$QUOTEBTN} &#160;<!--&IF($IMG_BAR,'<br />&#160;','')-->{$IMG_BAR} {$IMG_SRC}
<div class="quote">{$COM}</div>
<!--&IF($CATEGORY,'<div class="category">{$CATEGORY_TEXT}{$CATEGORY}</div>','')-->
{$WARN_BEKILL}</div></div>
<!--/&REPLY-->

<!--&SEARCHRESULT-->
<div class="threadpost">
<span class="title">{$SUB}</span>
{$NAME_TEXT}<span class="name">{$NAME}</span> [{$NOW}] No.{$NO}
<div class="quote">{$COM}</div>
<!--&IF($CATEGORY,'<div class="category">{$CATEGORY_TEXT}{$CATEGORY}</div>','')-->
</div>
<!--&REALSEPARATE/-->
<!--/&SEARCHRESULT-->

<!--&THREADSEPARATE-->

<!--/&THREADSEPARATE-->

<!--&REALSEPARATE-->
<div class="divider"></div>
<!--/&REALSEPARATE-->

<!--&DELFORM-->
<div id="del" class="card">
<div class="card-content">
<span class="card-title">{$DEL_HEAD_TEXT}</span>
<div class="row">{$DEL_IMG_ONLY_FIELD}<label for="onlyimgdel">{$DEL_IMG_ONLY_TEXT}</label></div>
<div class="row"><label for="delpass">{$DEL_PASS_TEXT}</label>{$DEL_PASS_FIELD}</div>{$DEL_SUBMIT_BTN}
</div>
</div>
<!--/&DELFORM-->

<!--&MAIN-->
<div id="contents">
{$THREADFRONT}
<form action="{$SELF}" method="post">
<div id="threads" class="autopagerize_page_element">
{$THREADS}
</div>
{$THREADREAR}
<!--&DELFORM/-->
<script type="text/javascript">l2();</script>
</form>
{$PAGENAV}
</div>
<!--/&MAIN-->
