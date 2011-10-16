###############################################################################
# Title: PSYC 7765 - Lesson 08 - Homework - Answers
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Sep  14 16:18:01 2011 - Created the file - JRS
###############################################################################

# We'll start off by removing previously created objects from the environment
rm(list=ls()) 

###############################################################################
# DO NOT CHANGE THIS
###############################################################################

psyc7765.lesson <- 8 # DON'T CHANGE

###############################################################################
# CHANGE THIS
###############################################################################

psyc7765.name <- 'Type your name here'
psyc7765.id <- 'Type your computing id here' # (e.g. 'js6ew')

###############################################################################
# Problem 1
###############################################################################

# In class, we often use the dataset 'iris', using the command data(iris).
# There are seven datasets under "state": state.abb, state.area, state.center,
# state.division, state.name, state.region, or state.x77. 

?state

# What does the following code do?

data(state)
x77 <- data.frame(state.x77)
x77$State <- row.names(x77)
row.names(x77) <- c()
x77$Region <- state.region

# Answer here

psyc7765.1.minutes <- NA

###############################################################################
# Problem 2
###############################################################################

# Use the appropriate *ply function from plyr to generate a data frame 
# containing the means and standard deviations of state Area by Region:

#          Region  AreaMean    AreaSD
# 1     Northeast  18141.00  18075.69
# 2         South  54605.12  57965.27
# 3 North Central  62652.00  14967.02
# 4          West 134463.00 134981.73

require(plyr)

ddply(FILL IN)

psyc7765.2.minutes <- NA

###############################################################################
# Problem 3
###############################################################################

# The following is an approximation of the total number of murders per state in
# total.  You can check it's accuracy on wolframalpha.com by searching for 
# murders in alabama in 1976.

x77$MurdersTotal <- x77$Population * .01 * x77$Murder

# Sort the x77 data frame by Murders (MurdersTotal) per square mile (Area) and
# call the resulting dataframe x77sorted.

x77sorted <- FILL IN

psyc7765.3.minutes <- NA

###############################################################################
# Problem 4
###############################################################################

# Using the appropriate function from plyr, add a column to x77, called 
# MurdersPerSqMile representing the mean number of murders per square mile by 
# region. The following is a head of the resulting dataframe:

#   Population Income Illiteracy Life.Exp Murder HS.Grad Frost  Area         State
# 1       3100   5348        1.1    72.48    3.1    56.0   139  4862   Connecticut
# 2       1058   3694        0.7    70.39    2.7    54.7   161 30920         Maine
# 3       5814   4755        1.1    71.83    3.3    58.5   103  7826 Massachusetts
# 4        812   4281        0.7    71.23    3.3    57.6   174  9027 New Hampshire
# 5       7333   5237        1.1    70.93    5.2    52.5   115  7521    New Jersey
# 6      18076   4903        1.4    70.55   10.9    52.7    82 47831      New York
#      Region MurdersTotal MurdersPerArea MurdersPerSqMile
# 1 Northeast       96.100    0.019765529       0.02002858
# 2 Northeast       28.566    0.000923868       0.02002858
# 3 Northeast      191.862    0.024515972       0.02002858
# 4 Northeast       26.796    0.002968428       0.02002858
# 5 Northeast      381.316    0.050700173       0.02002858
# 6 Northeast     1970.284    0.041192616       0.02002858

ddply(FILL IN)

psyc7765.4.minutes <- NA

###############################################################################
# Problem 5
###############################################################################

# In the very last section of Lesson08.R, you have code to plot the percentage 
# of the population that has a given name over time for most of our first names.
# As you can tell by the trends, it seems that once a name gets to a certain 
# level of popularity, it begins decreasing.  And some names aren't popular 
# enough to make the top 1000 until certain points in history, while others 
# disappear from popularity at certain points.  Some aren't ever popular enough
# to make the top 1000.

# Last year when I taught this class, something caught my eye related to the
# the name of one of the students: Calvin. Create a plot similar to the one in
# class for just HIS name.

# setwd()
library(ggplot2)
dat <- read.csv('bnames.csv', stringsAsFactors=FALSE)
qplot(FILL IN)

psyc7765.5.minutes <- NA

###############################################################################
# Problem 6
###############################################################################

# If we look at Calvin's trend more closely, there is a spike in the 1920s. 
# There are also smaller spikes in the 1950s and then again--even smaller--in
# the 1980s.  In a comment below, hypothesize why we'd see these spikes:

# 1920s:
#
# 1950s:
#
# 1980s:
#

psyc7765.6.minutes <- NA