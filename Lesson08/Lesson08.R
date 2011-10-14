###############################################################################
# Title: PSYC 7765 - Lesson 08
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Thu Oct 13 10:20:03 2011 - Created the file - JRS
###############################################################################

rm(list=ls()) 
#setwd("~/Projects/funstats2011/Lesson08")

###############################################################################
# Remember this?
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

calculateWithoutNAs <- function(x, fn){
    fn(as.vector(na.exclude(x)))
}

calculateWithoutNAs(victor, mean)
calculateWithoutNAs(victor, var)
calculateWithoutNAs(victor, sd)

###############################################################################
# How about this?
###############################################################################

data(iris)
tapply(iris$Petal.Width, iris$Species, mean, na.rm=TRUE)

###############################################################################
#  Let's examine by()
###############################################################################

by(iris, iris$Species, function(x){
     is.data.frame(x)
})

levels(iris$Species)

list(
	'setosa'=is.data.frame(iris[iris$Species=='setosa',]),
	'versicolor'=is.data.frame(iris[iris$Species=='versicolor',]),
	'virginica'=is.data.frame(iris[iris$Species=='virginica',])
)

by(iris, iris$Species, head)

face <- function(x){
	head(x)
}

by(iris, iris$Species, face)

by(iris, iris$Species, function(x){
	head(x)
})

by(iris, iris$Species, head, n=3)

by(iris, iris$Species, face, n=3) # Make this work using the ellipsis below

face <- function(x){ # Edit me!
     head(x)
}

by(iris, iris$Species, function(x){
	head(x, n=3)
})

# How can we turn this into a data.frame?  rbind

rbind(by(iris, iris$Species, head))
do.call(rbind, by(iris, iris$Species, head))
is.data.frame(do.call(rbind, by(iris, iris$Species, head)))

###############################################################################
#  Let's subtract the means by group for Sepal Length and Sepal Width
###############################################################################
#               Sepal.Length                   Sepal.Width
# 1   5.1-mean(Sepal.Length)         3.5-mean(Sepal.Width)
# 2   4.9-mean(Sepal.Length)         3.0-mean(Sepal.Width)
# ...
#     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
# 1            5.1         3.5          1.4         0.2     setosa
# 51           7.0         3.2          4.7         1.4 versicolor
# 101          6.3         3.3          6.0         2.5  virginica

tapply(iris$Sepal.Length, iris$Species, mean, na.rm=TRUE)
tapply(iris$Sepal.Width, iris$Species, mean, na.rm=TRUE)

dat <- do.call(rbind, by(iris, iris$Species, function(x){
	FILL IN # SLCentered, SWCentered
}))

dat[c(1,51,101),]

tapply(iris$Sepal.Length, iris$Species, mean, na.rm=TRUE)
tapply(iris$Sepal.Width, iris$Species, mean, na.rm=TRUE)

# Can we use scale?

###############################################################################
# Let's look at something slightly more interesting
# Data aggregated by Hadley Wickham from the Social Security Administration
###############################################################################

dat <- read.csv('bnames.csv', stringsAsFactors=FALSE)
dim(dat)
head(dat)

# What does the following code do?

tDat <- subset(dat, year >= 1980)
byPercents <- do.call(rbind, by(tDat, tDat$name, function(x){
	do.call(rbind, by(x, x$sex, function(y){
		data.frame(name=unique(y$name), sex=unique(y$sex), avg=mean(y$percent))
	}))
}))

# And the following?

row.names(byPercents) <- c()
byPercents <- byPercents[order(byPercents$avg, decreasing=TRUE),]

head(byPercents);tail(byPercents)

# Why use the inner by for sex?

length(byPercents)
length(unique(byPercents))
subset(byPercents, duplicated(byPercents$name))
subset(byPercents, name=="Jasmine")

###############################################################################
# Let's install Plyr by Hadley Wickham
###############################################################################

#install.packages("plyr")
require(plyr)

tDat <- subset(dat, year >= 1980)
ddPercents <- ddply(tDat, c('name', 'sex'), function(x){
	data.frame(name=unique(x$name), sex=unique(x$sex), avg=mean(x$percent))
})
ddPercents <- ddPercents[order(ddPercents$avg, decreasing=TRUE),]
head(ddPercents);tail(ddPercents)

# In fewer lines?

ddsPercents <- ddply(tDat, c('name', 'sex'), summarise, avg=mean(percent))
ddsPercents <- ddsPercents[order(ddsPercents$avg, decreasing=TRUE),]
head(ddPercents);tail(ddPercents)

###############################################################################
# Remember when we removed group level means from iris?  Let's Plyr that.
###############################################################################

ddply(iris, c('Species'), summarise, SLCentered=Sepal.Length-mean(Sepal.Length), SWCentered=Sepal.Width - mean(Sepal.Width))

# Or:

ddply(iris, c('Species'), summarise, SLCentered=scale(Sepal.Length, scale=F), SWCentered=scale(Sepal.Width, scale=F))
 
# How does transform differ?

ddply(iris, c('Species'), transform, SLCentered=scale(Sepal.Length, scale=F), SWCentered=scale(Sepal.Width, scale=F))

# Plyr Basics    
#                                 OUTPUT 
#       INPUT   \ array | data frame |  list | discarded 
#   ------------|---------------------------------------
#   array       | aaply |      adply | alply |     a_ply 
#   data frame  | daply |      ddply | dlply |     d_ply
#   list        | laply |      ldply | llply |     l_lpy

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

###############################################################################
# And for fun....
###############################################################################

install.packages('ggplot2')
require(ggplot2)

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

qplot(year, percent, geom="line", colour=name, data=subset(dat, mSelect)) # + geom_text(aes(angle=90, label=name, size=2))
qplot(year, percent, geom="line", colour=name, lw=2, data=subset(dat, fSelect))
