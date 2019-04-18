### Big question 3 answer: recall that single decision trees have a tendency to overfit because they are using a single tree and all the features to reprsent the data. Bagged (bootstrap aggregated) trees do something similar, but bootstrap the single tree a specified number of times and then takes an average of the performance across those trees. These methods ensure that the "most important" splits always occur at the top of the tree, which can mask other important splits. Random forest on the other hand, resamples a specified number of trees but only uses a subset of the predictors at each split, thus giving all variables a chance to be split at the top of a tree - average performance is then computed across the trees. 

### Challenge 3 randomForest solution

# 1 Change mtry, # 2 change maxnodes, and fit the model
set.seed(1)
rf2 = ranger::ranger(train_y ~ ., 
                    data = train_x,
                    num.trees = 1000,
                    mtry = 3,
                    probability = T,
                    importance = "permutation")

# View results.
rf2

# Variable importance plots; there are different ways to visualize!
vip::vip(rf2)
vip::vi(rf2)

# Evaluate performance on the test dataset
rf2_predicted = as.integer(predict(rf2, data = test_x)$predictions[, "1"] > 0.5)

# Calculate test set accuracy
mean(rf2_predicted == test_y) # 0.7666667


### Challenge 4 iris decision tree solution
set.seed(1)
rf_iris = ranger::ranger(iris$Species ~ .,
                       data = iris[,-5],
                       num.trees = 1000,
                       mtry = 3,
                       probability = T,
                       importance = "permutation")
# View results
rf_iris

# plot variable importance
vip::vip(rf_iris)
vip::vi(rf_iris)

# create a quick "test" set comprised of 50 randomly selected rows
set.seed(1)
iris_test = iris[sample(which(iris$Species == c("setosa", "versicolor", "virginica")), 50), ]
iris_test

# Compute performance on new "test" data
rf_iris_predicted = predict(rf_iris, data = iris_test)
str(rf_iris_predicted)

table(rf_iris_predicted$predict, iris_test$Species)

# Calculate test set accuracy 
mean(rf_iris_predicted$predictions == iris_test$Species) # 
