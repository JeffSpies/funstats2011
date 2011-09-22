###############################################################################
# Title: PSYC 7765 - Lesson 04 - Homework - Answers
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  9 16:01:02 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls()) 

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 4 # DON'T CHANGE

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
# Problem 1
###############################################################################


# There will be times that you want to mark or remove outliers from your data.
# One simple method of this is to consider all values less than or greater
# than n standard deviations from the mean as outliers.

v <- c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)

mean(v) + 2*sd(v)
mean(v) - 2*sd(v)

# Write a function, nSds, that, given a vector of numerics and n, returns 
# values at n standard deviations plus/minus the mean, such that

nSds(v, 2)

# would return a vector with two elements
# [1] -717.4225 1941.2686

nSds <- function(x, n){
    # FILL IN
}

nSds <- function(x, n){
    c(mean(x) - n*sd(x), mean(x) + n*sd(x))
}

(psyc7765.test.1.1 <- function(){
    v <- c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
    all(
        length(nSds(v, 2)) == 2,
        round(nSds(v, 2)[1], 2) == -717.42,
        round(nSds(v, 5)[1], 2) == -2711.44
    )
})() # Should return TRUE

psyc7765.1.minutes <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 2
###############################################################################

# Create a function, isOutlier, that uses the function you wrote above to take 
# a vector of numerics and n and return a vector logicals as to whether the 
# values is to be considered an outlier.  Remember: outliers can exist on
# either side of the mean.

isOutlier <- function(x, n){
    sds <- nSds(x, n)
    # FILL IN
}

isOutlier <- function(x, n){
    sds <- nSds(x, n)
    sd_lower <- sds[1]
    sd_upper <- sds[2]
    x < sd_lower | x > sd_upper
}

# Example:

isOutlier(v, 2)

# should return

# [1] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
#[12] FALSE FALSE

(psyc7765.test.2.1 <- function(){
    v <- c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
    v1 <- c(100000, 2, 1, 1, 1)
    v2 <- c(1, 2, 1, 1, 1, -100000)
    all(
        all(isOutlier(v, 2) == c(F, F, F, F, F, T, F, F, F, T, F, F, F)),
        all(isOutlier(v1, 1) == c(T, F, F, F, F)),
        all(isOutlier(v2, 1) == c(F, F, F, F, F, T))
    )
})() # Should return TRUE

psyc7765.2.minutes <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 3
###############################################################################

# Use paste to write a function, outlierText, that accepts the same 2 arguments
# as isOutlier, but returns a string in the following form:

# "Reaction times were colleced from 13 participants. 2 outliers were detected 
# with reaction times at least 2 standard deviations from the mean."

outlierText <- function(x, n){
    txt <- paste(FILL IN)
    return(txt)
}

outlierText <- function(x, n){
    results <- paste(
        'Reaction times were colleced from', length(x), 
        'participants.', sum(isOutlier(x, n)), 'outliers were detected with',
        'reaction times at least', n, 'standard deviations from the mean.', 
        sep=" ")
    return(results)
}

# Example:

dat <- data.frame(
    subject=1:13,
    rt=c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
)

with(dat, outlierText(rt, 2))

# should return:

# "Reaction times were colleced from 13 participants. 2 outliers were detected 
# with reaction times at least 2 standard deviations from the mean."

(psyc7765.test.3.1 <- function(){
    v <- c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
    v1 <- c(100000, 2, 1, 1, 1)
    all(
        outlierText(v, 3) == "Reaction times were colleced from 13 participants. 0 outliers were detected with reaction times at least 3 standard deviations from the mean.",
        outlierText(v1, 1) == "Reaction times were colleced from 5 participants. 1 outliers were detected with reaction times at least 1 standard deviations from the mean."
    )
})() # Should return TRUE

psyc7765.3.minutes <- 0 # Enter the number of minutes you spent on this problem

###############################################################################
# Problem 4
###############################################################################

# Use paste to write another function, subjectText, accepting the same 2 
# arguments as above,except x is a data frame with a 'subject' and 'rt' column,
# like dat:

dat <- data.frame(
    subject=1:13,
    rt=c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
)

# The output should print reaction times for only those subjects whose values 
# are not considered outliers by isOutlier(x$rt, n).

subjectText <- function(x, n){
    txt <- with(x[FILL IN,]),
        paste('USE', 4, 'objects here', 'and no more',
            sep="FILL IN", collapse="FILL IN")
    )
    return(txt)
}

subjectText <- function(x, n){
    with(x[!isOutlier(x$rt, n),], 
        paste('Subject', subject, 'had a score of', rt, 
            sep=" ", collapse=". ")
    )
}

# Example:

subjectText(dat, 2)

# should print:

# [1] "Subject 1 had a score of 345. Subject 2 had a score of 239. Subject 3 
# had a score of 463. Subject 4 had a score of 382. Subject 5 had a score of 
# 475. Subject 7 had a score of 213. Subject 8 had a score of 324. Subject 9 
# had a score of 314. Subject 11 had a score of 339. Subject 12 had a score 
# of 420. Subject 13 had a score of 250"

(psyc7765.test.4.1 <- function(){
    dat <- data.frame(
        subject=1:13,
        rt=c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)
    )
    dat2 <- data.frame(subject=1:5, rt=c(100000, 2, 1, 1, 1))
    all(
        subjectText(dat, 2) == "Subject 1 had a score of 345. Subject 2 had a score of 239. Subject 3 had a score of 463. Subject 4 had a score of 382. Subject 5 had a score of 475. Subject 7 had a score of 213. Subject 8 had a score of 324. Subject 9 had a score of 314. Subject 11 had a score of 339. Subject 12 had a score of 420. Subject 13 had a score of 250",
        subjectText(dat2, 1) == "Subject 2 had a score of 2. Subject 3 had a score of 1. Subject 4 had a score of 1. Subject 5 had a score of 1"
    )
})() # Should return TRUE

psyc7765.4.minutes <- 0 # Enter the number of minutes you spent on this problem

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