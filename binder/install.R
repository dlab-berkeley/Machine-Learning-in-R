#install.packages("devtools")
# devtools::install_github(c("ecpolley/SuperLearner"))
cran_packages =
  c("car", "caret", "chemometrics", "class",
    "remotes",
    "doParallel", "pROC",
    "gbm", "gmodels", "ggplot2",
    "rpart", "rpart.plot", "partykit",
    "RhpcBLASctl", "SuperLearner",
    "lattice", "plotmo", "randomForest", "ranger", "ROCR",
    "survival", "xgboost")
install.packages(cran_packages)
remotes::install_github("ck37/ck37r")
