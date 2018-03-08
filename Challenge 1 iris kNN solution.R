### Challenge 1: Mroz knn with k = 2, 10, 20
library(class)
set.seed(1)
data_predicted_scaled2 <- knn(train = train_scaled,
                        test = test_scaled, 
                        cl = train_label_scaled,
                        k = 41, prob = TRUE)
library(gmodels)
CrossTable(x = test_label_scaled, y = data_predicted_scaled2, 
           prop.chisq = FALSE,
           prop.r = FALSE,
           prop.c = FALSE,
           prop.t = FALSE)
# Compute accuracy
mean(test_label_scaled == data_predicted_scaled2)

# k = 17
set.seed(1)
data_predicted_scaled3 <- knn(train = train_scaled,
                              test = test_scaled, 
                              cl = train_label_scaled,
                              k = 17, prob = TRUE)
mean(test_label_scaled == data_predicted_scaled3)

### Challenge 1: iris knn solution
# Load data.
data(iris)
?iris
str(iris)

# Designate Y and X variables.
Y_iris  <- iris$Species

X_iris <- iris[, 1:4]
X_iris <- scale(X_iris, scale = T, center = T)

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
iris_predicted_knn <- knn(train = train_iris, test = test_iris,
                     cl = train_iris_labels, k = 10, prob = TRUE)

# Evaluate cross tabs.
library(gmodels)
CrossTable(x = test_iris_labels, y = iris_predicted_knn, 
           prop.chisq = FALSE,
           prop.r = FALSE,
           prop.c = FALSE,
           prop.t = FALSE)

# compute accuracy
mean(test_iris_labels == iris_predicted_knn) # ~ 98% accuracy! 

# Plot Petal.Length and Petal.Width
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) + 
  geom_point(size = 5, alpha = 1) + 
  ggtitle("iris petal lengths and widths") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) 
