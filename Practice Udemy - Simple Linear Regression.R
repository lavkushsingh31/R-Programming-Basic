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
data = read.csv(r"(E:\Github\Datasets\Salary_Data.csv)")  # or file.choose() instead of path

# exploring the data
head(data)
summary(data)
str(data)


# Splitting the dataset into training and test set

set.seed(123)
split <- sample.split(data$Salary, SplitRatio = 2/3 )  # here SplitRatio is for training set
print(split)  # TRUE -> Training set, FALSE -> Test Set

training_set <- subset(data, split == TRUE) 
test_set <- subset(data, split == FALSE)

print(training_set)
print(test_set)


# Simple Linear Regression Model

regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)

summary(regressor)


# Predicting the test results

y_pred <- predict(regressor, newdata = test_set)


# Visualizing

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y= training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, data = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')


ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y= test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, data = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Training Set)') +
  xlab('Years of Experience') +
  ylab('Salary')


