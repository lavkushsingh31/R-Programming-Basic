############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################

library('caTools')
library('ggplot2')

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

# Encoding categorical variable
data$State <- factor(data$State,
                       levels = c("New York", "California", "Florida"),
                       labels = c(1,2,3))
print(data)


# Splitting the dataset into training and test set

set.seed(123)
split <- sample.split(data$Profit, SplitRatio = 0.8 )  # here SplitRatio is for training set
print(split)  # TRUE -> Training set, FALSE -> Test Set

training_set <- subset(data, split == TRUE) 
test_set <- subset(data, split == FALSE)

print(training_set)
print(test_set)


# Simple Linear Regression Model

regressor <- lm(formula = Profit ~ ., data = training_set)

summary(regressor)


# Predicting the test results

y_pred <- predict(regressor, newdata = test_set)


# Building the optimal model using backwards elimination

cols <- names(data)
my_formula <- paste(cols[length(cols)], " ~ ", paste0(cols[1:length(cols)-1], collapse = " + "))
my_formula


regressor <- lm(formula = "Profit  ~  R.D.Spend + Administration + Marketing.Spend + State", 
                data = data)

summary(regressor)

# Removing State

regressor <- lm(formula = "Profit  ~  R.D.Spend + Administration + Marketing.Spend", 
                data = data)
summary(regressor)


# Removing Administration
regressor <- lm(formula = "Profit  ~  R.D.Spend + Marketing.Spend", 
                data = data)
summary(regressor)

# Best model with SL = 0.10
regressor <- lm(formula = "Profit  ~  R.D.Spend + Marketing.Spend", 
                data = data)
summary(regressor)
