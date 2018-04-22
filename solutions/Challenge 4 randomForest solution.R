### Big question 4 answer: recall that single decision trees have a tendency to overfit because they are using a single tree and all the features to reprsent the data. Bagged (bootstrap aggregated) trees do something similar, but bootstrap the single tree a specified number of times and then takes an average of the performance across those trees. These methods ensure that the "most important" splits always occur at the top of the tree, which can mask other important splits. Random forest on the other hand, resamples a specified number of trees but only uses a subset of the predictors at each split, thus giving all variables a chance to be split at the top of a tree - average performance is then computed across the trees. 

### Challenge 4 randomForest solution

# 1 Change mtry, # 2 change maxnodes, and fit the model
set.seed(1)
rf2 = randomForest(as.factor(train_label) ~ ., 
                    data = train_X,
                    ntree = 1000,
                    mtry = 3,
                    maxnodes = 50,
                    importance = T)

# View results.
rf2

# Confirm accuracy is 1 - OOB error rate.
(304 + 114) / nrow(train_X) # 0.7769517

1 - ((304 + 114) / nrow(train_X)) # 0.2230483 - OOB error rate checks out! 

# Variable importance plots; there are different ways to visualize!
varImpPlot(rf2)
barchart(rf2$importance, main="rf barchart", col="gray80", border="black") 
dotplot(rf2$importance, main="rf2 dotplot", col=c(1,6))

# Evaluate performance on the test dataset
rf2_predicted = predict(rf2, newdata = test_X)
table(rf2_predicted, test_label)

# Calculate test set accuracy
mean(rf2_predicted == test_label) # 0.7347826


### Challenge 4 iris decision tree solution
set.seed(1)
rf_iris = randomForest(as.factor(iris$Species) ~ .,
                       data = iris[,-5],
                       ntree = 1000,
                       mtry = 3,
                       maxnodes = 20,
                       importance = T)
# View results
rf_iris

# Compute accuracy
(50 + 47 + 46) / nrow(iris) # 0.9533333 classification accuracy!

# Double check OOB error
1 - ((50 + 47 + 46) / nrow(iris)) # OOB = 0.04666667

# plot variable importance
varImpPlot(rf_iris) 

# create a quick "test" set comprised of 30 pseudo-randomly selected rows
set.seed(1)
iris_test = iris[sample(which(iris$Species == c("setosa", "versicolor", "virginica")), 50), ]
iris_test

# Compute performance on new "test" data
rf_iris_predicted = predict(rf_iris, newdata = iris_test)
table(rf_iris_predicted, iris_test$Species)

# Calculate test set accuracy 
mean(rf_iris_predicted == iris_test$Species) # 1  -  perfect prediction! This is quite unlikely to happen in real life and only happened here due to how we designed this example. 
