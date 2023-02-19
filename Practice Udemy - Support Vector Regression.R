############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


library('ggplot2')
library('e1071')

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

data <- data[2:3]
data

# building Support Vector Regression Model
svm_regressor <- svm(formula = Salary ~ ., 
                     data = data,
                     type = 'eps-regression')

summary(svm_regressor)


# getting predictions
user_input = 6.5
user_input <- data.frame(Level = user_input)
predictions <- predict(svm_regressor, user_input)
predictions


# Visualization of the SVR Model

ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = data$Level, y = predict(svm_regressor, data)),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Linear Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')
