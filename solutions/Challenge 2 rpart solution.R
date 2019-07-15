### Big question 2 answer: The decision tree with 2 splits is exactly the same as the top part of the tree with 4 splits! 


### Challenge 2 iris decision tree solution
data(iris)

# Isolate Y response variable ("Species").
Y_dt = iris$Species

# Designate X predictor variables, excluding "Species".
X_dt = iris[,-5]

# Construct the tree.
dec_tree2 = rpart(Y_dt ~ ., data = X_dt, 
                  method = "class")

# View results.
printcp(dec_tree2)

plotcp(dec_tree2)

summary(dec_tree2)

rpart.plot(dec_tree2)

### control
?rpart.control # view help file

# Set our parameters inside the "control" hyperparameter:
# minsplit = minimum number of observations that must exist in a node for a split to be attempted.
# cp = "complexity parameter" - this will prune splits that are not worthwhile; 
# cross-validation will prune off all splits that do not improve the model fit

dt_control = rpart.control(minsplit = 10, minbucket = 5, cp = 0.01)

# construct the tree with the control object
dt_controlled = rpart(Y_dt ~ ., data = X_dt, 
                      method = "class", 
                      control = dt_control)

printcp(dt_controlled)
rpart.plot(dt_controlled)
