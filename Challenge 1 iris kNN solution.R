### Challenge 1: iris kNN solution

# load data
data(iris)
?iris
str(iris)

# designate Y and X variables
Y_iris  <- iris$Species

X_iris <- iris[,c(1:4)]

# split the data
library(caret)
set.seed(1)
iris_split <- createDataPartition(Y_iris, p=0.70, list=FALSE)
train_iris <- X_iris[iris_split, ]
test_iris <- X_iris[-iris_split, ]

train_iris_labels <- Y_iris[iris_split]
test_iris_labels <- Y_iris[-iris_split]

# choose starting k-value
round(sqrt(nrow(train_iris)))

# fit kNN model
library(class)
set.seed(1)
iris_pred_knn <- knn(train = train_iris, test = test_iris,
                     cl = train_iris_labels, k = 10, prob = TRUE)
# evaluate cross tabs
library(gmodels)
CrossTable(x = test_iris_labels, y = iris_pred_knn, 
           prop.chisq = FALSE,
           prop.r = FALSE,
           prop.c = FALSE,
           prop.t = FALSE)

# compute accuracy
mean(test_iris_labels == iris_pred_knn) # ~ 91% accuracy! 

# plot it! 
ggplot(iris, aes(Petal.Length, Petal.Width, col=Species)) + geom_point()
