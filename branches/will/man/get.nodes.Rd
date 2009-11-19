\name{get.nodes}
\Rdversion{1.1}
\alias{get.nodes}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
gets nodes along the evolutionary path to a given species
}
\description{
Get a vector of the nodes that are along the path from the root to spp x.  Used in other functions.
}
\usage{
get.nodes(tree, spp)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
APP tree
}
  \item{spp}{
specific species; same format as which.edge in the APE library
}
}


\author{
Karen Magnuson-Ford 
Will Cornwell
Arne Mooers
Mark Vellend
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(tree, spp){
	edge<- which.edge(tree, spp)
	nodes<- tree$edge[edge,1] 
	root.edge<- which(tree$edge[,1]==(length(tree$tip.label)+1))
while(!(edge \%in\% root.edge)){
	edge<- which.edge(tree, tree$edge[edge,1])
	next.node<- tree$edge[edge,1]
	nodes<- c(nodes, next.node)
	}
	nodes
	}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
