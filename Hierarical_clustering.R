setwd("C:/Users/GIM/Desktop/mlb_cluster")

USArrests<-read.csv("USArrest.csv",row.names =1)


summary(USArrests)
View(USArrests)

library(cluster)

library(factoextra)


#distance matrix
dmatrix<- daisy(USArrests,metric = c("euclidean"),stand=TRUE)
class(dmatrix)
#to view distance matrix
distance <-dist(dmatrix)
d<-as.matrix(distance)
view(d)
#write.csv(d)     {to export thr excel file}
fviz_dist(distance,lab_size = 8)
#step 2    hc=hierarical clustering
hc <-hclust(dmatrix,"average")
plot(as.dendrogram(hc))

rect.hclust(hc,5)






