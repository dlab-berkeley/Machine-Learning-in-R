 cran_packages =
  c("tidyverse",
    "tidymodels",
    "bookdown",
    "caret",
    "glmnet",
    "pROC",
    "ranger",
    "rpart",
    "rpart.plot",
    "remotes",
    "rio",
    "SuperLearner",
    "vip",
    "xgboost",
    "PCAmixdata", "pvclust", "mclust", 
    "ape",
    NULL)
install.packages(cran_packages)
remotes::install_github("ck37/ck37r")
