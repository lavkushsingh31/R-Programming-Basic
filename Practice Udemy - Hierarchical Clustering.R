############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


library('ggplot2')
library('cluster')

# getting the working directory
getwd()

# setting  the working directory, and checking it if it has been set properly
setwd("E:\\Github\\R-Programming-Basic")

getwd()

# Reading the data
data = read.csv(file.choose()) 

# exploring the data
head(data)
summary(data)
str(data)

# selecting only required features
X <- data[4:5]
X

# Using dendrograms to get optimal number of clusters

dendrograms <- hclust(dist(X, method = "euclidean"),
                      method = 'ward.D')
plot(dendrograms,
     main = paste("Dendrograms"),
     xlab = "Customers",
     ylab = "Distances")

# Fitting Hierarchical Cluster to the dataset

hc <- hclust(dist(X, method = "euclidean"),
             method = 'ward.D')
y_hclust <- cutree(hc,5)
y_hclust


# Visualizing the clusters
clusplot(X, y_hclust,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 0,
         plotchar = TRUE,
         span = TRUE,
         main = paste("Cluster of Clients"),
         xlab = "Annual Income",
         ylab = "Spending Score")

