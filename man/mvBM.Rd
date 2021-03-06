% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mvBM.R
\name{mvBM}
\alias{mvBM}
\title{Multiple variance Brownian motion estimation}
\usage{
mvBM(data, tree, sigma2)
}
\arguments{
\item{data}{a vector of tip values for species; should be in the same order as tiplabels in the tree}

\item{tree}{an object of class "phylo".}

\item{sigma}{sig2 value from a Bayesian MCMC run using standard Brownian motion (e.g. ?anc.Bayes)}
}
\value{
dataframe with rescaled branch lengths (rBL) for all branches in the tree
}
\description{
Computes rescaled branch lengths using multiple variance Brownian motion as described in Smaers et al. (2016)
}
\examples{
tree<-pbtree(n=50) # simulate tree ('pbtree' requires the 'phytools' package)
x<-fastBM(tree,sig2=2) # simulate values ('pbtree' requires the 'phytools' package)
BMsigma2<-ace(x,tree,method="REML")$sigma2[1] # get BM sigma2 ('ace' requires the 'ape' package)
mvBMresults<-mvBM(x,tree,BMsigma2) # calculate rescaled branch lengths using mvBM
tree_mvBM<-tree
tree_mvBM$edge.length<-mvBMresults$rBL # create new tree with rescaled branch lengths
plot(tree_mvBM) # plot mvBM tree
ace(x,tree_mvBM,method="REML") # get ancestral estimates using mvBM tree 
# To obtain the mvBM branch specific rate estimate: calculate sig2 for the trait in question using the mvBM tree; multiply the mvBM sig2 with the mvBM rescaled branch length of the lineage of interest; divide this value by the phylogenetic branch length of the lineage of interest. 
# MCMC posterior distributions can be obtained by using anc.Bayes for the above calculations. ('anc.Bayes' requires the 'phytools' package)
for other examples see https://smaerslab.com/software/
}
\references{
Smaers, Mongle & Kandler (2016) A multiple variance Brownian motion framework for estimating variable rates and inferring ancestral states. Biological Journal of the Linnean Society. 118 (1): 78-94.
}
