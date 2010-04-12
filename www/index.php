
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
<p><strong>Package maintainer:</strong> Steven Kembel</p>
<p><strong>Developers:</strong> Peter Cowan, Matthew Helmus, Steven Kembel</p>
<p><strong>Contributors:</strong> David Ackerly, Simon Blomberg, Will Cornwell, Peter Cowan, Matthew Helmus, Steven Kembel, Helene Morlon, Cam Webb<p>    
<p>Development of picante has been supported by <a href="http://nserc.ca">NSERC</a>, <a href="http://www.nescent.org/index.php">NESCent</a>, the <a href="http://code.google.com/soc/2008/">Google Summer of Code</a>, and the <a href="http://www.moore.org/">Gordon and Betty Moore Foundation</a>.</p>
<p>Thanks to Kyle Dexter, Catherine Graham, Nathaniel Hallinan, Nick Matzke, Alain Paquette, Juan Parra, Dan Rabosky, and Marten Winter for feedback and bug reports.</p>

<h2>News</h2>
<ul>
<li>A manuscript describing Picante has been accepted for publication in Bioinformatics.</li>
<li>Picante 1.1 has been released
<ul>
<li>Added a package vignette with information about data formats and examples of analyses</li>
<li>Data from Ives & Godfray (2006) now included in the package, type <code><strong>help(IvesGodfray)</code></strong> in R for more information.</li>
</ul>
</li>
<li>Lots of changes and new features in version 1.0
<ul>
<li>Calculate Rao's quadratic entropy (alpha and beta diversity taking phylogenetic distinctiveness into account)</li>
<li>Added more phylobeta diversity measures (UniFrac, Rao's quadratic entropy)</li>
<li>Changed name of randomizeSample to randomizeMatrix for consistency with other functions</li>
<li>Added automatic checks to ensure taxa labels in phylogeny and other data sets match</li>
</ul>
</li>
</ul>

<h2>Current features</h2>
<ul>
<li>Community phylogenetic and trait diversity</li>
    <ul>
    <li>Faith's PD (phylogenetic diversity) and standardized effect size of PD.</li>
    <li>Webb's NRI/NTI and related measures of standardized effect size of community phylogenetic structure.</li>
    <li>Mean pairwise distance and mean distance to nearest taxon among co-occurring species (can be used with any interspecific distance measure). Distances can be calculated based on presence or abundance in samples.</li>
    <li>Rao's quadratic entropy, a measure of diversity within and among communities optionally taking phylogenetic distinctiveness into account.</li>
    <li>Correlations and quantile regressions between species co-occurrence and phylogenetic distances</li>
    <li>Phylogenetic species richness, evenness and variance of Helmus et al. (2007).</li>
    <li>Phylogenetic community-environment regressions of Helmus et al. (2007).</li>
    <li>Taxonomic and evolutionary distinctiveness of taxa for conservation biology.</li>
    <li>Numerous phylogenetic beta diversity measures (phylosor, UniFrac, betaMPD, betaMNTD, Rao's quadratic entropy).</li>
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
<li>Version 1.1-0 is available on <a href="http://cran.r-project.org/">CRAN</a>. Simply type <strong><code>install.packages("picante")</code></strong> from within R.</li>
<li>You can grab the latest nightly build <a href="http://r-forge.r-project.org/R/?group_id=134">here</a>, or by typing <strong><code>install.packages("picante",repos="http://R-Forge.R-project.org")</code></strong> from within R.</li>
</ul>

<h2>Obtaining help and more information about picante</h2>
<p>There is a package vignette with more information about Picante data formats and analysis examples. Download it <a href="picante-intro.pdf">here</a>, or type <code><strong>vignette("picante-intro")</strong></code> to view within R.
<p>Visit the <a href="http://<?php echo $domain; ?>/projects/<?php echo $group_name; ?>/"><strong>project summary page</strong></a> for bug reporting, feature requests, discussions, mailing lists, and access to the source code. If you have problems or questions about the code, please read the function documentation ( <code><strong>help(picante)</strong></code> ), and get in touch with us using one of the above methods.</p>

<h2>Citing picante</h2>
<p>If you use our software, please acknowledge our work by citing us! A manuscript describing the software package is in press. In the meantime, you can cite picante as:
<ul><li>
S.W. Kembel, D.D. Ackerly, S.P. Blomberg, W.K. Cornwell, P.D. Cowan, M.R. Helmus, H. Morlon and C.O. Webb. In press. Picante: R tools for integrating phylogenies and ecology. Bioinformatics.
</li></ul>
</p>

<h2>Release history</h2>
<p><ul>
<li>Version 1.1: Added package vignette, new example data set from Ives & Godfray (2006), function example code. Reinstated "richness" and "frequency" null models for ses.* functions.</li>
<li>Version 1.0: Added raoD, unifrac, taxonomic and evolutionary distinctiveness functions. Modified phylosor to work with non-ultrametric phylogenies. Changed name of randomizeSample to randomizeMatrix. Added functions for checking taxa label matching between phylogenies and other data.</li>  
<li>Version 0.7-1: Added ses.pd function</li>
<li>Version 0.7: comm.phylo.qr function (quantile regression of co-occurrence and phylogenetic distance). traitgram function. Changed mnnd terminology to mntd. Added phylogenetic beta diversity measures comdist/comdistnt. Abundance weighting of mpd/mntd.
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
<a href="http://r-forge.r-project.org"><img src="<?php echo $themeroot; ?>/images/logo.png" border="0" alt="R-Forge" /> </a> </td>
<td ALIGN="center"><a href="http://www4.clustrmaps.com/counter/maps.php?url=http://picante.r-forge.r-project.org/" id="clustrMapsLink"><img src="http://www4.clustrmaps.com/counter/index2.php?url=http://picante.r-forge.r-project.org/" style="border:0px;" alt="Locations of visitors to this page" title="Locations of visitors to this page" id="clustrMapsImg" onerror="this.onerror=null; this.src='http://www2.clustrmaps.com/images/clustrmaps-back-soon.jpg'; document.getElementById('clustrMapsLink').href='http://www2.clustrmaps.com';" />
</a></td>
</tr>
</table>
</div>

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

