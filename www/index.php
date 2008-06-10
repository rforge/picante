
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
	<link href="<?php echo $themeroot; ?>styles/estilo1.css" rel="stylesheet" type="text/css" />
  </head>

<body>

<! --- R-Forge Logo --- >
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<a href="/"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge Logo" /> </a> </td> </tr>
</table>


<!-- get project title  -->
<!-- own website starts here, the following may be changed as you like -->
<h1>picante</h1>
<h2><strong>P</strong>hylocom <strong>i</strong>ntegration, <strong>c</strong>ommunity <strong>a</strong>nalyses, <strong>n</strong>ull-models, <strong>t</strong>raits and <strong>e</strong>volution in R</h2>

<!-- end of project description -->
<h2>About picante</h2>
<p>The picante package aims to provide a comprehensive set of tools for analyzing the phylogenetic and trait diversity of ecological communities in R, along with a set of tools for other comparative analyses and manipulations of phenotypic and phylogenetic data.</p>
<p><strong>Package maintainer:</strong> Steve Kembel</p>
<p><strong>Contributors:</strong> David Ackerly, Simon Blomberg, Peter Cowan,
    Matthew Helmus, Steve Kembel, Cam Webb<p>
<p>Development of picante has been supported by <a href="http://nserc.ca">NSERC</a>, <a href="http://www.nescent.org/index.php">NESCent</a>, and the <a href="http://code.google.com/soc/2008/">Google Summer of Code</a>.

<h2>Current features</h2>
<ul>
<li>Community phylogenetic and trait similarity measures</li>
    <ul>
    <li>Webb's NRI/NTI and related measures of standardized effect size of community structure</li>
    <li>Mean pairwise distance and mean distance to nearest neighbour among co-occurring species (can be used with any interspecific distance measure)</li>
    <li>Correlations between species co-occurrence and phylogenetic distances</li>
    </ul>
<li>Phylogenetic signal (Blomberg <em>et al.</em>'s K statistic and P-value based on randomization test)</li>
<li>Independent contrasts for traits with circular distributions</li>
<li>Null models for community and phylogeny randomization</li>
<li>Utility functions to read/write data in <a href="http://phylodiversity.net/phylocom/">Phylocom</a> format</li>
<li>Tree plotting and labelling functions</li>
</ul>

<h2>Obtaining picante</h2>
<ul>
<li>Version 0.1-2 (stable) is available on <a href="http://cran.r-project.org/">CRAN</a>. Simply type <strong><code>install.packages("picante")</code></strong> from within R.</li>
<li>You can grab the latest nightly build <a href="http://r-forge.r-project.org/R/?group_id=134">here</a>, or by typing <strong><code>install.packages("picante",repos="http://R-Forge.R-project.org")</code></strong> from within R.</li>
</ul>

<h2>Obtaining help and more information about picante</h2>
<p>The <strong>project summary page</strong> with bug reporting, feature requests, discussions, mailing lists, and access to the source code is located <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>here</strong></a>.</p>

<h2>Release history</h2>
<ul>
<li>Version 0.1-2: Initial public release</li>
<ul>
</body>
</html>
