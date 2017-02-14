data(iris)
str(iris)
Y_iris <- iris$Species
X_iris <- iris[, -5]

set.seed(1)
split_gbm_iris <- createDataPartition(Y_iris, p=0.70, list=FALSE)
train_gbm_iris <- iris[split_gbm_iris,]
test_gbm_iris <- iris[-split_gbm_iris,]

Y_train_label <- 

library(caret)
control <- trainControl(method="repeatedcv", 
                        repeats=5, 
                        #classProbs=TRUE, 
                        summaryFunction=multiClassSummary) # what changed here? 

grid <- expand.grid(n.trees=seq(1,1000, by=50), 
                    interaction.depth=c(1, 3), 
                    shrinkage=c(0.01, 0.1), 
                    n.minobsinnode=10) 

gbm1 <- train(Y_iris ~ ., data=train_gbm_iris,
              method="gbm", 
              #distribution="gaussian",
              metric="Accuracy", # what changed here?
              trControl=control, 
              tuneGrid=grid, 
              verbose=FALSE) 

