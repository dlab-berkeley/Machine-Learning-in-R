### Challenge 3 solution decision tree

# View structure of Mroz.
str(Mroz)

# Isolate Y response variable ("wc").
Y_dt <- Mroz$wc

# Designate X predictor variables, excluding "wc".
X_dt <- Mroz[, -5] 

# Construct the tree.
dt2 <- rpart(Y_dt ~ ., data = X_dt, method = "class")

# View results.
printcp(dt2)

plotcp(dt2)

summary(dt2)

rpart.plot(dt2)

### control
?rpart.control # view help file

# Set our parameters inside the "control" hyperparameter:
# minsplit = minimum number of observations that must exist in a node for a
# split to be attempted.
# cp = "complexity parameter" - this will prune splits that are not worthwhile; 
# cross-validation will prune off all splits that do not improve the model fit

dt_control <- rpart.control(minsplit = 20, cp = 0.001)

dt3 <- rpart(Y_dt ~ ., data = X_dt, method = "class", control = dt_control)

printcp(dt3)
plotcp(dt3)
summary(dt3)

rpart.plot(dt3)
