library(kohonen)
library(clv)
library(agrmt)

app <- read.csv("./normalised_data.csv", header = T)[,-1]
head(app)

#SOM
set.seed(222)
g <- somgrid(xdim = 8, ydim = 8, topo = "hexagonal")
map <- som(as.matrix(app),
           grid = g,
           alpha = c(0.05, 0.01),
           radius = 3)

sum(map$distances)
plot(map)
plot(map, type = "changes")
plot(map, type = "count")
plot(map, type = "mapping")

groups <- 6

map.hc <- cutree(hclust(dist(map$codes[[1]])), groups)

#hclust(dist(map$codes[[1]]))

plot(map, type="codes", bgcol=rainbow(groups)[map.hc])

add.cluster.boundaries(map, map.hc)

intraclust = c("centroid")
interclust = c("centroid")

cls.scatt <- cls.scatt.data(app, as.integer(map$unit.classif), dist="manhattan")
dunn1 <- clv.Dunn(cls.scatt, intraclust, interclust)
davies1 <- clv.Davies.Bouldin(cls.scatt, intraclust, interclust)


index <- c()
index1 <- c()
index2 <- c()

for (i in c(2,3,4,5,6,7,8,9,10,11,12,13,14,15)){
  groups <- i
  map.hc <- cutree(hclust(dist(map$codes[[1]])), groups)
  cls.scatt <- cls.scatt.data(map$codes[[1]], map.hc, dist="manhattan")
  dunn1 <- clv.Dunn(cls.scatt, intraclust, interclust)
  davies1 <- clv.Davies.Bouldin(cls.scatt, intraclust, interclust)
  index <- c(index, (sum(dunn1)+sum(davies1))/2)
  index1 <- c(index1, sum(dunn1))
  index2 <- c(index2, sum(davies1))
  
}

criteriaMinMax <- c("max", "min", "min", "min", "min", "max","min")
criteriaMinMax <- c("+", "-", "-", "-", "-", "+","-")


weights <- c(0.022932063619572944,
              0.1248342535864348,
              0.01824235830048488,
              0.2233503576596725,
              0.5981904930071215,
              0.004274227300927866,
              0.008176246525785741)

performanceTable = read.csv('./6Clusters.csv', header = T)[,-1][,-8]
performanceTable <- as.matrix(performanceTable)

library(topsis)
overall1 <- topsis(performanceTable, weights, criteriaMinMax)
overall1



