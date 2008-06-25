\name{sppregs}
\alias{sppregs}
\alias{plot.sppregs}
\title{ Regressions to Separate Phylogenetic Attraction and Repulsion }
\description{
  Fit regressions on species abundnace or presence/absence across communities and calculate phylogenetic correlations
}
\usage{
sppregs(samp,env,tree=NULL,fam="binomial")
plot.sppregs(sppreg,rows=c(1,3),cex.mag=1,x.label="phylogenetic correlations",
              y.label=c("occurrence correlations w/ env","occurrence correlations wo/ env","change in correlations"))
}

\arguments{
  \item{samp}{ Community data matrix, species as columns, communities as rows }
  \item{env}{ Environmental data matrix }
  \item{tree}{ A phylo tree object or a phylogenetic covariance matrix }
  \item{fam}{ with \code{fam = "binomial"} fit logistic regressions with Firth's bias-reduction; also accepts \code{fam = "gaussian"} }
  \item{sppreg} { object from function \code{sppregs} }
  \item{rows}{ either \code{c(1,3)} plots in a row or \code{c(3,1)} in a column }
  \item{cex.mag}{ value for \code{cex} in \code{par} }
  \item{x.label}{ x axis labels }
  \item{y.label}{ y axis labels }
}

\details{For each species in \code{samp}, the function fits regressions of species presence/absence or abundances
          on the environmental variables supplied in \code{env}; and calculates the \code{(n^2-n)/2} pairwise species correlations
          between the residuals of these fits and pairwise species phylogenetic correlations. The residuals can be
          thought of as the presence/absence of species across sites/communities after accounting for how species respond
          to environmental variation across sites. Each set of coefficents can be tested for phylogenetic signal with, for example, 
          the function \link[picante]{phylosignal}. 
          \cr
          \cr
          The function \code{plot.sppregs} produces a set of three plots of the correlations of pairwise species phylogenetic correlations versus: 
          the observed pairwise correlations of species across communities, the residual correlations, and the pariwise differences between (i.e., the 
          change in species co-occurrence once the environmental variables are taken into account). The significance of these correlations can be tested
          via permutation with the function \code{significance}.
}
          
\value{
\item{family}{ error distribution used }
\item{residuals}{ a dataframe of the residuals from each species regression }
\item{coefficients}{ a dataframe of the estimated coefficients from each species regression that can be tested for phylogenetic signal }
\item{std.errors}{ the standard errors of the coefficients }
\item{correlations}{ correlations of pairwise species phylogenetic correlations between: the observed pairwise correlations of species across communities,
                    the residual correlations, and the pariwise differences between  }
\item{cors.pa}{ the observed pairwise correlations of species across communities }
\item{cors.resid}{ the residual pairwise correlations of species across communities }
\item{cors.phylo}{ the phylogenetic pairwise correlations among species }

}

\references{ Helmus M.R., Savage K., Diebel M.W., Maxted J.T. & Ives A.R. (2007) Separating the determinants of phylogenetic community structure. Ecology Letters, 10, 917-925 }
\author{ Matthew Helmus \email{mrhelmus@gmail.com} }
\seealso{ \code{\link{significance}}, \code{\link{phylosignal}}}

}

