###############################################################################
# Title: PSYC 7765 - Lesson 06
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep 30 10:41:41 2011 - Created the file - JRS
###############################################################################

###############################################################################
# Your Questions
###############################################################################

# What is the relationship for blacks (race), depending on whether they identify as 
# politically liberal or conservative (polview), between favor preference in hiring blacks 
# (affrmact) and if they feel discriminated because of race (wkracism)?

# For mothers compared to women without children, what is the relationship 
# between support of abortion for any woman who wants for any reason (abany) and 
# whether or not they used a condom the last time (condom)?

# What is the relationship between the MOST important aspect of job for
# respondents (jobinc, jobsec, jobhour, jobpromo, jobmeans) and their
# educational levels (degree)?

# What is the relationship between the age of the respondent 
# when their first child is born (agekdbrn) and education level (degree)
# in males and females?

# For people who had sex in the past year (sexfreq), is the number of nights per week
# spent in a bar (socbar) related to whether or not a condom was used during the
# most recent sexual encounter (condom)? Compare males and females (sex).

###############################################################################
# Factor Workflow
###############################################################################

str(dat_iris)

dat_raw <- read.csv('iris.csv', stringsAsFactors=F)
str(dat_raw)

dat <- within(dat_raw, {
     SpeciesF <- as.factor("Species")
     SpeciesF <- relevel(SpeciesF, 'versicolor')
})

# Compare the following

str(dat)
str(dat_raw)
str(dat_iris)

###############################################################################
# Exploring Functions
###############################################################################

a <- 3
b <- 4
d <- 5
e <- 6

# These are the variables and functions that are in your global environment:

ls()

# Please note that "functionVariable1" or "functionVariable2" are not in that 
# vector.

myFunction <- function(){
    functionVariable1 <- "I'm so lonely."
    functionVariable2 <- 'Me too!'
    return(ls())
}

# I'm using the return function to return the results of ls(). If I just call 
# myFunction:

myFunction()

# It returns the value of ls() to the screen:
# [1] "functionVariable1" "functionVariable2"

# Why aren't these the same:

ls()
myFunction()

# Why does the following work:

anotherVariable <- 'Marco'

anotherFunction <- function(){
    temp <- paste(anotherVariable, 'Polo')
    return(temp)
}
anotherFunction()

# But this doesn't:

anotherFunction2 <- function(){
    foo <- 'Can you see me?'
}

anotherFunction2() # As an aside, why doesn't this return anything?
foo

# Changing variables?

anotherVariable <- 'Marco'
anotherFunction3 <- function(){
    anotherVariable <- 'Polo'
    return(anotherVariable)
}
anotherFunction3()
anotherVariable

# Still Marco, right? The only way I could change it in the global environment
# is by doing this:

anotherVariable <- anotherFunction3()
anotherVariable

# For the sake of completeness, you can also use `<<-` as the gets operator inside
# of the function, but you should REALLY, REALLY, REALLY try not to.  It's better
# to reset the variable to be what is returned by your function as done above.

# Let's go back to this:

anotherVariable <- 'Marco'

anotherFunction <- function(){
    temp <- paste(anotherVariable, 'Polo')
    return(temp)
}
anotherFunction()

# This function appends 'Polo' to anotherVariable, but let's say, I have another name
# I want to append it to:

yetAnotherVariable <- 'Ralph'

# This is why we use functions with arguments--they make code reusable.

aBetterFunction <- function(x){
    temp <- paste(x, 'Polo')
    return(temp)
}

aBetterFunction(anotherVariable)
aBetterFunction(yetAnotherVariable)

# One other thing: a short hand notation for functions is to leave out the return().
# Then the object returned is whatever the last object in the function is.
# For example:

aConciseFunction <- function(x){
     paste(x, 'Polo')
}

aConciseFunction(anotherVariable)
aConciseFunction(yetAnotherVariable)

# This also works

aConciseFunction1 <- function(x){
    temp <- paste(x, 'Polo')
    temp
}

aConciseFunction1(anotherVariable)
aConciseFunction1(yetAnotherVariable)

# As well as this

aConciseFunction2 <- function(x){
     (temp <- paste(x, 'Polo'))
}

aConciseFunction2(anotherVariable)
aConciseFunction2(yetAnotherVariable)

###############################################################################
# Generics
###############################################################################

plot(lm(Sepal.Width ~ Sepal.Length, data=iris))
plot(with(iris, table(Species, cut(Sepal.Length, quantile(Sepal.Length)))))

###############################################################################
# The Ellipsis Argument
###############################################################################

tester <- function(x, ...){
    args <- list(...)
    c(args$one, args[1])
}

tester(4, 5, 6, one=7)

###############################################################################
# Functions as first-class citizens
# More: http://en.wikipedia.org/wiki/First-class_object
###############################################################################

fn1 <- function(x){
    paste(x, 'Polo')
}

fn2 <- function(x, y){
    x(y)
}

fn2(fn1, 'Marco')

# Something slightly more useful

victor <- c(1,2,3,NA,4,5)

mean(victor)
var(victor)
sd(victor)

calculateWithoutNAs <- function(x, fn){
    fn(x, na.rm=T)
}

calculateWithoutNAs(victor, mean)
calculateWithoutNAs(victor, var)
calculateWithoutNAs(victor, sd)