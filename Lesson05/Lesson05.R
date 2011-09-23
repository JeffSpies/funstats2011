###############################################################################
# Title: PSYC 7765 - Lesson 05
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep 22 9:34:16 2011 - Created the file - JRS
###############################################################################

# Go to http://people.virginia.edu/~js6ew/#7765

rm(list=ls())

###############################################################################
# Working Directories
###############################################################################

#setwd('~/Projects/funstats2011/Lesson05/')
# setwd('C:/Documents and Settings/Jeffrey Spies/My Documents/7765/Lesson03/')
getwd()

###############################################################################
# Examining
###############################################################################

dat_iris <- read.csv('iris.csv')

str(dat_iris)

summary(dat_iris)

# install.packages('psych')
require(psych) # library(psych)

describe(dat_iris)

head(dat_iris)
head(dat_iris, n=20)

###############################################################################
# With
###############################################################################

mean(dat_iris$Sepal.Length)
with(dat_iris, mean(Sepal.Length))

dat <- data.frame(x=1:10, y=101:110)
with(dat, test)

test <- 1:5
with(dat, test)

x <- 1:5
with(dat, x)

with(dat, x + y)

###############################################################################
# Don't Attach: That Way, Madness Lies
###############################################################################

ls()
search()
attach(dat_iris)
search()

mean(Sepal.Length)

ls("dat_iris")

ls()
ls(".GlobalEnv")

detach(dat_iris)
search()
attach(dat_iris)
search()

Petal.Length[Species == 'setosa'] <- 0

Petal.Length

detach(dat_iris)

Petal.Length

Sepal.Length

dat_iris$Petal.Length

###############################################################################
# Reading in data: the arguments
###############################################################################

tc1 <- textConnection(
'var1 var2 var3 var4
 5 NA 2 3
10 3 5 8
')

(dat_1 <- read.table(tc1))

close(tc1)

tc2 <- textConnection(
'var1 var2 var3 var4
 5 NA 2 3
10 3 5 8
')

(dat_1 <- read.table(tc2))

close(tc2)

tc3 <- textConnection(
'v1, v2, v3,v4
 5,      , 2, 3
10,     3, 5, 8
')

(dat_1 <- read.table(tc3))

close(tc3)

tc4 <- textConnection(
'--my data file--
 # some comments
 5 8 2 3
10 3 5 8
')

(dat_1 <- read.table(tc4))

close(tc4)

###############################################################################
# NA basics
###############################################################################

1 == NA
TRUE == NA
test <- c(1,NA,2,4) 
test == NA
is.na(test)
sum(test)
sum(test[!is.na(test)])
?sum
sum(test, fill=in)

# Let's make some data

dat <- data.frame(subject=1:100, happy=round(rnorm(100,50,25)))
summary(dat)
require(psych)
describe(dat)
dat$happy[sample(1:100,20)] <- NA

# Let's pretend someone gave you the data we just made and we know nothing about it

summary(dat)
describe(dat)
dat$happy[is.na(dat$happy)] <- mean(dat$happy, na.rm=TRUE)
describe(dat) # What stayed the same? What changed?

# Let's make some more data

dat <- data.frame(subject=1:100, happy=round(rnorm(100,50,25)))
mean(dat)
dat$happy[dat$happy < 30][sample(1:sum(dat$happy < 30), round(sum(dat$happy < 30)/2))] <- NA

# Same game: you just got the data

summary(dat)
mean(dat, na.rm=TRUE)
dat$happy[is.na(dat$happy)] <- mean(dat$happy, na.rm=TRUE)
mean(dat)

# Moral of the story?

###############################################################################
# Factors
###############################################################################

# What are they?  What kind of data?
test <- factor(1:6, levels=1:7)
test
levels(test)
nlevels(test)

test <- c('M', 'M', 'F', 'M')
test
test <- as.factor(test)
test
testM <- relevel(test, 'M')
testM

levels(testM)
levels(testM) <- c('M', 'F', 'T')
testM

as.numeric(test)
as.numeric(testM)

###############################################################################
# Factor Workflow
###############################################################################

str(dat_iris)

dat_raw <- read.csv('iris.csv', stringsAsFactors=F)
str(dat_raw)

dat <- within(dat_raw, {
     SpeciesF <- as.factor("Species")
     
     levels(SpeciesF) <- c('setosa', 'versicolor', 'virginica') 
     # ^ if I'm not sure all my levels are represented
     
     SpeciesF <- relevel(SpeciesF, 'versicolor')
})

# Compare the following

str(dat)
str(dat_raw)
str(dat_iris)

###############################################################################
# Tables basics
###############################################################################

data(iris)
iris$Color <- as.factor(sample(rep(c("blue", "yellow", "red"), 50), 150))
table(iris$Species, iris$Color)

as.data.frame(table(iris$Species, iris$Color))
