###############################################################################
# Title: PSYC 7765 - Lesson 14 - Graphs
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Tue Nov 29 01:18:32 2011 - Created the file - JRS
###############################################################################

require(plyr)
# setwd('~/Projects/funstats2011/Lesson14')
source('__ReadData.R')

###############################################################################
# Rename main data file from __ReadData.R
###############################################################################

dat <- dat_wide_w_covs

###############################################################################
# Make dat tall for plotting purposes
###############################################################################

names(dat) <- gsub('^depression([0-9])$', 'score.d\\1', names(dat))
     
dat_tall <- reshape(dat, 
     idvar="subject", 
     timevar="question", 
     varying=3:5, 
     direction="long"
)
row.names(dat_tall) <- NULL

###############################################################################
# Jittered Scatter Plot
###############################################################################

p <- qplot(question, score, colour=as.factor(subject), data=dat_tall, position=position_jitter(w=0, h=0.1))
ggsave(p, file='Graphs/scatter.pdf')

###############################################################################
# Bar Plot
###############################################################################

p <- qplot(question, score, geom="bar", stat="summary", fun.y="mean", data=dat_tall)
ggsave(p, file='Graphs/scatter.pdf')
