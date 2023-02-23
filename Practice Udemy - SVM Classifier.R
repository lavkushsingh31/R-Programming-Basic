############################# Credits #############################
#
# Course URL - https://www.udemy.com/course/machinelearning/
#
###################################################################


library('ggplot2')
library('caTools')
library('ElemStatLearn')
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

# Splittig the dataset into training and testing set
set.seed(123)
split = sample.split(data$Purchased, SplitRatio = 0.75)
training_set = subset(data, split == TRUE)
test_set = subset(data, split == FALSE)

# Feature Scaling
training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])


# fitting the SVM classifier and predicting the test set results

svm_classifier <- svm(formula = Purchased ~ .,
                      data = training_set,
                      kernel = 'linear',
                      type = 'C-classification')


y_pred <- predict(svm_classifier, newdata = test_set[-3])
y_pred


# making the confusion matrix
cm = table(test_set[,3], y_pred)
cm


# Decision Boundary - Visualizing the Training set results
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(svm_classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green', 'red'))


# Decision Boundary - Visualizing the Test set results
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(svm_classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green', 'red'))
