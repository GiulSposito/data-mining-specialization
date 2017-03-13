library(needs)
needs(igraph)
needs(RCurl)

# download dataset if necessary
if(!file.exists("./data-visualization/Programming-Assignment-2/data")){
  dir.create("./data-visualization/Programming-Assignment-2/data")
  file <- getURL("http://networkdata.ics.uci.edu/data/football/football.gml")
  write(file,"./data-visualization/Programming-Assignment-2/data/football.gml")
  rm(file);gc()
}

# load dataset
graph <- read_graph("./data-visualization/Programming-Assignment-2/data/football.gml", format = "gml")

# plot
plot(graph)

# circle layout
l <- layout_in_circle(graph)
plot(graph,layout=l, vertex.label=NA, vertex.size=5, edge.curved=.3)

ceb <- cluster_edge_betweenness(graph)
dendPlot(ceb,mode="hclust")


l2 <- layout_in_circle( graph, order = order(membership(ceb)) )

plot(graph,layout=l2, vertex.label=V(graph)$value, vertex.size=5, edge.curved=.3, vertex.color=membership(ceb))


l3 <- layout_in_circle( graph, order = order(V(graph)$value))
plot(graph,layout=l3, vertex.label=V(graph)$value, vertex.size=5, edge.curved=.3, vertex.color=V(graph)$value)


plot(ceb,graph,layout=l2,vertex.label=V(graph)$value, vertex.size=5, edge.curved=.3, vertex.color=V(graph)$value)


V(graph)$value


?cluster_edge_betweenness


?dendPlot

l2 <- layout_in_circle(graph,ceb$membership)

x <- cluster_optimal( graph )

l4 <- layout_in_circle( graph, order = order(membership(x)))
plot(graph,layout=l4, vertex.label=V(graph)$value, vertex.size=5, edge.curved=.3, vertex.color=membership(x))


str(ceb)
plot(ceb)
?layout_in_circle

V(graph)

plot(graph,layout=l2)




fgroups <- cluster_optimal(graph)


