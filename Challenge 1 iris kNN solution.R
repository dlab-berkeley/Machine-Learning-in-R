### Challenge 1: iris kNN solution

# Load data.
data(iris)
?iris

# Designate Y and X variables.
Y_iris  <- iris$Species

X_iris <- iris[, 1:4]

# Split the data.
library(caret)
set.seed(1)
iris_split <- createDataPartition(Y_iris, p = 0.70, list = FALSE)
train_iris <- X_iris[iris_split, ]
test_iris <- X_iris[-iris_split, ]

train_iris_labels <- Y_iris[iris_split]
test_iris_labels <- Y_iris[-iris_split]

# Choose starting k-value.
round(sqrt(nrow(train_iris)))

# fit kNN model
library(class)
set.seed(1)
iris_pred_knn <- knn(train = train_iris, test = test_iris,
                     cl = train_iris_labels, k = 10, prob = TRUE)

# Evaluate cross tabs.
library(gmodels)
CrossTable(x = test_iris_labels, y = iris_pred_knn, 
           prop.chisq = FALSE,
           prop.r = FALSE,
           prop.c = FALSE,
           prop.t = FALSE)

# Compute accuracy.
mean(test_iris_labels == iris_pred_knn) # ~ 98% accuracy! 

# Plot original dataset.
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) + geom_point()
