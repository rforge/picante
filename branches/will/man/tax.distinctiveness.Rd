\name{tax.distinctiveness}
\Rdversion{1.1}
\alias{tax.distinctiveness}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
Taxic diversity: Vane-Wright et al., 1991 and May 1990 which accounts for polytomies by counting the number of branches descending from each node that lies on the path from a spp tip to the root (not just counting the number of nodes).
}
\usage{
tax.distinctiveness(tree, type = c("Vane-Wright", "May"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
phylogeny in ape format
}
  \item{type}{
specify "Vane-Wright" or "May"
}


\references{
Vane-Wright, R.I., Humphries, C.J. and Williams, P.H. (1991). What to protect? Ð Systematics
and the agony of choice. Biological Conservation, 55, 235-254.

May, R.M. (1990). Taxonomy as destiny. Nature, 347, 129-130.

Mark Vellend, William K. Cornwell, Karen Magnuson-Ford, and Arne ¯. Mooers. Measuring phylogenetic biodiversity
In: Biological diversity: frontiers in measurement and assessment.
Edited by Anne Magurran & Brian McGill. in press
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
function(tree, type=c("Vane-Wright", "May")){

if(is.rooted(tree)==FALSE)
warning("A rooted phylogeny is required for meaningful output of this function", call.=FALSE)

n.nodes<- switch(type, "Vane-Wright"=node.number(tree),
	"May"={edge<- tree$edge

	for(i in 1:length(tree$tip.label)){
	spp<- tree$tip.label[i]
	nodes<- get.nodes(tree, spp)
	n.branch<- nrow(edge[edge[,1] \%in\% nodes,])
	if(i==1)
		n.branch.all<- n.branch else
		n.branch.all<- c(n.branch.all, n.branch)}
	n.nodes<- cbind(tree$tip.label, as.data.frame(n.branch.all))
		})

	w<- as.data.frame(1/n.nodes[,2])/sum(1/n.nodes[,2])
	results<- cbind(tree$tip.label, w)
	names(results)<- c("Species", "w")
	results
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
