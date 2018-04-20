### Big question 1 answer: this example illustrates why choosing a single algorithm is not a good idea. KNN is probably not well-suited to examine the relationships that exist within the pidd dataset. This is why comparing multiple algorithms with different tunings, along with a weighted ensemble average and the single best-performing algorithm ("discrete winner"), is ideal. You will learn more about this in Section 6: SuperLearner. 


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
mean(test_iris_labels == iris_predicted_knn) # ~ 96% accuracy! 

# Plot Petal.Length and Petal.Width - can you guess why accuracy was so high? 
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species, shape = Species)) + 
  geom_point(size = 5, alpha = 1) + 
  ggtitle("iris petal lengths and widths") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5)) 
