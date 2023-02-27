############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################

library('arules')
# getting the working directory
getwd()

# setting  the working directory, and checking it if it has been set properly
setwd("E:\\Github\\R-Programming-Basic")

getwd()

# Reading the data
data = read.csv(file.choose(), header = FALSE) 

# exploring the data
head(data)
summary(data)
str(data)


# creating sparse matrix

data <- read.transactions(file.choose(), sep = ',', rm.duplicates = TRUE)
summary(data)

# viewing top 15 frequent products
itemFrequencyPlot(data, topN = 15)

# Training Eclat on the dataset

rules = eclat(data = data,
                parameter = list(support = 0.004, minlen = 2))

# Visualizing the data
inspect(sort(rules, by = 'support')[1:10])
