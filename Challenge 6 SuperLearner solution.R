library(SuperLearner)

set.seed(1, "L'Ecuyer-CMRG")
cv_sl2 <- CV.SuperLearner(Y = Y, X = train_SL,
                         SL.library = SL_library,
                         family = binomial(),
                         # Fit only 5 folds for demo purposes only.
                         # For a real analysis we would do 20 folds.
                         cvControl = list(V = 5),
                         # Set to T to show details.
                         verbose = F)

# Check if the prediction vectors are the same for both CV.SL results.
all.equal(cv_sl$SL.predict, cv_sl2$SL.predict)

set.seed(2, "L'Ecuyer-CMRG")

# Re-run with only linear regression and a decision tree.
cv_sl3 <- CV.SuperLearner(Y = Y, X = train_SL,
                          SL.library = c("SL.glm", "SL.rpart"),
                          family = binomial(),
                          # Fit only 5 folds for demo purposes only.
                          # For a real analysis we would do 20 folds.
                          cvControl = list(V = 5),
                          # Set to T to show details.
                          verbose = F)


# Our risk is higher, meaning that we are making more mistakes.
summary(cv_sl3)
# Compare to the full library.
summary(cv_sl2)

# Review elements of the CV.SuperLearner return object.
names(cv_sl2)

# SL.library saves the library that we used.
cv_sl2$SL.library

# whichDiscreteSL tells us the best single algorithm in each of the CV folds (5).
cv_sl2$whichDiscreteSL

# Easier to read in a table, especially with 20 CV folds.
table(unlist(cv_sl2$whichDiscreteSL))
