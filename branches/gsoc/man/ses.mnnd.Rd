\name{ses.mnnd}
\alias{ses.mnnd}

\title{ Standardized effect size of MNND }
\description{
  Standardized effect size of mean nearest neighbour distances in communities. When used with a phylogenetic distance matrix, equivalent to -1 times the Nearest Taxon Index (NTI).
}
\usage{
ses.mnnd(samp, dis, null.model = c("taxa.labels", "sample.pool",
    "phylogeny.pool", "weighted.sample.pool"), runs = 99)
}

\arguments{
  \item{samp}{ Community data matrix }
  \item{dis}{ Distance matrix (generally a phylogenetic distance matrix)}
  \item{null.model}{ Null model to use 
    \item{taxa.labels}{Shuffle distance matrix labels (across all taxa included in distance matrix)}
    \item{sample.pool}{Randomize community data matrix by drawing species from pool of species occurring in at least one community (sample pool) with equal probability}  
    \item{phylogeny.pool}{Randomize community data matrix by drawing species from pool of species occurring in the distance matrix (phylogeny pool) with equal probability}  
    \item{weighted.sample.pool}{Randomize community data matrix by drawing species from sample pool with probability weighted by occurrence frequency}
  }
  \item{runs}{ Number of randomizations }
}

\value{
  A data frame of results for each community
  \item{ntaxa}{Number of taxa in community}
  \item{mpd.obs}{Observed MNND in community}
  \item{mpd.rand.mean}{Mean MNND in null communities}
  \item{mpd.rand.sd}{Standard deviation of MNND in null communities}
  \item{mpd.obs.rank}{Rank of observed MNND vs. null communities}
  \item{mpd.obs.z}{Standardized effect size of MNND vs. null communities (= (mpd.obs - mpd.rand.mean) / mpd.rand.sd, equivalent to -NTI)}
  \item{mpd.obs.p}{P-value (quantile) of observed MNND vs. null communities (= mpd.obs.rank / runs + 1)}
  \item{runs}{Number of randomizations}  
}
\references{ Webb, C.O., Ackerly, D.D., and Kembel, S.W. 2008. Phylocom: software for the analysis of phylogenetic community structure and trait evolution. Version 4.0.1. \url{http://www.phylodiversity.net/phylocom/}. }
\author{ Steven Kembel <skembel@uoregon.edu> }
\section{Warning }{ Weighted null model currently only works with presence-absence data. Convert your data to presence-absence before using this null model (e.g. \code{decostand(x,method="pa")})}
\seealso{ \code{\link{mnnd}} }
\examples{
data(phylocom)
ses.mnnd(phylocom$sample, cophenetic(phylocom$phylo),null.model="taxa.labels")}
\keyword{univar}
