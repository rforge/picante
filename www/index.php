
<!-- This is the project specific website template -->
<!-- It can be changed as liked or replaced by other content -->

<?php

$domain=ereg_replace('[^\.]*\.(.*)$','\1',$_SERVER['HTTP_HOST']);
$group_name=ereg_replace('([^\.]*)\..*$','\1',$_SERVER['HTTP_HOST']);
$themeroot='http://r-forge.r-project.org/themes/rforge/';

echo '<?xml version="1.0" encoding="UTF-8"?>';
?>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en   ">

  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title><?php echo $group_name; ?></title>
	<link href="picantestyle.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<div id = "header">
<h1 align="center">Picante: R tools for integrating phylogenies and ecology</h1>
</div>

<div id = "content">
<img border=3 src="picante.jpg" alt="picante traitgram" align="right" />
<h2>About Picante</h2>
<p>The Picante package provides tools for <strong>P</strong>hylocom <strong>i</strong>ntegration, <strong>c</strong>ommunity <strong>a</strong>nalyses, <strong>n</strong>ull-models, <strong>t</strong>raits and <strong>e</strong>volution in R.</p>
<p>The package includes functions for analyzing the phylogenetic and trait diversity of ecological communities, comparative analyses, and the display and manipulation of phenotypic and phylogenetic data.</p>

<h2>News</h2>

<h3>The <a href="https://cran.r-project.org/web/packages/picante/index.html">picante package</a> is available on CRAN.</h3>

<h3>Development of picante has been moved to Github. Please update your bookmarks to the new homepage for picante at <a href="https://github.com/skembel/picante">https://github.com/skembel/picante</a>.</h3>

<h3>The version of the code at R-Forge is out of date and no longer updated.</h3>

<p>For bug reports, feature requests, and discussion please use Github.</p>


<h2>Picante: the movie</h2>
<p>If you liked the software, you'll love this movie depicting the history of Picante development from version 0.0 to 1.0!</p>
<p><object width="400" height="300"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=9476569&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=9476569&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object></p>

<p align="center"><a href="http://www4.clustrmaps.com/counter/maps.php?url=http://picante.r-forge.r-project.org/" id="clustrMapsLink"><img src="http://www4.clustrmaps.com/counter/index2.php?url=http://picante.r-forge.r-project.org/" style="border:0px;" alt="Locations of visitors to this page" title="Locations of visitors to this page" id="clustrMapsImg" onerror="this.onerror=null; this.src='http://www2.clustrmaps.com/images/clustrmaps-back-soon.jpg'; document.getElementById('clustrMapsLink').href='http://www2.clustrmaps.com';" />
</a></p>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-9707378-2");
pageTracker._trackPageview();
} catch(err) {}</script>

</body>
</html>

