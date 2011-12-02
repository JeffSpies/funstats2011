###############################################################################
# Title: PSYC 7765 - Lesson 14 - Analyses
# Description: Graphs for such and such presentation
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Tue Nov 29 01:18:32 2011 - Created the file - JRS
###############################################################################

# setwd('~/Projects/funstats2011/Lesson14')
source('__ReadData.R')

###############################################################################
# Rename main data file from __ReadData.R
###############################################################################

dat <- dat_wide_w_covs

###############################################################################
# Some regressions
###############################################################################

lr1 <- lm(depression1 ~ isMale, data=dat)
lr2 <- lm(depression1 ~ isFemale, data=dat)

write.table(summary(lr1)$coefficients, sep="\t", row.names=F, file="Table1.txt")
