\name{specaccum.PSR}
\alias{specaccum.PSR}

\title{ Phylogenetic Species Richness Sample-Based Rarefaction Curve }
\description{
  Finds a sample-based rarefaction curve for phylogentic species richness for a set of samples.
}
\usage{
specaccum.PSR(samp, tree, permutations = 100, method = "random", ...)
}

\arguments{
  \item{samp}{ Community data matrix }
  \item{tree}{ A phylo tree object or a phylogenetic covariance matrix}
  \item{permutations}{ Number of permutations with method method= "random" }
  \item{method} { Species accumulation method, currently only "random" is supported which add samples in random order. }
  \item{...}{ Other parameters to functions }
}

\value{
The function returns an object of class "specaccum" with items:

\item{call}{ Function call. }
\item{method}{ Accumulator method. }
\item{sites}{ Number of sites/samples. For method = "rarefaction" this is the average number of sites corresponding to a certain number of individuals.}
\item{richness}{ The phylogenetic species richness corresponding to number of sites/samples. With method = "collector" this is the observed phylogenetic species richness, for other methods the average or expected phylogenetic species richness. }
\item{sd}{ The standard deviation of phylogenetic apecies accumulation curve (or its standard error). This is NULL in method = "collector", and it is estimated from permutations in method = "random", and from analytic equations in other methods. }
\item{perm}{ Permutation results with method = "random" and NULL in other cases. Each column in perm holds one permutation. }
}

\references{ Gotelli N.J. & Colwell R.K. (2001) Quantifying biodiversity: procedures and pitfalls in the measurement and comparison of species richness. Ecology Letters, 4, 379-391\cr
              Helmus M.R., Bland T.J., Williams C.K. & Ives A.R. (2007) Phylogenetic measures of biodiversity. American Naturalist, 169, E68-E83 }
\author{ Matthew Helmus \email{mrhelmus@gmail.com}
 }
\seealso{ \code{\link{calcPSR}}, \code{\link{specaccum}}}

\keyword{univar}
