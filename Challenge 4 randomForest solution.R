### Challenge 4 randomForest solution

##### 1. Change mtry

rf <- randomForest(lfp ~ ., 
                    data = train,
                    ntree = 500,
                    mtry = 10)

##### 2. Change maxnodes

##### 3. Different outcome variable.
# Fit the model.
rf2 <- randomForest(wc ~ ., 
                    data = train_rf,
                    ntree = 500,
                    mtry = 2,
                    importance = TRUE)

# View results.
rf2

# Confirm accuracy is 1 - OOB error rate.
(334 + 94) / nrow(train_rf) # 0.81

# Variable importance plot.
varImpPlot(rf2) 
barchart(rf2$importance, main="rf barchart", col="gray80", border="black") 
dotplot(rf2$importance, main="rf2 dotplot", col=c(3,6))

# Evaluate performance on the test dataset.
rf2_pred <- predict(rf2, newdata = test_rf)
table(rf2_pred, test_rf$wc)

# Calculate accuracy.
mean(rf2_pred == test_rf$wc) # ~ 0.84
