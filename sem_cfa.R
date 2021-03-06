# SEM analysis of a unidimensional scale (one-factor) using Lavaan
# https://cran.r-project.org/web/packages/lavaan/index.html

library(lavaan) # Load the Lavaan package
library(Rcmdr) # load R Commander to view the dataset

# Setting the working directory
setwd("C:/temp")

# Import the dataset (.dat is a file that stores the data as tab-limited text)
uniscale = read.delim("dataset.dat", header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")

# Model Specification: First, it is necessary to identify the model:
modelONE <- 'TOTAL =~ item1 + item2 + item3 + item4 + item5 + item6R + item7R + item8 + item9R + item10 + item11R'

# Second, we must fit our model
modelONE.fit <- cfa(model = modelONE, data = uniscale, ordered=c("item1", "item2", "item3", "item4", 
"item5", "item6R", "item7R", "item8", "item9R", "item10", "item11R"))

# Third, we analyze our fitted model (it must have df > 0, otherwise it means the model is not identified)
summary(modelONE.fit, standardized = TRUE, fit.measures = TRUE)

# We can also examine the modification indices to evaluate adding covariances [interaction (~~) or prediction (=~) terms]
modificationindices(modelONE.fit, sort = TRUE)
