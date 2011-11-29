###############################################################################
# Title: PSYC 7765 - Lesson 13 - Homework
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Tue Nov 29 01:18:32 2011 - Created the file - JRS
###############################################################################

# Go through the last part of Lesson 13 (conditionals)

rm(list=ls())

# setwd('~/Projects/funstats2011/Lesson13')

require(plyr)

# Read in the subject files, each containing a depression inventory of 
# three questions per subject.

allSubjects <- (myFolder<-dir())[grep('subject[0-9]+\\.csv', myFolder)] # FILL IN

combineDatasets <- function(fileName){                          # FILL IN
     dataset <- read.csv(fileName, stringsAsFactors=F)          # FILL IN
     subject <- gsub('subject([0-9]+)\\.csv', '\\1', fileName)  # FILL IN
     dataset$subject <- as.numeric(subject)                     # FILL IN
     return(dataset)                                            # FILL IN
}
dat_raw <- ldply(allSubjects, combineDatasets)                  # FILL IN
dat_clean <- within(dat_raw,{                                   # FILL IN
     isMale <- grepl('^[m|M].*$', sex)                          # FILL IN
     isFemale <- grepl('^[f|F].*$', sex)                        # FILL IN
     sexFactor <- as.factor(ifelse(isMale, 'male', 'female'))   # FILL IN
     sexFactor <- relevel(sexFactor, ref="female")              # Don't explain yet
})

# Explore xor to see what it does in the following tests
xor(T, T)
xor(F, F)
xor(T, F)
xor(F, T)

# Tests
nrow(dat_clean) == 3                                           # FILL IN
ncol(dat_clean) == 7                                           # FILL IN
sum(with(dat_clean, xor(isMale, isFemale))) == nrow(dat_clean) # FILL IN

dat_wide <- dat_clean  # FILL IN
rm(dat_clean, dat_raw) # FILL IN

# Turn dat_wide into something that looks as follows in the console:
# > dat
#      sex subject isFemale isMale question score
# 1 female       1     TRUE  FALSE       d1     5
# 2   male       2    FALSE   TRUE       d1     3
# 3      M       3    FALSE   TRUE       d1     1
# 4 female       1     TRUE  FALSE       d2     7
# 5   male       2    FALSE   TRUE       d2     3
# 6      M       3    FALSE   TRUE       d2     1
# 7 female       1     TRUE  FALSE       d3     6
# 8   male       2    FALSE   TRUE       d3     2
# 9      M       3    FALSE   TRUE       d3     3
     
names(dat_wide)
names(dat_wide) <- gsub('^depression([0-9])$', 'score.d\\1', names(dat_wide))
     
dat <- reshape(dat_wide, 
     FILL IN
)
row.names(dat) <- FILL IN

qplot(question, score, colour=subject, data=dat) # Something is wrong...

# There are only 3 subjects, but 5 dots in the subject key: 1.0, 1.5, 2.0, 2.5, 
# 3.0. There should only be 3. What is wrong with this? Think about data types and 
# fix below (you can add another line of code if need be):

qplot(question, score, colour=FILL IN, data=dat)

# You may note that for d1 and d3 there are only 2 scores, where there should be 2.
# This is because points are sitting atop one another. Try the following:

qplot(question, score, geom="jitter", colour=as.factor(subject), data=dat)
# or
qplot(question, score, colour=as.factor(subject), data=dat, position=position_jitter(w=0, h=0.1))

# Now for a simple regression predicting depression inventory score 1 from our
# dummy-coded, sex:

lm(score.d1 ~ isMale, data=dat_wide)

# To find the predicted score for females, isMale is FALSE or 0, so the equation is:
#      score.d1 = 5 + 0*-2 
# Thus, only the intercept goes into prediction of score.d1, and we see an 
# intercept value equal to the mean of the females' score.d1 (what we would predict
# females' scores to be in this scenario):

mean(subset(dat_wide, sex=='female')$score.d1)

# To find the predicted score for males, isMale is TRUE or 1, and the equation is:
#      score.d1 = 5 + 1*-2
# Our best prediction for males' score.d1 is then 3, which is what we see in our data:

mean(subset(dat_wide, sex=='male')$score.d1)

# Meaning that being male, in our sample, reduces depression by 2 points.

# Now observe what happens when we use an opposite coding for sex, isFemale:

lm(score.d1 ~ isFemale, data=dat_wide)

# Our intercept now represent's the score predicted for males, and the isFemale
# coefficient tell us that being female increases depression by 2 points (or 
# being male reduces depression by 2 points, as we saw above).

# I like to use logicals whenever possible, so I can name them in a manner that
# tells me what my reference level is.  But you could use a factor representing
# sex. Remember what we defined the reference level for sexFactor to be ("female"):

lm(score.d1 ~ sexFactor, data=dat_wide)

# Behaves like isMale. Let's relevel:

dat_wide$sexFactor <- relevel(dat_wide$sexFactor, ref="male")
lm(score.d1 ~ sexFactor, data=dat_wide)

# And this one behaves like isFemale.  Please explain what relevel is doing:

# FILL IN

# Bonus: summarizing over subject, create a bar chart a la
#     http://had.co.nz/ggplot2/geom_bar.html

qplot(question, score, FILL IN, data=dat)
