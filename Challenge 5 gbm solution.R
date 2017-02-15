# split the data:
Y_gbm <- Mroz$wc

# More model.matrix practice
Mroz_gbm <- data.frame(model.matrix( ~ ., subset(Mroz, select = -wc)))

# Remove constant that model.matrix added.
Mroz_gbm = Mroz_gbm[, -1]

str(Mroz_gbm)

# split the data like before
set.seed(1)
split_gbm <- createDataPartition(Y_gbm, p=0.70, list=FALSE)
train_gbm <- Mroz_gbm[split_gbm, ]
test_gbm <- Mroz_gbm[-split_gbm, ]

train_gbm_label <- Y_gbm[split_gbm]
test_gbm_label <- Y_gbm[-split_gbm]

### define the control:
# Choose 10-fold repeated measure cross-validation as our performance metric
# (instead of the default "bootstrap").
control <- trainControl(method="repeatedcv", 
                        repeats = 2,
                        # Calculate class probabilities.
                        classProbs = TRUE,
                        # Indicate that our response varaible is binary.
                        summaryFunction = twoClassSummary) 

### define the grid: 
grid <- expand.grid(
  # Number of trees to fit, aka boosting iterations.
  n.trees = seq(500, 1500, by = 500),
  # Depth of the decision tree.
  interaction.depth = c(1, 2, 3), 
  # Learning rate: lower means the ensemble will adapt more slowly.
  shrinkage = c(0.01, 0.05, 0.1),
  # Stop splitting a tree if we only have this many obs in a tree node.
  n.minobsinnode = 10)

# we can also store our data inside a dataframe instead of cbinding it in-line:
data_gbm <- data.frame(train_gbm_label, train_gbm)
str(data_gbm)

# fit the model
library(caret)
library(pROC)
set.seed(1)
gbm_wc <- train(train_gbm_label ~ ., data = data_gbm,
              method = "gbm",
              # Use AUC as our performance metric, which caret incorrectly calls "ROC".
              metric = "ROC",
              trControl = control,
              tuneGrid = grid,
              # Keep output more concise.
              verbose = FALSE)

gbm_wc

summary(gbm_wc, las=1)
