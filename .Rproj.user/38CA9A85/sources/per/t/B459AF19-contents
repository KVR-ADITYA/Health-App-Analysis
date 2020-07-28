library(kohonen)

iris.sc = scale(iris[,1:4])

head(iris.sc)
str(iris.sc)

iris.grid = somgrid(xdim = 5, ydim = 5, topo = "hexagonal")

iris.som = som(iris.sc, grid = iris.grid, rlen = 100, alpha = c(0.05, 0.01))

groups = 3
iris.hc = cutree(hclust(dist(iris.som$codes[[1]])), groups)

# plot
plot(iris.som, type="codes", bgcol=rainbow(groups)[iris.hc])

#cluster boundaries
add.cluster.boundaries(iris.som, iris.hc)
