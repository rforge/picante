specaccum.PSR<-function (samp, Cmatrix, permutations = 100, method = "random", ...)
{

#function adapted from the vegan package specaccum

  x <- as.matrix(samp)
  n <- nrow(x)
  p <- ncol(x)
  if (p == 1)
  {
    x <- t(x)
    n <- nrow(x)
    p <- ncol(x)
  }
  accumulator <- function(x,ind,Cmatrix)
  {
    n <- nrow(x)
    p <- ncol(x)
    xx<-x
    xx[1:n,1:p]<-0
    xx[apply(x[ind, ], 2, cumsum)>0]<-1
    PSV<-PSVcalc(xx,Cmatrix,compute.var=FALSE)
    PSV[,1]*PSV[,2]
  }
  METHODS <- c("collector", "random", "exact", "rarefaction",
        "coleman")
    method <- match.arg(method, METHODS)

  specaccum <- sdaccum <- sites <- perm <- NULL
  perm <- array(dim = c(n, permutations))
  for (i in 1:permutations)
  {
    perm[, i] <- accumulator(x, sample(n),Cmatrix)
  }
  sites <- 1:n
  specaccum <- apply(perm, 1, mean)
  sdaccum <- apply(perm, 1, sd)
  out <- list(call = match.call(), method = method, sites = sites, richness = specaccum, sd = sdaccum, perm = perm)
  class(out) <- "specaccum"
  out
}