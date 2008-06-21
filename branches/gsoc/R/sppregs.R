sppregs<-function(samp,env,tree=NULL,fam="binomial"){

  nplots<-dim(samp)[1]     # number of units in the occurence data
  nspp<-dim(samp)[2]       # number of species  in the occurence data
  sppnames<-colnames(samp) # vector of species names


  if(is.null(dim(env)))
  {
    nenvs<-1
    envnames<-names(env)
    if (is.null(envnames)){envnames<-"env"}
    formu<-paste("y~",envnames) #Make formula
  } else {
    nenvs<-dim(env)[2]       # number of environmental variables
    envnames<-colnames(env)  # vecor of env names

    formu<-paste("y~",envnames[1]) #Make formula
    for (t in 2:nenvs)
    {
      formu<-paste(formu,envnames[t],sep="+")
    }
  }

  #Fit either the logistic or the standard regressions
  spp.resids<-NULL
  spp.coef<-NULL
  spp.se<-NULL
  spp.fits<-NULL
               
  if(fam=="gaussian")
  {
      for(i in 1:nspp)
      {
        y<-samp[,i]
        mod<-glm(formu,data=cbind(y,env))
        spp.resids<-cbind(spp.resids,mod$y-mod$fitted.values)
        spp.fits<-cbind(spp.fits,mod$fit)
        spp.coef<-cbind(spp.coef,summary(mod)$coef[,1])
        spp.se<-cbind(spp.se,summary(mod)$coef[,2])
      }

      cors.resid<-cor(spp.resids)[lower.tri(cor(spp.resids))]

  } else {
    samp[samp>0]<-1
    for(i in 1:nspp)
    {
      y<-samp[,i]
      mod<-brglm(formu,data=data.frame(cbind(y,env)))
      spp.resids<-cbind(spp.resids,mod$y-mod$fitted.values)
      spp.fits<-cbind(spp.fits,mod$fitted.values)
      spp.coef<-cbind(spp.coef,summary(mod)$coef[,1])
      spp.se<-cbind(spp.se,summary(mod)$coef[,2])

    }
    cor.r<-matrix(0,nrow=nspp,ncol=nspp)
    for (j in 1:dim(spp.resids)[1])
    {
      invv<-matrix((spp.fits[j,]*(1-spp.fits[j,]))^(-.5),nrow=1)
      invv<-t(invv)%*%invv
      invv[invv>(10^10)]<-(10^10)
		  r<-matrix(spp.resids[j,],nrow=1)
      cor.r=cor.r+((t(r)%*%r)*invv)
    }

    RC=cor.r/dim(spp.resids)[1]
    cors.resid<-RC[upper.tri(RC)] # Observed correlations of residuals among species
  }

  colnames(spp.coef)<-colnames(samp)
  colnames(spp.se)<-colnames(samp)
  colnames(spp.resids)<-colnames(samp)
  colnames(spp.fits)<-colnames(samp)
  pairnames=NULL
  for (o in 1:(nspp-1))
  {
    for (u in (o+1):nspp)
    {
    pairnames<-c(pairnames,paste(sppnames[o],sppnames[u],sep="-"))
    }
  }
  cors.pa<-cor(samp)[upper.tri(cor(samp))]
  names(cors.pa)<-pairnames
  names(cors.resid)<-pairnames

# If a tree is provided
  if (is.null(tree))
  {
    return(list(family=fam,residuals=spp.resids,coefficients=spp.coef,std.errors=spp.se,cors.pa=cors.pa,cors.resid=cors.resid,cors.phylo=NULL))
  } else {
  
  if(is(tree)[1]=="phylo")
  {
    tree<-prune.sample(samp,tree)
    # Make a correlation matrix of the species pool phylogeny
    Cmatrix<-vcv.phylo(tree,cor=TRUE)
  } else {
    Cmatrix<-tree
    species<-colnames(samp)
    Cmatrix<-Cmatrix[species,species]
  }
  
  cors.phylo<-Cmatrix[upper.tri(Cmatrix)]
  names(cors.phylo)<-pairnames
  return(list(family=fam,residuals=spp.resids,coefficients=spp.coef,std.errors=spp.se,cors.pa=cors.pa,cors.resid=cors.resid,cors.phylo=cors.phylo))
 
  }
}