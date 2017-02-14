### Challenge 2 iris regression solution

data(iris) # call the data

Y_iris <- iris$Sepal.Length

X_iris <- data.frame(model.matrix( ~ ., subset(iris, select = -Sepal.Length)))
str(X_iris)

X_iris <- X_iris[,-1]
str(X_iris)

iris_fit <- lm(Y_iris ~ ., data=X_iris) # fit the model

summary(iris_fit) # view the output

iris_pred <- predict(iris_fit, X_iris) # calculate predictions

MSE_iris <- mean((Y_iris - iris_pred)^2) # calculate MSE 

MSE_iris
