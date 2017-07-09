<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html xml:lang="zh-tw">
<head>
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="Sat, 1 Jan 2000 00:00:00 GMT" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="zh-tw" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, user-scalable=yes" />
<title>Thread <xsl:value-of select="threads/@no" /> : Pixmicat! Archiver</title>

<link href="../css/materialicon.css" rel="stylesheet" type="text/css"/>
<link href="../css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>

<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/materialize.min.js"></script>

<script type="text/javascript">
<![CDATA[
if(typeof ActiveXObject!='undefined'){
	//document.write('<style type="text/css">.reply { display: inline ; zoom: 1; }</style>');
	//attachEvent("onload", function (){var divs=document.getElementsByTagName('div');var divs_cnt=divs.length;for(i=0;i<divs_cnt;i++){if(divs[i].className.substr(0,5)=='reply'){divs[i].insertAdjacentHTML('afterEnd','<br />');}}});
}
]]>
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
      <div id="contents">
          <xsl:apply-templates select="threads" />
      </div>
  </div>

<footer class="page-footer" id="footer">
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

</body>
</html>
</xsl:template>

<xsl:template match="threads">
	<xsl:variable name="image_base"><xsl:value-of select="@no" /><xsl:if test="meta/@archivedate != ''">-<xsl:value-of select="meta/@archivedate" /></xsl:if>_files/</xsl:variable>
	<div class="threadpost card">
	<div class="card-content">
	<span class="card-title"><xsl:value-of select="subject" /><div class="divider"></div></span>
	<xsl:if test="image != ''"> <!--有圖片-->
		<xsl:variable name="image_name"><xsl:value-of select="image" /><xsl:value-of select="image/@ext" /></xsl:variable>
		<xsl:variable name="image_url"><xsl:value-of select="$image_base" /><xsl:value-of select="$image_name" /></xsl:variable>
		<div class="row">檔名：<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="$image_url" /></xsl:attribute><xsl:value-of select="$image_name" /></a>-(<xsl:value-of select="image/@kbyte" /> KB, <xsl:value-of select="image/@scale" />) <small>[以預覽圖顯示]</small></div>
		<div class="row">
		<a target="_blank">
			<xsl:attribute name="href"><xsl:value-of select="$image_url" /></xsl:attribute>
			<img class="img">
				<xsl:attribute name="title"><xsl:value-of select="image/@kbyte" /> KB</xsl:attribute>
				<xsl:attribute name="alt"><xsl:value-of select="image/@kbyte" /> KB</xsl:attribute>
				<xsl:attribute name="src"><xsl:value-of select="$image_base" /><xsl:value-of select="image" />s.jpg</xsl:attribute>
			</img>
		</a>
		</div>
	</xsl:if>
	<div class="row">名稱: <span class="name"><xsl:value-of select="name" /></span> [<xsl:value-of select="date" /> <xsl:if test="host"> IP:<xsl:value-of select="host" /></xsl:if>] No.<xsl:value-of select="@no" /><div class="divider"></div></div>
	<div class="row quote">
		<xsl:apply-templates select="comment" />
		<xsl:if test="pushpost != ''">
			<div class="pushpost"><xsl:apply-templates select="pushpost" /></div>
		</xsl:if>
	</div>
	</div>
	</div>
	<xsl:for-each select="reply">
		<div class="reply"><xsl:attribute name="id">r<xsl:value-of select="@no" /></xsl:attribute>
		<span class="title"><xsl:value-of select="subject" /></span>
		名稱: <span class="name"><xsl:value-of select="name" /></span> [<xsl:value-of select="date" /> <xsl:if test="host"> IP:<xsl:value-of select="host" /></xsl:if>] No.<xsl:value-of select="@no" />
		<xsl:if test="image != ''"> <!--有圖片-->
			<xsl:variable name="image_name"><xsl:value-of select="image" /><xsl:value-of select="image/@ext" /></xsl:variable>
			<xsl:variable name="image_url"><xsl:value-of select="$image_base" /><xsl:value-of select="$image_name" /></xsl:variable>
			<br />檔名：<a target="_blank"><xsl:attribute name="href"><xsl:value-of select="$image_url" /></xsl:attribute><xsl:value-of select="$image_name" /></a>-(<xsl:value-of select="image/@kbyte" /> KB, <xsl:value-of select="image/@scale" />) <small>[以預覽圖顯示]</small><br />
			<a target="_blank">
				<xsl:attribute name="href"><xsl:value-of select="$image_url" /></xsl:attribute>
				<img class="img">
					<xsl:attribute name="title"><xsl:value-of select="image/@kbyte" /> KB</xsl:attribute>
					<xsl:attribute name="alt"><xsl:value-of select="image/@kbyte" /> KB</xsl:attribute>
					<xsl:attribute name="src"><xsl:value-of select="$image_base" /><xsl:value-of select="image" />s.jpg</xsl:attribute>
				</img>
			</a>
		</xsl:if>
		<div class="quote">
			<xsl:apply-templates select="comment" />
			<xsl:if test="pushpost != ''">
				<div class="pushpost"><xsl:apply-templates select="pushpost" /></div>
			</xsl:if>
		</div>
		<xsl:if test="category != ''"> <!--有類別-->
		<div class="category">類別: <xsl:value-of select="category" /></div>
		</xsl:if>
		</div>
	</xsl:for-each>
</xsl:template>

<xsl:template match="comment">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="br"><br /></xsl:template>

</xsl:stylesheet>