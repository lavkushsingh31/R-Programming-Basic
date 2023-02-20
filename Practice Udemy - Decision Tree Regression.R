############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


library('ggplot2')
library('rpart')

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

# building Decision Tree Regression Model

dtree_regressor <- rpart(formula = Salary ~ ., 
                         data = data)
summary(dtree_regressor)

# getting predictions
user_input = 6.5
user_input <- data.frame(Level = user_input)
predictions <- predict(dtree_regressor, user_input)
predictions


# Visualization of the Decision Tree Regression Model

ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = data$Level, y = predict(dtree_regressor, data)),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Decision Tree Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')


# building Decision Tree Regression Model using controls

dtree_regressor <- rpart(formula = Salary ~ ., 
                         data = data,
                         control = rpart.control(minsplit = 1L))
summary(dtree_regressor)


# Visualization of the Decision Tree Regression Model after controls

ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = data$Level, y = predict(dtree_regressor, data)),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Decision Tree Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')

# Visualization of the Decision Tree Regression Model in higher resolution

x_grid = seq(min(data$Level), max(data$Level), 0.01)
ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y = predict(dtree_regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Decision Tree Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')


# getting predictions
user_input = 6.5
user_input <- data.frame(Level = user_input)
predictions <- predict(dtree_regressor, user_input)
predictions



