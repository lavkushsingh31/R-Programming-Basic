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

# finding optimal number of clusters using K-Means

set.seed(10)

wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(X,i)$withinss)
plot(1:10, wcss, 
      type = 'b',
      main = paste('Optimal Clusters using Elbow Method'),
      xlab = "Number of CLusters",
      ylab = "WCSS")

# Applying K-Means to the dataset

set.seed(123)
kmeans_model <- kmeans(X, 5, iter.max = 300, nstart = 10)

# Visualizing the clusters
clusplot(X, kmeans_model$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = TRUE,
         span = TRUE,
         main = paste("Cluster of Clients"),
         xlab = "Annual Income",
         ylab = "Spending Score")
