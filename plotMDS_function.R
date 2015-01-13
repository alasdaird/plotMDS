#--------------------------------------------------------------------------
# Plot dissimilarity matrix in 2D using metric scaling
# Alasdair Douglas
# 13/1/15
#--------------------------------------------------------------------------


# Plot Clustering ---------------------------------------------------------

# Multi-dimensional scaling 
# uses Prinicipal Coordinate Analysis (NOT Principal Component Analysis)
#http://www.statmethods.net/advstats/mds.html
#http://gastonsanchez.com/blog/how-to/2013/01/23/MDS-in-R.html

plotMDS <- function(IDs, x.diss, clusLabs){
  require(stats)
  require(ggplot2)
  
  # Classical (Metric) Multidimensional Scaling
  # Also known as principal coordinates analysis (Gower, 1966)
  # 2D transposition of dissimilarity object
  mdsObj <- cmdscale(d = x.diss, k = 2, eig = TRUE) #slow
  mdsMat <- mdsObj$points
  mdsEig <- mdsObj$eig
  
  mdsDF  <- data.frame(uniqueID=IDs, cluster = factor(clusLabs), 
                       var1=mdsMat[,1], var2=mdsMat[,2])
  
  plot   <- ggplot(data = mdsDF, aes(x=var1, y=var2, colour=cluster)) + 
    geom_point(position="jitter") +
    ggtitle("MDS 2D plot of dissimilarity matrix")
  print(plot)
}

# Alternative is PCA or ..