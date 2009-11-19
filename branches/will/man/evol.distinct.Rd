\name{evol.distinct}
\Rdversion{1.1}
\alias{evol.distinct}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Species' evolutionary distinctiveness
}
\description{
Evolutionary distinctiveness measures for a suite of species by: a) equal splits (Redding and Mooers 2006) b) fair proportions (Isaac et al., 2007). Returns a vector of species scores.
}
\usage{
evol.distinct(tree, type = c("equal.splits", "fair.proportion"), scale = F, use.branch.lengths = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tree}{
a .phylo "APE" tree}
  \item{type}{
a) equal splits (Redding and Mooers 2006) or b) fair proportions (Isaac et al., 2007)
}
  \item{scale}{
%%     The scale option refers to whether or not the phylogeny should be scaled to a depth of 1 or, in the case of an ultrametric tree,  scaled such that branch lengths are relative.
}
  \item{use.branch.lengths}{
If use.branch.lengths=FALSE, then all branch lengths are changed to 1.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
Redding, D.W. and Mooers, A.O. (2006). Incorporating evolutionary measures into conservation
prioritisation. Conservation Biology, 20, 1670-1678.

Isaac, N.J.B., Turvey, S.T., Collen, B., Waterman, C. and Baillie, J.E.M. (2007). Mammals on
the EDGE: conservation priorities based on threat and phylogeny. PLoS ONE, 2, e296.
}
\author{
Karen Magnuson-Ford 
Will Cornwell
Arne Mooers
Mark Vellend}
\note{
This function will return a vector of evolutionary distinctivenss for every species in the given tree.
If only a subset of values are needed there are two, concetually distinct options: either prune the tree first and then pass the tree in or subset the resulting vector.  These two options
will provide very different outputs.  
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(tree, type=c("equal.splits", "fair.proportion"), scale=F, use.branch.lengths=TRUE){

if(is.rooted(tree)==FALSE)
warning("A rooted phylogeny is required for meaningful output of this function", call.=FALSE)

if(scale==TRUE){
#Scale tree to have unit depth (for an ultrametric tree) or scale all branches to unit length (for an additive tree)

if(is.ultrametric(tree)==TRUE)
tree<- rescaleTree(tree, 1) else 
tree$edge.length<- tree$edge.length/sum(tree$edge.length)
  }

if(use.branch.lengths==FALSE)
tree<- speciationalTree(tree)

for(i in 1:length(tree$tip.label)){
	spp<- tree$tip.label[i]
	nodes<- get.nodes(tree, spp)
	#get rid of root node
	nodes<- nodes[1:(length(nodes)-1)]
	
	internal.brlen<- tree$edge.length[which(tree$edge[,2] \%in\% nodes)]

#apportion internal branch lengths appropriately
if(length(internal.brlen)!=0){
internal.brlen<- internal.brlen*switch(type,
	"equal.splits"=	sort(rep(.5,length(internal.brlen))^c(1:length(internal.brlen))),
	"fair.proportion"= 1/for(j in 1:length(nodes)){
		n.descendents<- length(node.leaves(tree, nodes[j]))
		if(j==1)
		portion<- n.descendents else
		portion<- c(n.descendents, portion)
		})}
	
	#sum internal branch lengths with the pendant edge
	ED<- sum(internal.brlen, tree$edge.length[which.edge(tree, spp)])
	
	if(i==1)
	w<- ED else
	w<- c(w, ED)
	}
results<- cbind(tree$tip.label, as.data.frame(w))
names(results)<- c("Species", "w")
results
	
	}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
