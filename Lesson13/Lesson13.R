###############################################################################
# Title: PSYC 7765 - Lesson 13
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Nov 18 13:02:38 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 
setwd("~/Projects/funstats2011/Lesson12")
require(plyr)
require(ggplot2)

###############################################################################
# Binary variables: transitions
###############################################################################

isHappy <- c(T, F, T, T, T, T, F, F, F, F, F)

transTable <- function(v){
     table(v[1:length(v)-1], v[2:length(v)])
}

transTable(isHappy)
prop.table(transTable(isHappy), 1)

transDf <- function(from, fromNames=NULL){
    tab <- transTable(from)
    data.frame(counts=as.vector(tab), props=as.vector(prop.table(tab,1)))
}

transDf(isHappy)

transDf <- function(from, fromNames=NULL){
    tab <- transTable(from)
    data.frame(counts=as.vector(tab), props=as.vector(prop.table(tab,1)))
}

levels(as.factor(isHappy))
transDf(isHappy, c('sad', 'happy'))

# count from to
#      4   F  F
#      1   F  T
     
transDf(isHappy)

aborc <- c('a', 'a', 'a', 'b', 'c')

transDf(aborc, c('a', 'b', 'c'))

###############################################################################
#  Merging datasets
###############################################################################

df <- data.frame(
    Subject=rep(1:5, each=3), 
    Gender=rep(sample(c('M', 'F'), 5, replace=T), each=3),
    Time=1:3, 
    Depression=rnorm(15), 
    Anxiety=rnorm(15)
)

df.age <- data.frame(id=1:20, Age=runif(20, 20, 30))

merge(df, df.age, by.x="Subject", by.y="id")

###############################################################################
#  Wide to Tall
###############################################################################

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
    idvar=c("Subject", "Gender"), 
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
    idvar=c("Subject"), 
    varying=3:8, 
    direction="long"
)

###############################################################################
# Another Example
###############################################################################

dat <- data.frame(ID=1:5, gender=sample(c('Male', 'Female'), 5, replace=T), 
    csmart=rnorm(5), cfriendly=rnorm(5), 
    psmart=rnorm(5), pfriendly=rnorm(5), 
    tsmart=rnorm(5), tfriendly=rnorm(5)
)

dat.tall <- reshape(dat, 
    idvar="ID",  
    #timevar="character", 
    #times=c("cheer", "prof", "teacher"), 
    varying=list(
        grep("smart", names(dat), value=T), 
        grep("friendly", names(dat), value=T)
    ), 
    #v.names = c("smart","friendly"),
    direction="long"
)

# A safer way (I think)
dat2 <- dat
names(dat2) <- c('ID', 'gender', 
    'smart.cheer', 'friendly.cheer', 
    'smart.prof', 'friendly.prof',
    'smart.teacher', 'friendly.teacher'
)
dat2.tall <- reshape(dat2, 
    idvar="ID", 
    timevar="character", 
    varying=3:8, 
    direction="long"
)

# Clean up
row.names(dat.tall) <- NULL
row.names(dat2.tall) <- NULL

###############################################################################
# Using regular expressions to rename dataframes
###############################################################################

names(dat)
gsub('^c(smart|friendly)$', '\\1.cheer', names(dat))
gsub('^p(smart|friendly)$', '\\1.prof', names(dat))
gsub('^t(smart|friendly)$', '\\1.teacher', names(dat))

###############################################################################
#  Conditional basics: if
###############################################################################

if(TRUE){
    cat('hi', fill=T)
}

if(FALSE){
	cat('hi', fill=T)
}

if(FALSE){
	answer <- 'hello'
}else{
	answer <- 'goodbye'
}
answer

score <- 9
sex <- 'M'

if(score > 5 & sex == 'F'){
    result <- 1
}else{
    if(score > 5 & sex == 'M'){
        result <- 2
    }else{
        reult <- NA
    }
}

if(score > 5){
    if(sex == 'F'){
        result <- 1
    }else{
        result <- 2
    }
}else{
    result <- NA
}

# If you're looking to simply fill a variable, you might prefer:

(answer <- ifelse(TRUE, 'hello', 'goodbye'))
(answer <- ifelse(FALSE, 'hello', 'goodbye'))

df <- data.frame(id=1:10, sex=sample(c('M','F'), 10, replace=T))
df$isMale <- ifelse(df$sex=='M', T, F)
df$isMale2 <- df$sex == 'M'