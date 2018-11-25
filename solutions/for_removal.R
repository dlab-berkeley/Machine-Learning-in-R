##### Regression setup

# We could do something similar for our lone regression task, simple linear regression(ordinary least squares), but instead you could also use R's handy `predict` function to simply create a pseudo-test sample using predictions on all the data. 


# 2.  Linear regression
Ordinary least squares (OLS) regression can be used when the target Y variable is continuous. Remember that under the hood, `lm` is one-hot encoding factors to indicators, but we will write it out below just for good practice.  

This time, we will use the entire `pidd` dataset since we can use the `predict` R function to generate pseudo-test data. Here, we can just define our Y outcome inside the function (`pidd$age`) and then subset the rest of `pidd` to exclude age as a way to define our predictors.  

Mean squared error (MSE) and root mean squared error (RMSE) will be our performance metrics. MSE measures the difference between observed and expected values, with smaller values indicative of greater predictive accuracy. The advantage of RMSE is that it can be easier to interpret and explain because it is on the same unit scale as the outcome variable we are predicting. 
```{r}
# Fit the regression model.
reg = lm(age ~ ., data = pidd)

# View the regression results.
summary(reg) 

# Generate predicted values using the original (training) data.
predictions = predict(reg, pidd) 

# Calculate mean-squared error. 
(mse = mean((pidd$age - predictions)^2))

# Root mean squared error (RMSE).
sqrt(mse)
```

**Big question 2:** What might your surmise about linear regression and this dataset? (see the solutions file for an answer)  

##### Challenge 2
Code a regression model that predicts one of the numeric variables from the "iris" dataset. 



##### 1.3 knn - scale the data

Scaling the data is useful so that variables with large values do not bias the prediction. Create a new copy of the `features` dataset called `data_scaled`, which will contain scaled values with means equal to 0 and standard deviations equal to 1. Our Y variable remains unchanged:
  ```{r boxplots}
# Scale the dataset after first log-transforming insulin.
data_scaled = features %>% mutate(insulin = log(insulin)) %>%
  scale(center = TRUE, scale = TRUE) %>% data.frame()

# Quick function to make a boxplot for each variable in a dataset.
ggbox = function(df) {
  ggplot(stack(df),
         aes(x = factor(ind, levels = rev(names(df))), y = values)) +
    geom_boxplot() + theme_minimal() + coord_flip() + xlab("")
}

# Note the much larger scale for insulin, and to a lesser extent glucose.
ggbox(features) + ggtitle("Distribution of original features")
ggbox(data_scaled) + ggtitle("Distribution of rescaled features")
```

Repeat the process:  
  1) split the scaled data  
```{r}
# Create the training set.
train_scaled = data_scaled[training_rows, ] 

# Create the test set.
test_scaled = data_scaled[-training_rows, ] 

# Extract outcome data for training set.
train_label_scaled = y[training_rows] 

# Extract outcome data for test set.
test_label_scaled = y[-training_rows] 
```

2) fit the model this time on the scaled data
```{r}
library(class)
set.seed(1)
knn_result_scaled = knn(train = train_scaled, test = test_scaled, 
                        cl = train_label_scaled, k = sqrt_rows, prob = TRUE)
```

3) examine the accuracy of predictions on the scaled data: 
  ```{r}
library(gmodels)
CrossTable(x = test_label_scaled, y = knn_result_scaled, 
           prop.chisq = FALSE, prop.r = FALSE, prop.c = FALSE, prop.t = FALSE)

# or
caret::confusionMatrix(knn_result_scaled, factor(test_label_scaled))

# Compute accuracy
mean(test_label_scaled == knn_result_scaled) # ~0.71
```

Did scaling the data help?  