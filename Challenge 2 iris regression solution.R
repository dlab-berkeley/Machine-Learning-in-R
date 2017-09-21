### Challenge 2: Mroz "age" regression example
# View structure of Mroz
names(Mroz)

# Define our continuous Y response variable, "age". Call it "Y3"
Y3 <- Mroz$age

# Expand our predictor X variables out into indicators
data3 <- data.frame(model.matrix( ~ ., subset(Mroz, select = -age)))
names(data3)

# Remove intercept
data3 <- data2[, -1]

# View structure of "data2"
str(data3)

# Fit the regression model.
data3_lm <- lm(Y3 ~ ., data = data3)

# View the regression results
summary(data3_lm) 

# Predict the outcome back onto the training data
data3_predicted <- predict(data3_lm, data2) 

# Calculate mean-squared error
MSE2 <- mean((Y3 - data3_predicted)^2)   

MSE2

### Challenge 2: iris regression solution
# Load the data
data(iris)

# Define Y response variable
Y_iris <- iris$Sepal.Length 

# Remove outcome variable from the X dataframe
X_iris = subset(iris, select = -Sepal.Length)

# This will convert factors to indicators but will also add an extra constant
# column for estimating the intercept
X_iris <- data.frame(model.matrix( ~ ., X_iris))

str(X_iris)

# Remove the extra intercept column, we don't need to store it in our dataset
X_iris <- X_iris[, -1]

str(X_iris)

# Fit the regression model; lm() will automatically add a temporary intercept column
iris_fit <- lm(Y_iris ~ ., data = X_iris)

# View the output
summary(iris_fit) 

# Predict outcome for the training data
iris_predicted <- predict(iris_fit, X_iris)

# Calculate mean-squared error
MSE_iris <- mean((Y_iris - iris_predicted)^2)

MSE_iris
 