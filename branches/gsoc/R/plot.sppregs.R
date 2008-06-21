plot.sppregs<-function(sppreg,rows=c(1,3),cex.mag=1,x.label="phylogenetic correlations",y.label=c("occurrence correlations w/ env","occurrence correlations wo/ env","change in correlations")){
  par(mfrow=rows,las=1,cex=cex.mag)
  plot(sppreg$cors.phylo,sppreg$cors.pa,xlab=x.label,ylab=y.label[1],main=paste("cor =",round(cor(sppreg$cors.phylo,sppreg$cors.pa,use="pairwise.complete.obs"),4)))
  abline(0,0,lty=2)
  plot(sppreg$cors.phylo,sppreg$cors.resid,xlab=x.label,ylab=y.label[2],main=paste("cor =",round(cor(sppreg$cors.phylo,sppreg$cors.resid,use="pairwise.complete.obs"),4)))
  abline(0,0,lty=2)
  plot(sppreg$cors.phylo,sppreg$cors.resid-sppreg$cors.pa,xlab=x.label,ylab=y.label[3],main=paste("cor =",round(cor(sppreg$cors.phylo,sppreg$cors.resid-sppreg$cors.pa,use="pairwise.complete.obs"),4)))
  abline(0,0,lty=2)
}