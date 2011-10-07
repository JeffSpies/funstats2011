###############################################################################
# Title: PSYC 7765 - Lesson 07
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Oct  7 11:30:27 2011 - Created the file - JRS
###############################################################################

# Review!

###############################################################################
# Relevel
###############################################################################

dat_raw <- read.csv('iris.csv', stringsAsFactors=F)
str(dat_raw)

dat <- within(dat_raw, {
     SpeciesF <- as.factor(Species)
     
     levels(SpeciesF) <- c('setosa', 'versicolor', 'virginica') 
     # ^ if I'm not sure all my levels are represented
     
     SpeciesF <- relevel(SpeciesF, 'versicolor')
})

# Compare the following

str(dat)
str(dat_raw)
str(dat_iris)

mydat_raw <- data.frame(happy=rnorm(100), sex=c('M', 'F'), stringsAsFactors=F)
mydat_raw$sex[1] <- "z"

mydat <- within(mydat_raw, {
     sexFactor <- as.factor(sex)
     levels(sexFactor) <- c('M', 'F')
     sexFactor <- relevel(sexFactor, 'M')
})

mydat_raw <- data.frame(happy=rnorm(100), sex=c('M', 'F'), stringsAsFactors=F)
mydat <- within(mydat_raw, {
     sexFactor <- as.factor(sex)
     levels(sexFactor) <- c('M', 'F')
     sexFactor <- relevel(sexFactor, 'M')
})

(model <- lm(happy ~ sexFactor, data=mydat))
coef(model)[1]
sum(coef(model))

with(mydat_raw, tapply(happy, sex, mean, na.rm=T))

# Now let's relevel:

mydat$sexFactor <- relevel(mydat$sexFactor, 'F')

(model <- lm(happy ~ sexFactor, data=mydat))
coef(model)[1]
sum(coef(model))

###############################################################################
# Exploring code
###############################################################################

v <- c(345, 239, 463, 382, 475, 1990, 213, 324, 314, 2201, 339, 420, 250)

nSds <- function(x, n){
    c(mean(x) - n*sd(x), mean(x) + n*sd(x))
}

isOutlier <- function(x, n){
    sds <- nSds(x, n)
    sd_lower <- sds[1]
    sd_upper <- sds[2]
    x < sd_lower | x > sd_upper
}

###############################################################################
# Another look at ellipses
###############################################################################

tester <- function(x, ...){
    args <- list(...)
    c(args$one, args[1])
}

tester(4, 5, 6, one=7)

###############################################################################
# Benchmarking: ellipses and passing functions
###############################################################################

benchmark <- function(..., n=1, averages=T){
     fns <- c(...)
	ordr <- rep(1:length(fns), each=n)
	ordr <- sample(ordr, length(ordr))
	sums <- rep(0, length(fns))
	for(i in ordr){
		tick <- proc.time()
		fns[[i]]()
		tock <- proc.time() - tick
		sums[i] <- sums[i] + tock[3]
	}
	if(averages)
	    sums/n
	else
	    sums
}

fnAddRowByRbind <- function(){
     df <- data.frame(x=1:100, y=201:300)
     df <- rbind(df, c(101, 301))
}

fnAddRowByIndex <- function(){
     df <- data.frame(x=1:100, y=201:300)
     df[nrow(df)+1,] <- c(101, 301)
}

benchmark(fnAddRowRbind, fnAddRowIndex, n=100)

# Is the nrow() function slowing us down?  Let's try the following:

fnAddRowByIndexKnown <- function(){
     df <- data.frame(x=1:100, y=201:300)
     df[101,] <- c(101, 301)
}
