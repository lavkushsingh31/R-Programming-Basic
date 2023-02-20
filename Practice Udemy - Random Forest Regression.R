############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


library('ggplot2')
library('randomForest')

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

# building Random Forest Regression Model

set.seed(1234)
trees = 100
rf_regressor <- randomForest(x = data[1],
                             y = data$Salary,
                             ntree = trees)
summary(rf_regressor)


# Visualization of the Random Forest Regression Model in higher resolution

x_grid = seq(min(data$Level), max(data$Level), 0.01)
ggplot() +
  geom_point(aes(x = data$Level, y= data$Salary),
             color = 'red') +
  geom_line(aes(x = x_grid, y = predict(rf_regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle('Actual Salary vs Falsely Claimed Salary (Random Forest Regression)') +
  xlab('Position (Levels)') +
  ylab('Salary')


# getting predictions
user_input = 6.5
user_input <- data.frame(Level = user_input)
predictions <- predict(rf_regressor, user_input)
predictions

