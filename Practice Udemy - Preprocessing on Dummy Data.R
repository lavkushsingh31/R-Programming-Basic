############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################

library('caTools')


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

# replacing missing values with mean

data$Age <- replace(data$Age, is.na(data$Age), mean(data$Age, na.rm = TRUE))
data$Salary <- replace(data$Salary, is.na(data$Salary), mean(data$Salary, na.rm = TRUE))

print(data)

# Encoding categorical values
data$Country <- factor(data$Country,
                       levels = c('France', 'Spain', 'Germany'),
                       labels = c(1,2,3))
print(data)

data$Purchased <- factor(data$Purchased,
                       levels = c('No', 'Yes'),
                       labels = c(0,1))
print(data)


# Splitting the dataset into training and test set

set.seed(123)
split <- sample.split(data$Purchased, SplitRatio = 0.8 )  # here SplitRatio is for training set
print(split)  # TRUE -> Training set, FALSE -> Test Set

training_set <- subset(data, split == TRUE) 
test_set <- subset(data, split == FALSE)

print(training_set)
print(test_set)


# Feature Scaling

training_set[,2:3] <- scale(training_set[,2:3])
test_set[,2:3] <- scale(test_set[,2:3])

print(training_set)
print(test_set)
