#install.packages("devtools")
# devtools::install_github(c("ecpolley/SuperLearner"))
cran_packages =
  c("car", "caret", "chemometrics", "class",
    "devtools",
    "doParallel", "pROC",
    "gbm", "gmodels", "ggplot2",
    "rpart", "rpart.plot", "partykit",
    "RhpcBLASctl", "SuperLearner",
    "lattice", "plotmo", "randomForest", "ROCR",
    "survival", "xgboost")
install.packages(cran_packages)
devtools::install_github("ck37/ck37r")