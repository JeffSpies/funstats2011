###############################################################################
# Title: PSYC 7765 - Lesson 02
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  2 11:16:57 2011 - Created the file - JRS
###############################################################################

# Abilites needed to sort a list of numbers in our heads
# ------------------------------------------------------
# - Input (e.g. eyes)
# - Data types (what are numbers?)
# - Arithmetic (what can I do with numbers?)
# - Memory (how do I store numbers)
# - Comparisons (how do I compare two numbers?)
# - Conditional execution (if this then do that)
# - Repetition (repetition)
# - Output (e.g. verbal abilities)

###############################################################################
# Variables and Memory
###############################################################################

#   ---------------------------------------------
#  |     a        |     b        |              |
#  ---------------------------------------------
# |      8      |       9       |              |
# ---------------------------------------------

a <- 8
b <- 9

###############################################################################
# Variables: What's in a name?
###############################################################################

myVariableName <- 3
myVariableName

(my_variable_name <- 3)

my variable name <- 3

"my variable name" <- 3
"my variable name"
`my variable name` # Never use spaces in variables

# Variable names can contain
# - Letters
# - Digits
# - Periods
# - Underscores
# Cannot start with
# - Digit
# - Underscore
# - Period followed by a digit

variable3 <- 4 + myVariableName

Fred <- 8

fred <- 8

Fred == fred

fred <- 9

Fred == fred

###############################################################################
# Variable Exercise
###############################################################################

a <- 3

a

b <- 4*a

b

a <- 5

a

# Now what is b?
b 

b <- 4*a
# Now what is b?

###############################################################################
# The Environment
###############################################################################

ls()

?rm

rm(list=ls())

ls()

a <- 3
b <- 2

ls()

###############################################################################
# Advanced assignment
###############################################################################

a <- (b <- 8)
a
b

a <- (b <- 8) + 8
a
b

# You can do this, but don't
9 -> a
a

'<-'('a', 11)
a

# or

assign('a', 3)

###############################################################################
# Functions: arguments and defaults
###############################################################################

myMean <- function(x, y, divideBy=2){
    (x + y)/divideBy
}
myMean

myMean(10, 20)

myMean(10, 20, 2)

myMean(10, 20, divideBy=2)

myMean(10, 20, divideBy=3)

myMean <- function(x, y, divideBy=2){
    return((x + y)/divideBy)
}

myMean(10, 20)

myMean <- function(x, y, divideBy=2){
    answer <- (x + y)/divideBy
}

myMean(10, 20)

myMean <- function(x, y, divideBy=2){
    answer <- (x + y)/divideBy
    answer
}

myMean(10, 20)

myMean <- function(x, y, divideBy=2){
    answer <- (x + y)/divideBy
    return(answer)
}

myMean(10, 20)

###############################################################################
# Anatomy of a help page and function
###############################################################################

?paste

# "Usage" shows the arguments to the function and their defaults
# For example, paste's argument "sep" is " " (a space) by default
# Thus, if you didn't type sep=" ", the default separator would still be a 
#   space

# It's first argument is "...".  What does that mean?

# "Arguments" lists, among other things, what type of data is expected for 
#    each argument and what the argument does
# "Value" is the type of data that is returned by the function

paste(1, 2, 3)
paste(1, 2, 3, sep="")

paste("hello", "world")
paste("hello", "world", sep=", ")

# Remember this function?
assign('despression', 3)
assign(paste('depression_time_', 1, sep=""), 3)

###############################################################################
# Pass By What?
###############################################################################

myFunction <- function(x,y){
    x <- 2
    y <- 3
    x
}
a <- 5
b <- 10
myFunction(a, b)

# What is a: 5 or 2? 
a

# What if I use the same variable names as the arguments?
x <- 5
y <- 10
myFunction(x, y)

# What are x and y now?

###############################################################################
# Data Types
###############################################################################

# What types of data do we know about so far?

###############################################################################
# Vectors
###############################################################################

(a <- c(5,6,7,8,9,10,11,12,13,14))

(a <- seq(5, 14))

(a <- c(5:14))

(a <- 5:14)

is.vector(a)
is.logical(a)
is.numeric(a)

a[5]

a[1:5]

a[1, 3, 5, 7]

###############################################################################
# Functions with vectors: like your homework
###############################################################################

sum(a)
length(a)

myMean2 <- function(numbers){

}

myMean2(c(11, 20, 2)) == 11 # This should return TRUE, if not, you're wrong

myMean3 <- function(...){
    numbers <- c(...)
    numbers
}

myMean3(11, 20, 2) == 11 # This should return TRUE, if not, you're wrong

# What are the differences in input style here?

?mean
?sum

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