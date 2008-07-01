pblm<-function(assocs,tree1=NULL,tree2=NULL,covars1=NULL,covars2=NULL,bootstrap=FALSE,maxit=10000){


  # Make a vector of associations
  A<-as.matrix(as.vector(as.matrix(assocs)))
  data.vecs<-A
  
  #numbers of species and interactions
  nassocs<-length(A)
  nspp1<-dim(assocs)[1]
	nspp2<-dim(assocs)[2]
  sppnames1<-rownames(assocs)
  sppnames2<-colnames(assocs)
  
  #make names of species pairs
  pairnames=NULL  # make a vector of pairwise comparison names
  for (o in 1:(nspp2))
  {
    for (u in 1:nspp1)
    {
      pairnames<-c(pairnames,paste(sppnames2[o],sppnames1[u],sep="-"))
    }
  }
  
  
  
  #Clean Covariates
  #If the covariate applies to both sets, then it should be in the matrix of the longer set 
  
  covnames<-NULL
  C1covs<-NULL
  if(is.null(covars1))
  {
    C1<-NULL
  } else {
    if(is.null(dim(covars1)))
    {
      C1<-matrix(covars1,nspp1,nspp2,byrow=FALSE)
      if(is.factor(covars1))
      {
        C1<-as.matrix(as.vector(C1))
        C1covs<-cbind(C1covs,C1)
        C1<-as.matrix(model.matrix(~as.factor(C1)-1)[,-1])
        colnames(C1)<-paste(rep("covar1",length(levels(covars1))-1),levels(covars1)[-1],sep="-")
      } else {
        C1<-as.matrix(as.vector(C1))
        C1covs<-cbind(C1covs,C1)
      }
      covnames<-c(covnames,"covar1")
    } else {
      C1<-NULL
      for(i in 1:dim(covars1)[2])
      {
        C1hold<-matrix(covars1[,i],nspp1,nspp2,byrow=FALSE)
        if(is.factor(covars1[,i]))
        {
          C1hold<-as.matrix(as.vector(C1hold))
          C1covs<-cbind(C1covs,C1hold)
          C1hold<-as.matrix(model.matrix(~as.factor(C1hold)-1)[,-1])
          colnames(C1hold)<-paste(rep(colnames(covars1)[i],length(levels(covars1[,i]))-1),levels(covars1[,i])[-1],sep="-")
          C1<-cbind(C1,C1hold)
        } else { 
          C1hold<-as.matrix(as.vector(C1hold))
          C1covs<-cbind(C1covs,C1hold)
          colnames(C1hold)<-colnames(covars1)[i]
          C1<-cbind(C1,C1hold)
        }
        covnames<-c(covnames,colnames(covars1)[i])
      }
    }
  
  data.vecs<-cbind(data.vecs,C1covs)
  }


 
  C2covs<-NULL
  if(is.null(covars2))
  {
    C2<-NULL
  } else {
    if(is.null(dim(covars2)))
    {
      C2<-matrix(covars2,nspp1,nspp2,byrow=TRUE)
      if(is.factor(covars2))
      {
        C2<-as.matrix(as.vector(C2))
        C2covs<-cbind(C2covs,C2)
        C2<-as.matrix(model.matrix(~as.factor(C2)-1)[,-1])
        colnames(C2)<-paste(rep("covar2",length(levels(covars2))-1),levels(covars2)[-1],sep="-")
      } else {
        C2<-as.matrix(as.vector(C2))
        C2covs<-cbind(C2covs,C2)
      }
      covnames<-c(covnames,"covar2")
    } else {
      C2<-NULL
      for(i in 1:dim(covars2)[2])
      {
        C2hold<-matrix(covars2[,i],nspp1,nspp2,byrow=TRUE)
        if(is.factor(covars2[,i]))
        {
          C2hold<-as.matrix(as.vector(C2hold))
          C2covs<-cbind(C2covs,C2hold)
          C2hold<-as.matrix(model.matrix(~as.factor(C2hold)-1)[,-1])
          colnames(C2hold)<-paste(rep(colnames(covars2)[i],length(levels(covars2[,i]))-1),levels(covars2[,i])[-1],sep="-")
          C2<-cbind(C2,C2hold)
        } else { 
          C2hold<-as.matrix(as.vector(C2hold))
          C2covs<-cbind(C2covs,C2hold)
          colnames(C2hold)<-colnames(covars2)[i]
          C2<-cbind(C2,C2hold)
        }
        covnames<-c(covnames,colnames(covars2)[i])
      }
    }
  
  data.vecs<-cbind(data.vecs,C2covs)
  }
  
  
# Make U  
  U<-NULL
  if(is.null(C1) & is.null(C2))
  {
    U<-rep(1,length(A))
  } else {
    
    if(is.null(C1))
    {
      U<-rep(1,length(A))
    } else {
      U<-cbind(rep(1,length(A)),C1)
    }
    
    if(is.null(C2))
    {
      U<-U
    } else {
      U<-cbind(U,C2)
    }
  }

  # Begin to organize output
  
  if(is.null(dim(U)))
  {
    data.vecs<-data.frame(A)
    colnames(data.vecs)<-"associations"
  } else {    
    colnames(data.vecs)<-c("associations", covnames)
  }
  rownames(data.vecs)<-pairnames
  
  # Calculate Star Regression Coefficients
  
  #calculate for the star (assuming no phylogenetic correlation)
	astar<-solve((t(U)%*%U),(t(U)%*%A))
	MSEStar<-cov(A)
	s2aStar<-as.vector(MSEStar)*qr.solve((t(U)%*%U))
	sdaStar<-t(diag(s2aStar)^(.5))
	approxCFstar<-rbind(t(astar)-1.96%*%sdaStar, t(astar), t(astar)+1.96%*%sdaStar)
  Estar<-A-U%*%astar
  
  if(is.null(tree1) | is.null(tree2))
  {
    coefficents<-approxCFstar
    rownames(coefficents)<-c("upper CI 95%","estimate","lower CI 95%")
    colnames(coefficents)<-paste("star",covnames,sep="-")
    MSEs<-data.frame(MSEStar)
    return(list(MSE=MSEs,signal.strength=NULL,coefficents=data.frame(coefficents),variates=data.frame(data.vecs),residuals=data.frame(Estar)))
  } else {
  
    #tree1 is the phylogeny for the rows
    #tree2 is the phylogeny for the columns
    
    #Clean Trees
    if(is(tree1)[1]=="phylo")
    {
      if(is.null(tree1$edge.length)){tree1<-compute.brlen(tree1, 1)}  #If phylo has no given branch lengths
      V1<-vcv.phylo(tree1,cor=TRUE)
      V1<-V1[rownames(assocs),rownames(assocs)]
    } else {
      V1<-tree1[rownames(assocs),rownames(assocs)]
    }    
    
    if(is(tree2)[1]=="phylo")
    {
    if(is.null(tree2$edge.length)){tree2<-compute.brlen(tree2, 1)}  #If phylo has no given branch lengths
      V2<-vcv.phylo(tree2,cor=TRUE)
      V2<-V2[colnames(assocs),colnames(assocs)]
    } else {
      V2<-tree2[colnames(assocs),colnames(assocs)]
    }
  
    
    #Calculate Regression Coefficents for the base (assuming strict brownian motion evolution, ds=1)
    V1<-as.matrix(V1)
    V2<-as.matrix(V2)
    
    
    V1<-V1/det(V1)^(1/nspp1)   # scale covariance matrices (this reduces numerical problems caused by
  	V2<-V2/det(V2)^(1/nspp2)   # determinants going to infinity or zero)
  	V<-kronecker(V2,V1)  
    invV<-qr.solve(V)
    
    abase<-solve((t(U)%*%invV%*%U),((t(U)%*%invV%*%A)))   #NOTE: Ives in his Matlab code uses a Left matrix division symbol (\)
    MSEbase<-(t(A-U%*%abase)%*%invV%*%(A-U%*%abase))/(nassocs-1)  
    s2abase<-as.vector(MSEbase)*qr.solve(t(U)%*%invV%*%U)
  	sdabase<-t(diag(s2abase)^(.5))
    approxCFbase<-rbind(t(abase)-1.96%*%sdabase, t(abase), t(abase)+1.96%*%sdabase)
    Ebase<-A-U%*%abase
    
    ###################
    # Full EGLS estimates of phylogenetic signal
    ##################
  	initV1<-V1
  	initV2<-V2
  
  	# tau = tau_i + tau_j where tau_i equals the node to tip distance
  	tau1<-matrix(diag(initV1),nspp1,nspp1) + matrix(diag(initV1),nspp1,nspp1)-2*initV1
  	tau2<-matrix(diag(initV2),nspp2,nspp2) + matrix(diag(initV2),nspp2,nspp2)-2*initV2
    pstart<-c(.1,.1)
    
    # The work horse function to estimate ds
    pegls<-function(parameters)
    {
      d1<-abs(parameters[1])
      d2<-abs(parameters[2])
  	
      V1<-(d1^tau1)*(1-d1^(2*initV1))/(1-d1^2)
      V2<-(d2^tau2)*(1-d2^(2*initV2))/(1-d2^2)
  
      V1<-V1/det(V1)^(1/nspp1)   # model of coevolution
      V2<-V2/det(V2)^(1/nspp2)
      V<-kronecker(V2,V1)  
      invV<-qr.solve(V)
    
      a<-solve((t(U)%*%invV%*%U),((t(U)%*%invV%*%A)))   #NOTE: Ives in his Matlab code uses a Left matrix division symbol (\)
      E<-(A-U%*%a)
      #MSE
      t(E)%*%invV%*%E/(nassocs-1)
    }
    # estimate d1 and d2 via Nelder-Mead method same as fminsearch in Matlab, by minimizing MSE
    est<-optim(pstart,pegls,control=list(maxit=maxit))        
    MSEFull<-est$value
  	d1<-abs(est$par[1])
  	d2<-abs(est$par[2])
    # Calculate
  	V1<-(d1^tau1)*(1-d1^(2*initV1))/(1-d1^2)
    V2<-(d2^tau2)*(1-d2^(2*initV2))/(1-d2^2)
    V1<-V1/det(V1)^(1/nspp1)   # model of coevolution
    V2<-V2/det(V2)^(1/nspp2)
    V<-kronecker(V2,V1)  
    invV<-qr.solve(V)
    a<-solve((t(U)%*%invV%*%U),((t(U)%*%invV%*%A)))   #NOTE: Ives in his Matlab code uses a Left matrix division symbol (\)
    s2a<-as.vector(MSE)*qr.solve(t(U)%*%invV%*%U)
  	sda<-t(diag(s2a)^(.5))
  	approxCFfull<-rbind(t(a)-1.96%*%sda, t(a), t(a)+1.96%*%sda)
    Efull<-A-U%*%a
    ########################################
    
    #organize output
    coefficents<-cbind(approxCFfull,approxCFstar,approxCFbase)
    rownames(coefficents)<-c("upper CI 95%","estimate","lower CI 95%")
    colnames(coefficents)<-c(paste("full",c("intercept",colnames(U)[-1]),sep="-"),paste("star",c("intercept",colnames(U)[-1]),sep="-"),paste("base",c("intercept",colnames(U)[-1]),sep="-"))
    MSEs<-cbind(MSEFull, data.frame(MSEStar), data.frame(MSEbase))
    residuals<-cbind(data.frame(Efull),data.frame(Estar),data.frame(Ebase))
    rownames(residuals)<-pairnames
  
    #bootstrap CIs
    
    if(bootstrap)
    {
    return(NULL)
    } else {
    return(list(MSE=MSEs,signal.strength=data.frame(cbind(d1,d2)),coefficents=data.frame(coefficents),variates=data.frame(data.vecs),residuals=residuals))
    }
  }

}