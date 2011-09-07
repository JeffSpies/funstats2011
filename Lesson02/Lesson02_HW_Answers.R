###############################################################################
# Title: PSYC 7765 - Lesson 02 - Homework - Answers
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  2 11:16:57 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 

###############################################################################
# Problem 1, Subproblem 1
###############################################################################

# How many participants had scores of 4, relecting "Very bad"?  

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

###############################################################################
# Problem 1, Subproblem 2
###############################################################################

# Make your previous function more modular by taking a second argument with a
# default value of 2 representing the score that you want to find out how many 
# participants had.

psyc7765.1.2 <- function(scores, score=2){
    answer <- length(scores[scores == score])
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

###############################################################################
# Problem 1, Subproblem 3
###############################################################################

# Create a function that returns the number of participants that have scores
# at the endpoints of the GQOL scale.

psyc7765.1.3 <- function(scores){
    answer <- length(scores[scores == 0 | scores == 4])
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

###############################################################################
# Problem 1, Subproblem 4
###############################################################################

# Create a function that returns the number of participants that meet a given
# selection criteria

psyc7765.1.4 <- function(scores, selection){
    answer <- length(scores[selection]) 
    return(answer)
}

(psyc7765.test.1.4 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.4(gqol, gqol == 4) == 2,
        psyc7765.1.4(gqol, gqol == 4 | gqol == 0)
    )
})() # SHOULD RETURN TRUE

###############################################################################
# Problem 1, Subproblem 5
###############################################################################

# Slightly different: create a function that returns the PROPORTION of
# participants that meet a given selection criteria

psyc7765.1.5 <- function(scores, selection){
    answer <- length(scores[selection])/length(scores)
    return(answer)
}

(psyc7765.test.1.5 <- function(){
    gqol <- c(4,3,4,0,2,2,1,2)
    all(
        psyc7765.1.5(gqol, gqol == 4) == .25,
        psyc7765.1.5(c(1,2,3), c(T,F,F)) == 1/3
    )
})() # SHOULD RETURN TRUE

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
    answer <- sum(selection)
    return(answer)
}

(psyc7765.test.2.1 <- function(){
    test <- 1:10
    all(
        psyc7765.2.1(test, test > 5) == 5,
        psyc7765.2.1(c(1,2,3), c(T,F,F)) == 1
    )
})() # SHOULD RETURN TRUE

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
