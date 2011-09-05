###############################################################################
# Title: PSYC 7765 - Lesson 02 - Homework
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  2 11:16:57 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls()) 

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 2 # DON'T CHANGE

###############################################################################
# CHANGE THIS
###############################################################################

psyc7765.name <- 'Type your name here'
psyc7765.id <- 'Type your computing id here' # (e.g. 'js6ew')

###############################################################################
# Homework How-To (uh oh, this can't be good)
###############################################################################

# You'll be using functions to answer these problems and naming them as 
# follows: 
#   psyc7765.problem#.subproblem#
# For example, problem 0, subproblem 1 would be answered as:

psyc7765.0.1 <- function(){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

# Test your output on your own by calling:

psyc7765.0.1()

# I will usually give you a function that tests your function, in which case
# you'll need to use arguments, like x, below.

psyc7765.0.1 <- function(x){
    answer <- sum(x)
    return(answer)
}

# So the test would call `psyc7765.0.2(1:10)` as below:

(psyc7765.test.0.1 <- function(){
    all(
        psyc7765.0.1(1:10) == 55 
    )
})() # SHOULD RETURN TRUE

# If you don't know the answer to something, show your work above the function,
# but make sure the function is left unchanged and returning NA.

# Also, keep track when you started each problem so I know how long they took
# you:

psyc7765.minutes.0.1 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Background
###############################################################################

# During the last class we saw an important data structure: vectors. Vectors 
# are collections of elements of a single data type (e.g. numerics, strings,
# logicals) that can be identified by an index.

myVector <- c(5,4,5,1,2,3,2,3)

# To get the second element of `myVector`, I can type:

myVector[2]

# I could also type

myVector[c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)]

# c(FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE) is a vector of
# of logicals equal to the length of myVector, thus giving us two ways to 
# extract data from vectors: by index and by vectors of logicals. To select
# the first and third elements of myVector, I could type:

myVector[c(1,3)]

# or

myVector[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)]

# While it is inefficient to write out selections using logicals by hand, 
# other operators return logicals. Binary operators (<, >, <=, >=, ==, !=)
# and logical operators (!, &, &&, |, ||, xor) can be combined to do just that.

1 > 2 # 1 is greater than 2?
3 > 2 # 3 is greater than 2?

1 > 2 | 3 > 2 # 1 is greater than 2 or 3 is greater than 2?  If one or more of
              # those statements is TRUE, then the whole expression evaluates 
              # to TRUE, otherwise it's FALSE.

1 > 2 & 3 > 2 # 1 is greater than 2 and 3 is greater than 2? If both of those
              # statements is TRUE, then the whole expression evaluates to 
              # TRUE, otherwse it's FALSE.

# Try these:

TRUE & TRUE

TRUE & FALSE

FALSE & TRUE

FALSE & FALSE

TRUE | TRUE

TRUE | FALSE

FALSE | TRUE

FALSE | FALSE

# Remember, these examples are the same as above: 1 > 2 and 3 > 2 evaluate
# to TRUE (T) and FALSE (F) immediately, so

1 > 2 | 3 > 2

# is equivalent to

FALSE | TRUE

# We can do something similar with vectors

myVector > 4

# but instead of evaluating to a single TRUE or FALSE, we get a vector of TRUEs
# and FALSEs.  The length of this vector is equal to the lenght of the vector
# we are comparing.

length(myVector)

length(myVector > 4)

# You could have also written:

mySelection <- myVector > 4
length(mySelection)

# To get a vector of the actual scores that meet the criteria of the selection,
# you do just as we did before with

myVector[c(TRUE, FALSE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)]

# but now you use your selection, which, remember, is equivalent to the vector
# of logicals above:

myVector[myVector > 4]

# or

myVector[mySelection]

# Now we can ask how many values are in myVector that are greater than 4?

length(myVector[myVector > 4])

# Or, how many values are in myVector that are greater than its mean, 

mean(myVector)

# ?

length(myVector[myVector > mean(myVector)])

# Let's pretend these are scores from the Global Quality of Life scale--a
# single-item, 5-point Likert scale asking: "In general, how would you rate
# your overall quality of life during the past week?" Scores range from 0
# (Very good, my life could hardly be better) to 4 (Very bad, my life could
# hardly be worse) with a midpoint of 2 (The good and bad parts are about 
# equal).

gqol <- c(4,3,4,0,2,2,1,2)

# We have

length(gqol)

# participants in our "data-set".  Here we go.

###############################################################################
# Problem 1, Subproblem 1
###############################################################################

# How many participants had scores of 4, relecting "Very bad"?  

psyc7765.1.1 <- function(scores){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

# I'll do it for you; some work, step by step:

scores <- gqol
scores == 4
selection <- scores == 4
scores[selection]
length(scores[selection])

psyc7765.1.1 <- function(scores){
    selection <- scores == 4
    answer <- length(scores[selection])
    return(answer)
}

(psyc7765.test.1.1 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.1(gqol) == 2,
        psyc7765.1.1(c(1,2,3)) == 0
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.1.1 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 1, Subproblem 2
###############################################################################

# Make your previous function more modular by taking a second argument with a
# default value of 2 representing the score that you want to find out how many 
# participants had.

psyc7765.1.2 <- function(scores){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

(psyc7765.test.1.2 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.2(gqol) == 3,
        psyc7765.1.2(gqol, 4) == 2,
        psyc7765.1.2(gqol, 1) == 1
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.1.2 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 1, Subproblem 3
###############################################################################

# Create a function that returns the number of participants that have scores
# at the endpoints of the GQOL scale.

psyc7765.1.3 <- function(scores){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

(psyc7765.test.1.3 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.3(gqol) == 3,
        psyc7765.1.3(c(4,4,4,4,4)) == 5,
        psyc7765.1.3(c(0,0)) == 2
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.1.3 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 1, Subproblem 4
###############################################################################

# Create a function that returns the number of participants that meet a given
# selection criteria

psyc7765.1.4 <- function(scores, selection){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

(psyc7765.test.1.4 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.4(gqol, gqol == 4) == 2,
        psyc7765.1.4(gqol, gqol == 4 | gqol == 0)
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.1.4 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 1, Subproblem 5
###############################################################################

# Slightly different: create a function that returns the PROPORTION of
# participants that meet a given selection criteria

psyc7765.1.5 <- function(scores, selection){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

(psyc7765.test.1.5 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.5(gqol, gqol == 4) == .25,
        psyc7765.1.5(c(1,2,3), c(T,F,F)) == 1/3
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.1.5 <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 2
###############################################################################

# We currently find the number of values that meet a certain selection criteria
# as follows:

myVector2 <- 1:10
selection <- myVector2 > 5
length(myVector2[selection])

# but this can be done more concisely if one remembers that logicals are really
# just 1s and 0s. Do so below. HINT: Some of you will get it, sum of you
# won't.

psyc7765.2.1 <- function(vForVector, selection){
    answer <- NA # REPLACE WITH CODE
    return(answer)
}

(psyc7765.test.2.1 <- function(){
    test <- 1:10
    all(
        psyc7765.2.1(test, test > 5) == 5,
        psyc7765.2.1(c(1,2,3), c(T,F,F)) == 1
    )
})() # SHOULD RETURN TRUE

psyc7765.minutes.2.1 <- 0 # Enter the number of minutes you spent on this problem

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
