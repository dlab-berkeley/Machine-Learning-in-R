### Big question 4 answer:

# lm: assumes a linear relationship exists between Y and X variables

# lasso: sets some predictor coefficients to zero if they are not related to the outcome

# rpart: partitions feature space into smaller subspaces, tries to minimize RSS or classification error (% of training observations that do not belong to the majority class), generally have high variance, a single tree is likely to overfit, larger trees can be pruned back to smaller trees with lower test error

# bagging: bootstrap aggregating trees helps improve prediction by constructing a specific number of bootstrapped trees and then averaging the performance, OOB error is often used as an estimate for test set performance

# randomForest: decorrelates bagged trees by using a smaller number of features at each split thus giving seemingly less important features the change to be the primary split in a tree

# boosting: takes these ideas even further by constructing many weak and generally shallow trees to predict each value in a dataset, incorporates that tree's learned performance into the function and its residuals to update the function across many boosting iterations, easily predicted values become less important for the model to try and predict compared to more difficult predicted values

