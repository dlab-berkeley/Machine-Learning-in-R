### Challenge 2 iris regression solution

data(iris) # call the data

Y_iris <- iris$Sepal.Length # define Y response variable

X_iris <- data.frame(model.matrix( ~ ., subset(iris, select = -Sepal.Length))) # define X predictor variables

# NOTE: here, we do not include "-1" after "~ ." because we want R to print the intercept so that you can see what is going on under the hood. 
str(X_iris)

X_iris <- X_iris[,-1] # remove intercept
str(X_iris)

iris_fit <- lm(Y_iris ~ ., data=X_iris) # fit the model

summary(iris_fit) # view the output

iris_pred <- predict(iris_fit, X_iris) # calculate predictions

MSE_iris <- mean((Y_iris - iris_pred)^2) # calculate MSE 

MSE_iris
