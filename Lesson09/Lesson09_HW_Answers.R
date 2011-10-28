###############################################################################
# Title: PSYC 7765 - Lesson 09 - Homework - Answers
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Sat Oct 23 09:20:40 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls())

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 9 # DON'T CHANGE

###############################################################################
# CHANGE THIS
###############################################################################

psyc7765.name <- 'Type your name here'
psyc7765.id <- 'Type your computing id here' # (e.g. 'js6ew')

###############################################################################
# Problem 1
###############################################################################

# You receive a dataset in the following format:

df <- data.frame(
    subject=1:100,
    dep1.1=rnorm(100), dep2.1=rnorm(100), dep3.1=rnorm(100),
    anx1.1=rnorm(100), anx2.1=rnorm(100), anx3.1=rnorm(100),
    dep1.2=rnorm(100), dep2.2=rnorm(100), dep3.2=rnorm(100),
    anx1.2=rnorm(100), anx2.2=rnorm(100), anx3.2=rnorm(100)
)

# Variables represent three depression items and three anxiety itmes at two 
# time points (the number following the "."). Use grep to create a sum 
# score (add dep1, dep2, and dep3) for depression items (variables with the
# name "dep") at time 1.

sum(FILL IN)

regex <- "^dep.\\.1$" # 1 possible regex; others would work

# 4 different solutins; unnderstand them all.

apply(df[,grep(regex, names(df))], 1, sum)

apply(df, 1, function(x){
    sum(x[grep(regex, names(df))])
})

ddply(df, 'subject', function(x){
    sum(x[grep(regex, names(df))])
})

ddply(df, 'subject', function(x){
    sum(x[,grep(regex, names(df))])
})

psyc7765.1.minutes <- NA

###############################################################################
# Problem 2
###############################################################################

# Please put some thought into the following: generate a dataset representing 
# something silimar to the stuff you study and create a ddply statement to do 
# something interesting/relevent to said dataset. Use functionsn like rnorm, 
# runif, sample, expand.grid, and/or data.frame.  You can also choose to graph
# said dataset using qplot, but consider that bonus.

dat <- FILL IN

ddply(FILL IN)

qplot(FILL IN)

psyc7765.2.minutes <- NA

###############################################################################
# Problem 3
###############################################################################

# The summarise function that we use with ddply is a very succinct way of 
# creating new columns.

ddply(iris, c('Species'), summarise, sl_squared=Sepal.Length^2)

# I have written a similar function to summarise, just concentrating on what I
# think are the important aspects:

summereyes <- function(x, ...){
    data.frame(
        eval(substitute(list(...)), x)
    )
}

ddply(iris, c('Species'), summereyes, sl_squared=Sepal.Length^2)

# You can use these functions on their own if you don't need the dataframe
# split it up by a factor, like Species:

summarise(iris, sl_squared=Sepal.Length^2)
summereyes(iris, sl_squared=Sepal.Length^2)

# Go through the following lines and try to figure out what might be happening
# in summereyes/summarise generally; comment on it below:

substitute(list(test=2.4*2))
eval(substitute(list(test=2.4*2)))

substitute(list(sl_squared=Sepal.Length^2))
substitute(list(sl_squared=Sepal.Length^2), iris)

eval(substitute(list(sl_squared=Sepal.Length^2), iris)) # Note to which function
eval(substitute(list(sl_squared=Sepal.Length^2)), iris) #    iris is an argument

data.frame(eval(substitute(list(sl_squared=Sepal.Length^2), iris)))

# ANSWER HERE

psyc7765.3.minutes <- NA