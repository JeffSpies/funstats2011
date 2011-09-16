###############################################################################
# Title: PSYC 7765 - Lesson 04
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep 16 12:54:26 2011 - Created the file - JRS
###############################################################################

# Go to http://people.virginia.edu/~js6ew/#7765

###############################################################################
# Working Directories
###############################################################################

# setwd('~/Projects/funstats2011/Lesson03/')
# setwd('C:/Documents and Settings/Jeffrey Spies/My Documents/7765/Lesson03/')
getwd()

###############################################################################
# Actual Data
###############################################################################

dat_iris <- read.csv('iris.csv')
str(dat_iris)
summary(dat_iris)

###############################################################################
# Plain Text
###############################################################################

readLines('iris.csv')
readLines('iris.xls')
readLines('iris.sav')

###############################################################################
# SPSS Data
###############################################################################

#install.packages('foreign')
require(foreign)
dat_iris_spss <- read.spss('iris.sav')
is.data.frame(dat_iris_spss)
is.list(dat_iris_spss) # Nooooo!
?read.spss

###############################################################################
# Examining
###############################################################################

# install.packages('psych')
require(psych) # library(psych)

describe(dat_iris)

head(dat_iris)
head(dat_iris, n=20)

mean(dat_iris$Sepal.Length)
with(dat_iris, mean(Sepal.Length))

###############################################################################
# Don't Attach: That Way, Madness Lies
###############################################################################

search()
attach(dat_iris)
search()
ls(dat_iris)

mean(Sepal.Length)

ls("dat_iris")

ls()
ls(".GlobalEnv")

detach(dat_iris)
search()
attach(dat_iris)

Petal.Length[Species == 'setosa'] <- 0

Petal.Length

dat_iris$Petal.Length

detach(dat_iris)

Petal.Length

Sepal.Length

