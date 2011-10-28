###############################################################################
# Title: PSYC 7765 - Lesson 09
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Oct 21 09:01:32 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 
#setwd("~/Projects/funstats2011/Lesson09")
require(plyr)
require(ggplot2)

###############################################################################
# Read Data
###############################################################################

dat <- read.csv('bnames.csv', stringsAsFactors=FALSE)

###############################################################################
# Presidential
###############################################################################

qplot(year, percent, geom="line", data=dat[dat$name=='Theodore',])
qplot(year, percent, geom="line", data=dat[dat$name=='Richard',])

###############################################################################
# Saving images
###############################################################################

mSelect <- with(dat, (
            name=='Brandon'
          | name=='Jordan'
		| name=='Alexander'
          | name=='Alex'
		| name=='David'
          | name=='Daniel'
	) & sex=='boy')

fSelect <- with(dat, (	  
            name=='Bernadette'
		| name=='Blair'
		| name=='Kelly'
		| name=='Karen'
		| name=='Lucy'
		| name=='Caitlin'
		| name=='Erin'
		| name=='Lindsay'
		| name=='Marlen'
		| name=='Rebecca'
	) & sex=='girl')

tSelect <- FILL IN # Select both males and females

# Three ways of saving your graph
qplot(year, percent, geom="line", colour=name, data=dat[tSelect,])
ggsave('plot1.pdf')

p <- qplot(year, percent, geom="point", colour=name, data=subset(dat, tSelect))
ggsave('plot2.png', plot=p)

p <- qplot(year, percent, geom="smooth", colour=name, data=subset(dat, mSelect))
pdf(file='plot3.pdf')
print(p)
dev.off()

###############################################################################
# Advanced Selections
###############################################################################

# What does this do?

c(1,2,3,4,5,6,7,8,9) %in% c(1, 2)

# Apply to the names dataset

mSelect <- with(dat, 
     # FILL IN
     & sex=='boy'
)

unique(dat$name[grep("A", dat$name)])
unique(dat$name[grep("^A.*a$", dat$name)])
unique(dat$name[grep(".*(ie|ey)$", dat$name)])

# Plot the last grep above
qplot(year, percent, data=FILL IN, geom="line", stat="summary", fun.y="sum", colour=sex)

# Do the same with grepl
qplot(year, percent, data=FILL IN, geom="line", stat="summary", fun.y="sum", colour=sex)

###############################################################################
# apply, lapply, sapply
###############################################################################

# What is this?
apply(iris[,1:4], 2, mean, na.rm=T)

# How about this?
apply(iris[,1:4], 1, mean, na.rm=T)

# And this? What type of data is this?
apply(iris[,1:4], c(1,2), mean, na.rm=T)

# How about lapply? sapply?