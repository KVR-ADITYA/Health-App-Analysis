library(GA)

ft <- function(x, y, z){
  g <- somgrid(xdim = as.integer(x), ydim = as.integer(y), topo = "hexagonal")
  map <- som(as.matrix(app),
             grid = g,
             alpha = c(z, 0.01),
             radius = 3)
  return(sum(map$distances)) 
}

GA <-ga(type = "real-valued",
        fitness = function(x) -ft(x[1],x[2],x[3]),
        lower = c(1,1,0), upper = c(10,10,1),
        popSize = 50, maxiter = 5, run = 100) 
summary(GA)
plot(GA)
