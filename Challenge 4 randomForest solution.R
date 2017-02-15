### Challenge 4 randomForest solution

# fit the model
rf2 <- randomForest(wc ~ ., 
                    data=train_rf,
                    ntree=500,
                    mtry=2,
                    importance=TRUE)
rf2 # view cross tabs

# compute accuracy
(334+94)/(nrow(train_rf)) # 0.81

# compute accuracy and relative variable importance
varImpPlot(rf2) # variable importance plot
barchart(rf2$importance, main="rf barchart", col="gray80", border="black") # barchart
dotplot(rf2$importance, main="rf2 dotplot", col=c(3,6)) # dot plot

# evaluate performance on the test dataset
rf2_pred <- predict(rf2, newdata=test_rf)
table(rf2_pred, test_rf$wc)

mean(rf2_pred == test_rf$wc) # ~ 0.84
