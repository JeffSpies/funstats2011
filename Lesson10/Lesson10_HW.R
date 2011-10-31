###############################################################################
# Title: PSYC 7765 - Lesson 10 - Homework
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Sun Oct 30 16:51:24 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls())

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 10 # DON'T CHANGE

###############################################################################
# CHANGE THIS
###############################################################################

psyc7765.name <- 'Type your name here'
psyc7765.id <- 'Type your computing id here' # (e.g. 'js6ew')

###############################################################################
# Problem 1: Courtesy of Caitlin
###############################################################################

dat <- data.frame(
  subject=1:10,
  averagestudentscore.pre=rnorm(10), 
  averagestudentscore.mid=rnorm(10), 
  averagestudentscore.post=rnorm(10),
  class.size=rnorm(10), 
  years.experience=rnorm(10),
  class=c('RegularEd', 'Inclusion'), 
  stringsAsFactors=F
)

# Caitlin created a dataframe consisting of three scores: pre-semester,
# mid-semester, and post-semester.  She wants to calculate thre new scores:
# differencescore.pre.mid, differencescore.mid.post, differencescore.pre.post
# which is the difference between scores as the names suggest.

# Create a new dataframe with those new scores for each subject using ddply in
# three different ways; the results should look identical.

ddply(SOMETHING, SOMETHING, transform, SOMETHING)

# Using your own embedded function:

ddply(SOMETHING, SOMETHING, function(x){
    SOMETHING 
})

# Then do the same for each class (mean difference scores) in two different ways:

ddply(SOMETHING, SOMETHING, summarise, SOMETHING)

ddply(SOMETHING, SOMETHING, transform, SOMETHING)

# These results should NOT be identical.

psyc7765.1.minutes <- NA

###############################################################################
# Problem 2
###############################################################################

# In class, I used expand.grid to create data for an example:

spoons <- expand.grid(
     Trial=1:25,
     Session=1:2,
     Subject=1:30
)
spoons <- spoons[,rev(names(spoons))]

# The first column of many datasets is the Subject variable, but in this case,
# it is the last.  That's why I reversed the column order.  I could have simply
# started with the following call to end up with the columns in the right 
# order:

spoons2 <- expand.grid(
     Subject=1:25,
     Session=1:2,
     Trial=1:30
)

# Why did I choose the former method and what is the difference?

# ANSWER

# Would it matter from a ddply standpoint which method I used? Why or Why not?

# ANSWER

psyc7765.2.minutes <- NA