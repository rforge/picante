
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

<!-- own website starts here, the following may be changed as you like -->
<h1>picante</h1>
<h2><strong>P</strong>hylocom <strong>i</strong>ntegration, <strong>c</strong>ommunity <strong>a</strong>nalyses, <strong>n</strong>ull-models, <strong>t</strong>raits and <strong>e</strong>volution in R</h2>

<!-- end of project description -->
<h2>About picante</h2>
<p>The picante package aims to provide a comprehensive set of tools for analyzing the phylogenetic and trait diversity of ecological communities in R, along with other comparative analyses and manipulations of phenotypic and phylogenetic data.</p>
<p><strong>Package maintainer:</strong> Steven Kembel</p>
<p><strong>Developers:</strong> Peter Cowan, Matthew Helmus, Steven Kembel</p>
<p><strong>Contributors:</strong> David Ackerly, Simon Blomberg, Peter Cowan,
    Matthew Helmus, Steven Kembel, Helene Morlon, Cam Webb<p>
<p>Development of picante has been supported by <a href="http://nserc.ca">NSERC</a>, <a href="http://www.nescent.org/index.php">NESCent</a>, and the <a href="http://code.google.com/soc/2008/">Google Summer of Code</a>.</p>

<h2>News</h2>
<ul>
<li>The pd and phylosor functions in version 0.5 of picante could result in incorrect calculation of phylosor in cases where the supplied phylogeny included taxa not present in any sample, or when pairs of samples collectively contained all taxa in the phylogeny. These functions have been updated in version 0.6, please see the documentation for more information about how PD and phylosor are calculated.</li>
<li>Thanks to Catherine Graham, Nathaniel Hallinan, Nick Matzke, Alain Paquette, Juan Parra, and Marten Winter for feedback and bug reports.</li>
</li>
</ul>

<h2>Current features</h2>
<ul>
<li>Community phylogenetic and trait similarity measures</li>
    <ul>
    <li>Webb's NRI/NTI and related measures of standardized effect size of community structure</li>
    <li>Mean pairwise distance and mean distance to nearest neighbour among co-occurring species (can be used with any interspecific distance measure)</li>
    <li>Correlations between species co-occurrence and phylogenetic distances</li>
    <li>Phylogenetic diversity measures of Helmus et al. (2007).</li>
    <li>Phylogenetic community-environment regressions of Helmus et al. (2007).</li>
    <li>Phylogenetic beta diversity measures (phylosor of Bryant et al. 2008).</li>
    </ul>
<li>Phylogenetic signal (Blomberg <em>et al.</em>'s K statistic and P-value based on randomization test)</li>
<li>Independent contrasts for traits with circular distributions</li>
<li>Null models for community and phylogeny randomization</li>
    <ul>
    <li>Shuffle taxa labels across tips of phylogeny</li>
    <li>Randomize community co-occurrence data
        <ul>
        <li>maintaining species occurrence frequency</li>
        <li>maintaining sample species richness</li>
        <li>maintaining both species occurrence frequency and sample species richness using independent swap (Gotelli 2000) or trial swap (Miklos and Podani 2004)</li>
        </ul>
    </li>
    </ul>
<li>Ives and Godfray's (2006) phylogenetic bipartite linear model.
<li>Utility functions to read/write data in <a href="http://phylodiversity.net/phylocom/">Phylocom</a> format</li>
<li>Tree plotting and labelling functions</li>
</ul>

<h2>Obtaining picante</h2>
<ul>
<li>Version 0.6 is available on <a href="http://cran.r-project.org/">CRAN</a>. Simply type <strong><code>install.packages("picante")</code></strong> from within R.</li>
<li>You can grab the latest nightly build <a href="http://r-forge.r-project.org/R/?group_id=134">here</a>, or by typing <strong><code>install.packages("picante",repos="http://R-Forge.R-project.org")</code></strong> from within R.</li>
</ul>

<h2>Obtaining help and more information about picante</h2>
<p>Visit the <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>project summary page</strong></a> for bug reporting, feature requests, discussions, mailing lists, and access to the source code. If you have problems or questions about the code, please read the function documentation ( <code><strong>help(picante)</strong></code> ), and get in touch with us using one of the above methods.</p>

<h2>Release history</h2>
<p><ul>
<li>Version 0.6: Bugfix release. Changes to pd and phylosor functions.</li>
<li>Version 0.5: Phylogenetic beta diversity measures (phylosor) with randomization testing.</li>
<li>Version 0.4: New features and greatly improved speed of community randomizations (randomizeSample). New phylogenetic bipartite linear models functionality added.</li>
<li>Version 0.3: Bugfixes. Added phylogenetic bipartite linear models, phylogenetic community-environment regressions.</li>
<li>Version 0.2: Added new community phylogenetic structure metrics (PSR/PSV/PSC methods of Helmus et al.) and phylogenetic species richness accumulation curves</li>
<li>Version 0.1: Initial public release</li>
</ul>
</p>

<! --- R-Forge Logo --- >
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td ALIGN="center">
<a href="/"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge Logo" /> </a> </td>
<td ALIGN="center"><a href="http://www4.clustrmaps.com/counter/maps.php?url=http://picante.r-forge.r-project.org/" id="clustrMapsLink"><img src="http://www4.clustrmaps.com/counter/index2.php?url=http://picante.r-forge.r-project.org/" style="border:0px;" alt="Locations of visitors to this page" title="Locations of visitors to this page" id="clustrMapsImg" onerror="this.onerror=null; this.src='http://www2.clustrmaps.com/images/clustrmaps-back-soon.jpg'; document.getElementById('clustrMapsLink').href='http://www2.clustrmaps.com';" />
</a></td>
</tr>
</table>

</body>
</html>

