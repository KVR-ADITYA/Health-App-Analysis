library(kohonen)
library(dplyr)
data <- read.csv("./MinimisedData.csv", header = T)
str(data)
summary(data)
data <- na.omit(data)
str(data)
data <- select(data, -c(1))
str(data)
data$Category <- as.numeric(data$Category)
str(data)
data$Installs <- as.numeric(data$Installs)
str(data)
data$Price <- as.numeric(data$Price)
data$Content.Rating <- as.numeric(data$Content.Rating)
str(data)
data$Size <- as.numeric(data$Size)
str(data)
data <- select(data, -c(2,8,9,10))
str(data)

write.csv(data,"./final.csv", row.names = FALSE)

data2 <- read.csv("./MinimisedData.csv", header = T)
data2 <- na.omit(data2)

str(data)
data <- scale(data)
head(data)
summary(data)

#SOM
set.seed(222)
g <- somgrid(xdim = 5, ydim = 5, topo = "hexagonal")
map <- som(data,
           grid = g,
           alpha = c(0.05, 0.01),
           radius = 3)
plot(map)
plot(map, type = "changes")
plot(map, type = "count")
plot(map, type = "mapping")

#coolBlueHotRed <- function(n, alpha = 1) {rainbow(n, end=4/6, alpha=alpha)[n:1]}

groups <- 5

map.hc <- cutree(hclust(dist(map$codes[[1]])), groups)

plot(map, type="codes", bgcol=rainbow(groups)[map.hc])

add.cluster.boundaries(map, map.hc)

map.hc
map$unit.classif
