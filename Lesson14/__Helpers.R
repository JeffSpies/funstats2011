###############################################################################
# Title: PSYC 7765 - Lesson 14 - Helper functions
# Author: Jeffrey R. Spies (jspies@virginia.edu)
# History: date()
#   Fri Dec  2 12:08:10 2011 - Created file - JRS
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
