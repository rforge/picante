#Evolutionary distinctiveness by equal splits (Redding and Mooers 2006)

ED.equal.splits<- function(tree){

for(i in 1:length(tree$tip.label)){
	spp<- tree$tip.label[i]
	nodes<- get.nodes(tree, spp)
	#get rid of root node
	nodes<- nodes[1:(length(nodes)-1)]
	
	brlen<- tree$edge.length[which(tree$edge[,2] %in% nodes)]
	portion<- sort(rep(.5, length(brlen))^c(1:length(brlen)))
	brlen<- brlen*portion
	ED<- sum(brlen, tree$edge.length[which.edge(tree, spp)])
	
	if(i==1)
	w<- ED else
	w<- c(w, ED)
	}
results<- cbind(tree$tip.label, as.data.frame(w))
names(results)<- c("Species", "w")
results
	
	}