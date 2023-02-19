############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


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

data <- data[2:3]
data

# Building Linear Regression Model
linear_regressor <- lm(formula = Salary ~ Level, data = data)
summary(linear_regressor)


# Building Polynomial Regression Model

data$Level2 = data$Level ** 2
data$Level3 = data$Level ** 3
data

polynomial_regressor <- lm(formula = Salary ~ ., 
                           data = data)
summary(polynomial_regressor)


# Visualizing the regression models

ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
geom_line(aes(x = data$Level, y = predict(linear_regressor, newdata = data)),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Linear Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')


ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = data$Level, y = predict(polynomial_regressor, data)),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Polynomial Linear Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')


# Making Predictions - Linear Regression

prediction = predict(linear_regressor, data.frame(Level = 6.5))
prediction

# Making Predictions - Polynomial Regression

user_input = 6.5

user_input <- data.frame(Level = user_input, 
                         Level2 = user_input**2,
                         Level3 = user_input**3)
user_input

prediction_polynomial = predict(linear_regressor, user_input)
prediction_polynomial


