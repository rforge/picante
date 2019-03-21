
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

</body>
</html>

