\name{PSDcalc}
\alias{PSDcalc}
\alias{PSVcalc}
\alias{PSRcalc}
\alias{PSEcalc}
\alias{PSCcalc}
\alias{spp.PSVcalc}
\alias{PSV}
\alias{PSR}
\alias{PSE}
\alias{PSD}
\alias{PSC}
\alias{spp.psvcalc}
\alias{psv}
\alias{psr}
\alias{pse}
\alias{psd}
\alias{psc}
\alias{spp.PSV}
\title{ Phylogenetic Species Diversity Metrics }
\description{
  Calculate the bounded phylogenetic biodiversity metrics: phylogenetic species variability, richness, evenness and clustering for one or multiple samples.
}
\usage{
\PSVcalc(samp,tree,compute.var=TRUE)
\cr
\PSRcalc(samp,tree,compute.var=TRUE)
\cr
\PSEcalc(samp,tree)
\cr
\PSCcalc(samp,tree,compute.var=TRUE)
\cr
\PSDcalc(samp,tree,compute.var=TRUE)
\cr
\spp.PSVcalc(samp,tree)
}

\arguments{
  \item{samp}{ Community data matrix }
  \item{tree}{ A phylo tree object or a phylogenetic covariance matrix }
  \item{compute.var}{ Computes the expected variances for PSV and PSR for each community }
}
\details{
 \\emph{Phylogenetic species variability (PSV)} quantifies how phylogenetic relatedness decreases the variance of a hypothetical unselected/neutral trait
 shared by all species in a community. The expected value of PSV is statistically independent of species richness, is one when all species in a sample
 are unrelated (i.e., a star phylogeny) and approaches zero as species become more related. PSV is directly related to mean phylogenetic distance. The 
 expected variance around PSV for any sample of a particular species richness can be approximated. 
 \To address how individual species contribute to the mean PSV of a data set, the function spp.PSVcalc gives signed proportions of the total deviation 
 from the mean PSV that occurs when all species are removed from the data set one at a time. The absolute values of these \dQuote{species effects} 
 tend to positively correlate with species prevalence. 
 \cr
 \\emph{Phylogenetic species richness (PSR)} is the number of species in a sample multiplied by PSV. It can be considered the species richness of a sample
 after discounting by species relatedness. The value is maximum at the species richness of the sample, and decreases towards zero as relatedness 
 increases. The expected variance around PSR for any sample of a particular species richness can be approximated.
 \cr
 \\emph{Phylogenetic species evenness (PSE)} is the metric PSV modified to incorporate relative species abundances. The maximum attainable value of PSE (i.e., 1)
  occurs only if species abundances are equal and species phylogeny is a star. PSE essentially grafts each individual of a species onto the tip of the 
  phylogeny of its species with branch lengths of zero.
  \cr
  \\emph{Phylogenetic species clustering (PSC)} is a metric of the branch tip clustering of species across a sample's phylogeny. As PSC increases to 1, species
   are less related to one another the tips of the phylogeny. PSC is directly related to mean nearest neighbor distance.
}
  \cr
  \note{These metrics are bounded either between zero and one (PSV,PSE,PSC) or zero and species richness (PSR); but the metrics asymptotically 
  approach zero as relatedness increases. Zero can be assigned to communities with less than two species, but conclusions drawn from assigning 
  communities zero values need be carefully explored for any data set. The data sets need not be species-community data sets but may be any sample 
  data set with an associated phylogeny. 
}


\value{
	a dataframe of the respective phylogenetic species diversity metric values  
}
\references{ Helmus M.R., Bland T.J., Williams C.K. & Ives A.R. (2007) Phylogenetic measures of biodiversity. American Naturalist, 169, E68-E83 }
\author{ Matt Helmus \email{mrhelmus@gmail.com} }
\seealso{ \code{\link{mpd}} ,\code{\link{mnnd}} }

\keyword{univar}



