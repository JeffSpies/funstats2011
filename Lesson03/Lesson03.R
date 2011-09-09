###############################################################################
# Title: PSYC 7765 - Lesson 03
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  2 11:16:57 2011 - Created the file - JRS
###############################################################################

# Go to http://people.virginia.edu/~js6ew/#7765

###############################################################################
# Simple selection
###############################################################################

a <- 1:10

(tSelect <- a > 5)

is.vector(tSelect)

is.logical(tSelect)

a[tSelect]

a[!tSelect] <- 1

a[tSelect] <- 2

a

a <- 1:10

a[2] <- 1

a

a[1:5] <- 1

depression <- c(1, 1, 2, 3, 5, 5)

anxiety <- c(1, 2, 4, 4, 4, 5)

anxiety[depression > 3]

###############################################################################
# The Console
###############################################################################

1:100

3+3

# What does the [1] mean?

###############################################################################
# Attributes
###############################################################################

c(3,4)

(names_example <- c(x=3, y=4)) # What variable style am I using?
names(names_example)
names_example['y']

attributes(names_example)
# Notice the $ sign

attributes(names_example)$names
# or
attr(names_example, 'names')
# Knowing this, what does the names() function do?
names(names_example)
# Remove names
(no_more_names <- as.vector(names_example))

###############################################################################
# Lists
###############################################################################

myList <- list(x=3, y=4) # What variable style am I using?

myList

myList$x

myList[1]

myList <- list(x=c(1,2,3), y=c(4, 5, 6))

###############################################################################
# Data
###############################################################################

dat <- data.frame(v1=c(1,2,3), v2=c(4,5,6))
dat

dim(dat) # just rows?

dat[1]
dat[1,]
dat[,1]
dat[,]
dat[1:2,]
dat[c(1,3),]

dat$v1

dat$v1[1,]

nrow(dat)
ncol(dat)

attributes(dat)

names(dat)

row.names(dat)

dat$v3 <- c(7,8,9)
dat
dat[dim(dat)[1]+1,] <- c(5,8,11)
dat
dat <- dat[-dim(dat)[1],]
dat
dat <- rbind(dat, c(4,7,10))
dat

dat <- data.frame(depression=c(1, 1, 2, 3, 5, 5), anxiety=c(1, 2, 4, 4, 4, 5))

subset(dat, depression > 3)

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
# Don't Attach: That Way Madness Lies
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