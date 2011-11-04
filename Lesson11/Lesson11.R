###############################################################################
# Title: PSYC 7765 - Lesson 11
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Nov  4 12:52:03 EDT 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 
#setwd("~/Projects/funstats2011/Lesson10")
require(plyr)
require(ggplot2)

###############################################################################
# Proprotion Correct
###############################################################################

# Fake Dataset: children come in for 2 sessions.  At each session, they are 
# presented with a spoon with the bowl end facing either their right or left
# hand 25 times. They either correcly use a radial grip:
#
#  o===||||=
#     \||||
#
# or incorrectly us an ulnar grip:
#
#     =||||==o
#     \||||

spoons <- expand.grid(
     Trial=1:25,
     Session=1:2,
     Subject=1:30
)
spoons <- spoons[,rev(names(spoons))]
spoons$isCorrect <- sample(c(T,F),50*30,replace=T)

prop.spoons <- YOU FILL IN # Create a dataset of proportion correct for each subject

prop.spoons.time <- YOU FILL IN # Create a dataset of proportion correct for each subject per each time

###############################################################################
# Individual subject files
###############################################################################

# Create folders "Data" and "Graph" in your working directory (getwd())

numberOfSubjects <- 100

l_ply(1:numberOfSubjects, function(i){
     filename <- paste(paste('Data/Subject', i, sep=""), '.csv', sep="")
     subjectLevelData <- data.frame(subject=i, trial=1:1000, rt=rnorm(1000, 500, 80)-rnorm(1, mean=0, sd=.1)*(1:1000))
     write.csv(subjectLevelData, file=filename, row.names=F)
})

# Plyr Basics    
#                                 OUTPUT 
#       INPUT   \ array | data frame |  list | discarded 
#   ------------|---------------------------------------
#   array       | aaply |      adply | alply |     a_ply 
#   data frame  | daply |      ddply | dlply |     d_ply
#   list        | laply |      ldply | llply |     l_lpy

files <- # Use dir and grep to select just the subjects
allsubjects <- ldply(files, function(x){
  read.csv(paste('Data/', x, sep=""))
}) # Try adding a progress bar

# Use one of the **plys to plot trial x rt for every subject in allsubjects 
# and put the images in folder "Graphs"

**dply(allsbuejcts, FILLIN)

###############################################################################
# Binary variables: transitions
###############################################################################

isHappy <- c(T, F, T, T, T, T, F, F, F, F, F)

transTable <- function(v){
}

transDf <- function(from, fromNames){
}

transDf(isHappy, c('happy', 'sad'))

aborc <- c('a', 'a', 'a', 'b', 'c')

transDf(aborc, c('a', 'b', 'c'))

#########################################################################################
#  Merging datasets
#########################################################################################

df <- data.frame(
    Subject=rep(1:5, each=3), 
    Gender=rep(sample(c('M', 'F'), 5, replace=T), each=3),
    Time=1:3, 
    Depression=rnorm(15), 
    Anxiety=rnorm(15)
)

df.age <- data.frame(id=1:5, Age=runif(5, 20, 30))

merge(df, df.age, by.x="Subject", by.y="id")