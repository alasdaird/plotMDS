#--------------------------------------------------------------------------
# Plot dissimilarity matrix in 2D using metric scaling - Script using iris
# Alasdair Douglas
# 13/1/15
#--------------------------------------------------------------------------


# using iris data set, separate the numerical columns and scale them.
x       <- iris[,names(iris) %in% c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
x.scale <- scale(x, center = TRUE, scale = TRUE)
IDs     <- row.names(iris)
x.Labels<- iris$Species

#generate dissimilarity matrix
x.diss <- daisy(x.scale, stand="FALSE")

#plot
plotMDS(IDs, x.diss, x.Labels)