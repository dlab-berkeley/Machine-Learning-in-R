cran_packages =
  c("caret",
    "dplyr",
    "glmnet",
    "ggplot2",
    "mlbench",
    "rpart",
    "rpart.plot",
    "remotes",
    "RhpcBLASctl",
    "SuperLearner",
    "ranger",
    "pROC",
    "vip",
    "xgboost",
    NULL)
install.packages(cran_packages)
remotes::install_github("ck37/ck37r")
