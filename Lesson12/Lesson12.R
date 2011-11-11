###############################################################################
# Title: PSYC 7765 - Lesson 12
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Nov 11 13:31:22 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 
#setwd("~/Projects/funstats2011/Lesson12")
require(plyr)
require(ggplot2)

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

files <- grep('^Subject[0-9]+\\.csv$', dir('Data/'), value=T)# Use dir and grep to select just the subjects
allsubjects <- ldply(files, function(x){
  read.csv(paste('Data/', x, sep=""))
}, .progress = "text") # Try adding a progress bar

# Use one of the **plys to plot trial x rt for every subject in allsubjects 
# and put the images in folder "Graphs"

d_ply(allsubjects, 'subject', function(df){
     p <- qplot(trial, rt, geom="point", data=df)
     filepath <- paste('Graphs/Subject',unique(df$subject),'.pdf',sep="")
     ggsave(filepath, plot=p)
})

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

#########################################################################################
#  Wide to Tall
#########################################################################################

d_int <- rnorm(5, sd=3)
d_slp <- rnorm(5, sd=5)

df <- data.frame(
    Subject=rep(1:5, each=3), 
    Gender=rep(sample(c('M', 'F'), 5, replace=T), each=3),
    Time=1:3, 
    Depression=rnorm(15), 
    Anxiety=rnorm(15),
    stringsAsFactors = F
)

# Graph Time by Anxiety

df

wide.df <- reshape(df, 
    idvar="Subject", 
    timevar="Time", 
    direction="wide"
)

reshape(wide.df, direction="long") 

attributes(wide.df)
attr(wide.df, "reshapeWide") <- NULL
attributes(wide.df)

reshape(wide.df, direction="long")

tall.df <- reshape(
    wide.df, 
    idvar="Subject", 
    varying=3:8, 
    direction="long"
)
