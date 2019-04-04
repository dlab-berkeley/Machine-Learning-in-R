# Big question 1 answer: 

# OLS regression assumptions: 

# Lasso assumptions: 

# Challenge 1 lasso iris solution: 

data(iris)

# Set seed for reproducibility.
set.seed(1)

# Define iris Y variable
iris_Y = iris$Petal.Width

# Remove Petal.Width from the dataset
iris_X = subset(iris, select = - Petal.Width)
head(iris_X)

# Convert Species from factor to indicator
features_iris = data.frame(model.matrix( ~ . -1 , iris_X))
head(features_iris)

# Create a stratified random split.
training_rows_iris = caret::createDataPartition(iris_Y, p = 0.70, list = FALSE) 

train_x_iris = features_iris[training_rows_iris, ] # partition training dataset
test_x_iris = features_iris[-training_rows_iris, ] # partition test dataset

train_val_iris = iris_Y[training_rows_iris] # partition training Y vector labels
test_val_iris = iris_Y[-training_rows_iris] # partition test Y vector labels

# Check lengths of X and Y data
dim(train_x_iris)
length(train_val_iris)

dim(test_x_iris)
length(test_val_iris)

# Fit lasso model and visualize lambda distribution and different lambda values
lasso_iris = cv.glmnet(as.matrix(train_x_iris), train_val_iris, family = "gaussian", alpha = 1)
plot(lasso_iris)
plot(lasso_iris$glmnet.fit, xvar = "lambda", label = T)

# View minimum MSE and higher lambda within one standard error
lasso_iris$lambda.min
lasso_iris$lambda.1se

# View coefficients
coef(lasso_iris, s = "lambda.1se")
coef(lasso_iris, s = "lambda.min")

# Predict on test set
predictions_iris = predict(lasso_iris, s = lasso_iris$lambda.1se, newx = as.matrix(test_x_iris))

# Calculate mean-squared error.
mean((predictions_iris - test_val_iris)^2)

# Calculate root mean-squared error.
sqrt(mean((predictions_iris - test_val_iris)^2))
