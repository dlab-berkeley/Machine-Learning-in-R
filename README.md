# Machine Learning in R

This is the repository for D-Lab’s Introduction to Machine Learning in R workshop.

RStudio Binder:
[![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/dlab-berkeley/Machine-Learning-in-R/master?urlpath=rstudio)

## Content outline

  - Background on machine learning
      - Classification vs regression
      - Performance metrics
  - Data preprocessing
      - Missing data
      - Train/test splits
  - Algorithm walkthroughs
      - ordinary least squares regression, lasso
      - Decision trees
      - Random forests
      - Gradient boosted machines
      - SuperLearner ensembling

## Assumed participant background

We assume that participants have familiarity with:

* basic R syntax
* statistical concepts such as mean and standard deviation

## Technology requirements

Please bring a laptop with the following:

* [R version](https://cloud.r-project.org/)
3.5 or greater
* [RStudio integrated development environment (IDE)](https://www.rstudio.com/products/rstudio/download/#download) is
highly recommended but not required.

## Resources

Browse resources listed on the [D-Lab Machine Learning Working Group repository](https://github.com/dlab-berkeley/MachineLearningWG). Scroll down to see code examples in R and Python, books, courses at UC Berkeley, online classes, and other resources and groups to help you along your machine learning journey!  


## Slideshow

The slides were made using [xaringan](https://github.com/yihui/xaringan), which is a wrapper for [remark.js](https://remarkjs.com/#1). Check out Chapter 7 if you are interested in making your own! The theme borrows from Brad Boehmke's presentation on [Decision Trees, Bagging, and Random Forests - with an example implementation in R](https://bradleyboehmke.github.io/random-forest-training/slides-source.html#1).  

## Getting started

Please install the following packages before the workshop date. Copy/paste the code below into your console or a script and run it. This code can also be found in the **01-overview.Rmd** file in this repository. 

```
install.packages(c(# Algorithms
                 "gbm", "glmnet", "randomForest", "ranger", "rpart", "xgboost",
                 # Visualization
                 "ggplot2", "rpart.plot", 
                 # Machine learning frameworks
                 "caret", "SuperLearner",
                 # R utility packages
                 "remotes", "dplyr",
                 # Misc
                 "mlbench", "pROC"))
```

If you are prompted by the question, "Do you want to install from sources the package which needs compilation? (Yes/no/cancel)", type no in your console and press Enter. 

... and, the most recent version of ck37r: `remotes::install_github(c("ck37/ck37r"))`

Then, open the **slides.html** file in the docs folder to get started! 

Contact us if you have questions! 
