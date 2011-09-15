###############################################################################
# Title: PSYC 7765 - Lesson 03 - Homework - Answers
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  9 12:01:02 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls()) 

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 3 # DON'T CHANGE

###############################################################################
# CHANGE THIS
###############################################################################

psyc7765.name <- 'Type your name here'
psyc7765.id <- 'Type your computing id here' # (e.g. 'js6ew')

###############################################################################
# Homework How-To
###############################################################################

# Consult Homework 2

###############################################################################
# Problem 1: 2 subproblems
###############################################################################

# You have a vector of Beck Depression Inventory scores.  You would like to 
# categorize them--not for purpose of analyses, of course, but in order to 
# assign people to an intervention based upon their level of depression.
# Using standard cutoffs, we'll recode as follows (from no depression to
# severe):
#
# value     recoded value    name
# ------    -------------    ----
# 0-9       0                none
# 10-18     1                mild
# 19-29     2                moderate
# 30-63     3                severe

bdi <- c(36, 19, 0, 29, 6, 62, 18, 31, 60, 35)

# Create a function that recodes BDI vectors using selection vectors. The
# following is a good starting point.  It creates a new varaible 
# `depression_recoded` with the same length as the value that is passed into 
# the function, which, inside the function's scope (aka environment), is 
# called x.

psyc7765.1.1 <- function(x){
    depression_recoded <- rep(NA, length(x))
    depression_recoded[x >= 0 & x <= 9] <- 0
    depression_recoded[x >= 10 & x <= 18] <- 1
    depression_recoded[x >= 19 & x <= 29] <- 2
    depression_recoded[x >= 30 & x <= 63] <- 3
    return(depression_recoded)
}

# Try it:
psyc7765.1.1(bdi)

(psyc7765.test.1.1 <- function(){
    bdi <- c(36, 19, 0, 29, 6, 62, 18, 31, 60, 35)
    all(
        all(psyc7765.1.1(bdi) == c(3,2,0,2,0,3,1,3,3,3))
    )
})()

# Now create a `list` of counts for each level of severity. You'll need to
# use the list and length functions along with a selection vector.

psyc7765.1.2 <- function(x){
    list(
        none=sum(x == 0),
        mild=sum(x==1),
        moderate=sum(x==2),
        severe=sum(x==3)
    )
}

# This should give you counts for each level of the recoded vector:

depression_recoded <- psyc7765.1.1(bdi)
(depression_counts <- psyc7765.1.2(depression_recoded))

# The names attribute of depression_counts:

names(depression_counts)

# Should look like 

c('none', 'mild', 'moderate', 'severe')

(psyc7765.test.1.2 <- function(){
    rec <- c(3,2,0,2,0,3,1,3,3,3)
    all(
        unlist(psyc7765.1.2(rec)) == c(2,1,2,5),
        all(names(psyc7765.1.2(rec)) == c('none', 'mild', 'moderate', 'severe'))
    )
})()

psyc7765.1.minutes <- NA # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 2: 1 subproblem
###############################################################################
# Write a function called add_recoded_column that takes one argument--a 
# dataframe that has a bdi column--and adds a column called bdi_recoded using 
# the recoding function you used above: psyc7765.1.1. It should return
# the same data frame with the added column. Some practice:

test <- data.frame(x=1:4, y=52:55)
test
dim(test)
names(test)
new_column <- 8:11
is.vector(new_column)
test$z <- new_column
test
dim(test)
names(test)

# The following is the data frame with data that I've simulated.  It has 
# columns subject and bdi.

dat <- data.frame(subject=1:15, bdi=round(runif(15,0,63)))
dat
dim(dat) # 15 rows?
attributes(dat)
dat$bdi

psyc7765.1.1(dat$bdi) # Need to add this column named bdi_recoded to dat
is.data.frame(psyc7765.1.1(dat$bdi))
is.vector(psyc7765.1.1(dat$bdi))

# This should take a data frame and return a dataframe that includes a recoded
# column.
psyc7765.2.1 <- function(the_dataframe){
    the_dataframe$bdi_recoded <- psyc7765.1.1(the_dataframe$bdi)
    return(the_dataframe)
}

# Try it:
psyc7765.2.1(dat)

(psyc7765.test.2.1 <- function(){
    testDF <- data.frame(subject=1:4, bdi=c(1, 11, 20, 31))
    all(
        is.data.frame(psyc7765.2.1(testDF)),
        !is.null(psyc7765.2.1(testDF)$bdi_recoded),
        all(psyc7765.2.1(testDF)$bdi_recoded == c(0:3))
    )
})()

psyc7765.2.minutes <- NA # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 3: 2 subproblems
###############################################################################

# I have a list:

(myList <- list(x=c(2,8,15,3,9), y=c(9,4,3,9,6)))

# But I want to flatten it to be one simple vector that looks like this:

c(2,8,15,3,9,9,4,3,9,6)

# What is one way that I can get this vector using a list like `myList` and 
# the dollar notation? Assume the list has name attributes, x and y. Remember:
# I can combine vectors using `c`.  Consider what x and y are in myList.

psyc7765.3.1 <- function(x){
    answer <- c(x$x, x$y)
    return(answer)
}

(psyc7765.test.3.1 <- function(){
    myList <- list(x=c(2,8,15,3,9), y=c(9,4,3,9,6))
    all(
        all(psyc7765.3.1(myList) == c(2,8,15,3,9,9,4,3,9,6)),
        all(psyc7765.3.1(list(x=c(1,2,3), y=c(4,5,6,7))) == 1:7),
        is.null(names(psyc7765.3.1(list(x=c(1,2,3), y=c(4,5,6,7)))))
    )
})() # SHOULD RETURN TRUE

# What is another way that I can accomplish my goal such that it will also work 
# on the following list? 

(myOtherList <- list(a=c(2,8,15), b=c(3,9,9), c=c(4,3,9,6)))

# I want to flatten this one to look like this:

c(2,8,15,3,9,9,4,3,9,6)

# I can no longer use $ notation, because the names are different.  Ideally, 
# the next function you write can handle myList and myOtherList. You need to 
# use no more than two functions to complete the task. One of those you learned
# in class; the other I'd suggest starting to looking here: ?list and you do 
# not need conditionals or loops.  One of the functions has to do with vectors,
# while the other has to do with lists.

psyc7765.3.2 <- function(x){
    answer <- as.vector(unlist(x))
    return(answer)
}

# This one is a bit tricky, so, as you play with the functions, look at the 
# type of data that is being returned by each function and the attributes they
# have.

(psyc7765.test.3.2 <- function(){
    myList <- list(x=c(2,8,15,3,9), y=c(9,4,3,9,6))
    myOtherList <- list(a=c(2,8,15), b=c(3,9,9), c=c(4,3,9,6))
    all(
        all(psyc7765.3.2(myList) == c(2,8,15,3,9,9,4,3,9,6)),
        all(psyc7765.3.2(myOtherList) == c(2,8,15,3,9,9,4,3,9,6)),
        all(psyc7765.3.2(list(x=c(1,2,3), y=c(4,5,6,7))) == 1:7),
        is.null(names(psyc7765.3.2(list(x=c(1,2,3), y=c(4,5,6,7)))))
    )
})() # SHOULD RETURN TRUE

psyc7765.3.minutes <- NA # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 4: 1 subproblem
###############################################################################

# I have another list:

(my_list <- list(x=c(2,8,15,3,9), y=c(9,4,3,9,6)))

# I want the 5th element from the first vector in my_list.  I could retrieve 
# that value using the dollar notation:

my_list$x[5]

# but I want my code to be reusable ,and I'm not always sure the first vector 
# in my_list will be called x.

# Why does

my_list[[1]][5]

# work, but

my_list[1][5]

# does not?  Return your answer as a string inside the function below. The
# correct answer needs to be no more than one sentence. Hint: ?'[['

psyc7765.4.1 <- function(){
    answer <- "[[ can be used to select a single element dropping names, whereas [ keeps them"
    return(answer)
}

(psyc7765.test.4.1 <- function(){
    all(
        is.character(psyc7765.4.1()),
        grepl("name", psyc7765.4.1(), ignore.case=T)
    )
})() # SHOULD RETURN TRUE

psyc7765.4.minutes <- NA # Enter the number of minutes you spent on this problem

###############################################################################
# Run the following to see a report for this homework
###############################################################################

invisible(psyc7765.report <- sapply(
    grep("psyc7765.test", ls(), value=T), 
    function(x){
        isCorrect <- do.call(x, list())
        correctness <- ifelse(isCorrect, 'correct', 'incorrect')
        cat(x, 'is', correctness, '\n')
        isCorrect
    }
))